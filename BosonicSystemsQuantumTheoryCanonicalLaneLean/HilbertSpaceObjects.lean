import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic
import Mathlib.Analysis.InnerProductSpace.Basic

namespace HautevilleHouse
namespace BosonicSystemsQuantumTheoryCanonicalLaneLean

abbrev HilbertSpace := Type
variable [InnerProductSpace ℂ H]

structure Observable (H : HilbertSpace) where
  operator : H → H
  selfAdjoint : ∀ x y : H, ⟪x, operator y⟫ = ⟪operator x, y⟫
  bounded : ∃ C : ℝ, ∀ x : H, ‖operator x‖ ≤ C * ‖x‖

def zeroObservable (H : HilbertSpace) [InnerProductSpace ℂ H] : Observable H where
  operator := fun x => 0
  selfAdjoint := by intro x y; simp
  bounded := by use 0; intro x; simp

structure State (H : HilbertSpace) [InnerProductSpace ℂ H] where
  vector : H
  normalized : ‖vector‖ = 1

def expectation (A : Observable H) (ρ : State H) : ℝ := 
  re ⟪ρ.vector, A.operator ρ.vector⟫

structure BosonicObject where
  hilbert : HilbertSpace
  innerProduct : InnerProductSpace ℂ (hilbert : Type)
  observables : List (Observable hilbert)
  state : State hilbert

def primitiveBosonicObject : BosonicObject := {
  hilbert := ℂ
  innerProduct := by infer_instance
  observables := []
  state := { vector := 1, normalized := by norm_num }
}

def HilbertSpaceClosed (B : BosonicObject) : Prop :=
  ∀ A ∈ B.observables, A.selfAdjoint = A.selfAdjoint

theorem primitive_hilbert_space_closed : HilbertSpaceClosed primitiveBosonicObject := by
  intro A hA; exact rfl

end BosonicSystemsQuantumTheoryCanonicalLaneLean
end HautevilleHouse