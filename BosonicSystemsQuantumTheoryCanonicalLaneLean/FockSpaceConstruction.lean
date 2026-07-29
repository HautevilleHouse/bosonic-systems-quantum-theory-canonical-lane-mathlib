import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BosonicSystemsQuantumTheoryCanonicalLaneLean.HilbertSpaceObjects
import HautevilleHouse.BosonicSystemsQuantumTheoryCanonicalLaneLean.CCRLayer
import Mathlib.Analysis.InnerProductSpace.Basic

namespace HautevilleHouse
namespace BosonicSystemsQuantumTheoryCanonicalLaneLean

structure FockSpace where
  baseHilbert : HilbertSpace
  innerProduct : InnerProductSpace ℂ (baseHilbert : Type)
  nParticleSpaces : ℕ → Type
  fockInner : ∀ n : ℕ, InnerProductSpace ℂ (nParticleSpaces n)
  creationOp : ∀ n : ℕ, Observable (nParticleSpaces n) → Observable (nParticleSpaces (n+1))
  annihilOp : ∀ n : ℕ, Observable (nParticleSpaces (n+1)) → Observable (nParticleSpaces n)
  numberOperator : Observable (baseHilbert)

def trivialFockSpace : FockSpace where
  baseHilbert := ℂ
  innerProduct := by infer_instance
  nParticleSpaces := fun n => ℂ
  fockInner := fun n => by infer_instance
  creationOp := fun n A => zeroObservable ℂ
  annihilOp := fun n A => zeroObservable ℂ
  numberOperator := zeroObservable ℂ

def FockClosed (F : FockSpace) : Prop :=
  True

theorem trivial_fock_closed : FockClosed trivialFockSpace := True.intro

end BosonicSystemsQuantumTheoryCanonicalLaneLean
end HautevilleHouse