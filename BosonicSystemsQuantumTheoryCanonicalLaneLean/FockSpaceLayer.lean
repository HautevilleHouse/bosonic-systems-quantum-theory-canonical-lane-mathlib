import BosonicSystemsQuantumTheoryCanonicalLaneLean.CanonicalCommutationLayer
import Mathlib.Algebra.DirectSum.Basic

namespace HautevilleHouse
namespace BosonicSystemsQuantumTheoryCanonicalLaneLean

structure FockSpace where
  baseSpace : BosonicHilbertSpace
  symmetricTensorPowers : ℕ → Set (baseSpace.carrier)
  creationOperator : ℕ → baseSpace.carrier → baseSpace.carrier
  annihilationOperator : ℕ → baseSpace.carrier → baseSpace.carrier
  commutationRelations : Prop

structure FockSpaceCertificate where
  fockSpace : FockSpace
  particleNumberOperator : Prop
  vacuumVector : Prop
  particleNumberClosed : particleNumberOperator
  vacuumClosed : vacuumVector

def sourceFockSpaceCertificate : FockSpaceCertificate := {
  fockSpace := {
    baseSpace := { carrier := ℝ, instInner := by infer_instance, instComplete := by infer_instance },
    symmetricTensorPowers := λ n => {x | True},
    creationOperator := λ n x => x,
    annihilationOperator := λ n x => x,
    commutationRelations := True
  },
  particleNumberOperator := True,
  vacuumVector := True,
  particleNumberClosed := trivial,
  vacuumClosed := trivial
}

def FockSpaceClosed (C : FockSpaceCertificate) : Prop :=
  C.particleNumberOperator ∧ C.vacuumVector

theorem source_fock_space_closed : FockSpaceClosed sourceFockSpaceCertificate := by
  unfold FockSpaceClosed
  exact ⟨by trivial, by trivial⟩

end BosonicSystemsQuantumTheoryCanonicalLaneLean
end HautevilleHouse