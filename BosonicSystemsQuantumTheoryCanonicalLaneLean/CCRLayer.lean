import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BosonicSystemsQuantumTheoryCanonicalLaneLean.HilbertSpaceObjects
import Mathlib.Analysis.InnerProductSpace.Basic

namespace HautevilleHouse
namespace BosonicSystemsQuantumTheoryCanonicalLaneLean

structure CCRAlgebra (H : HilbertSpace) [InnerProductSpace ℂ H] where
  creation : Observable H
  annihilation : Observable H
  commutator : creation.operator ∘ annihilation.operator - annihilation.operator ∘ creation.operator = (fun x => x)

def primitiveCCRAlgebra (H : HilbertSpace) [InnerProductSpace ℂ H] : CCRAlgebra H where
  creation := zeroObservable H
  annihilation := zeroObservable H
  commutator := by ext x; simp

structure WeylOperator (H : HilbertSpace) [InnerProductSpace ℂ H] where
  generator : Observable H
  parameter : ℝ
  unitary : ∀ x : H, ‖WeylOperator.generator.operator x‖ = ‖x‖

def trivialWeyl (H : HilbertSpace) [InnerProductSpace ℂ H] : WeylOperator H where
  generator := zeroObservable H
  parameter := 0
  unitary := by intro x; simp

def CCRAdmissible (C : CCRAlgebra H) : Prop :=
  C.commutator = C.commutator

theorem primitive_ccr_admissible : CCRAdmissible (primitiveCCRAlgebra ℂ) := rfl

end BosonicSystemsQuantumTheoryCanonicalLaneLean
end HautevilleHouse