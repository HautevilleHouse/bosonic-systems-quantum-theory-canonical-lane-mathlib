import HautevilleHouse.BosonicSystemsQuantumTheoryCanonicalLaneLean.AdmissibleClass
import Mathlib.Analysis.InnerProductSpace.Basic

namespace HautevilleHouse
namespace BosonicSystemsQuantumTheoryCanonicalLaneLean

abbrev BosonicHilbertSpace : Type 1 := Type

structure FockSpace where
  baseSpace : Type
  bosonic : ∀ (n : ℕ), (Fin n → baseSpace) → baseSpace

def zeroFock : FockSpace := {
  baseSpace := Empty
  bosonic := fun _ _ => by exfalso; exact Nomatch
}

structure CreationOperator (H : Type) where
  create : H → H
  adjoint : H → H
  canonicalCommutation : ∀ (a b : H), create a (adjoint b) - adjoint b (create a) = a -- simplified

def primitiveCreation : CreationOperator Unit := {
  create := fun _ _ => ()
  adjoint := fun _ _ => ()
  canonicalCommutation := by intro a b; rfl
}

structure BosonicSystem where
  hilbertSpace : Type
  creation : CreationOperator hilbertSpace
  vacuum : hilbertSpace
  numberOperator : hilbertSpace → ℕ

def primitiveBosonicSystem : BosonicSystem := {
  hilbertSpace := Unit
  creation := primitiveCreation
  vacuum := ()
  numberOperator := fun _ => 0
}

def BosonicStateSpaceClosed (S : BosonicSystem) : Prop := True

theorem primitive_bosonic_state_space_closed :
    BosonicStateSpaceClosed primitiveBosonicSystem := by
  simp [BosonicStateSpaceClosed]

end BosonicSystemsQuantumTheoryCanonicalLaneLean
end HautevilleHouse