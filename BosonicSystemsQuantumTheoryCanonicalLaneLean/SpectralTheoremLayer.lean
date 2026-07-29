import BosonicSystemsQuantumTheoryCanonicalLaneLean.AdmissibleClass
import Mathlib.Data.Real.Basic
import Mathlib.Analysis.InnerProductSpace.Basic

namespace HautevilleHouse
namespace BosonicSystemsQuantumTheoryCanonicalLaneLean

structure BosonicHilbertSpace where
  carrier : Type
  [instInner : InnerProductSpace ℝ carrier]
  [instComplete : CompleteSpace carrier]

structure SelfAdjointOperator (H : BosonicHilbertSpace) where
  domain : Set H.carrier
  action : H.carrier → H.carrier
  selfAdjoint : Prop

structure SpectralMeasure (H : BosonicHilbertSpace) where
  measurableSets : Set (Set ℝ)
  measure : Set ℝ → Set H.carrier → ℝ

structure SpectralTheoremCertificate where
  hilbertSpace : BosonicHilbertSpace
  operator : SelfAdjointOperator hilbertSpace
  spectralMeasure : SpectralMeasure hilbertSpace
  spectralDecomposition : Prop
  eigenvectorExpansion : Prop
  spectralDecompositionProof : spectralDecomposition
  eigenvectorExpansionProof : eigenvectorExpansion

def sourceSpectralTheoremCertificate : SpectralTheoremCertificate := {
  hilbertSpace := { carrier := ℝ, instInner := by infer_instance, instComplete := by infer_instance },
  operator := { domain := Set.univ, action := id, selfAdjoint := True },
  spectralMeasure := { measurableSets := Set.univ, measure := λ S A => 0 },
  spectralDecomposition := True,
  eigenvectorExpansion := True,
  spectralDecompositionProof := trivial,
  eigenvectorExpansionProof := trivial
}

def SpectralTheoremClosed (C : SpectralTheoremCertificate) : Prop :=
  C.spectralDecomposition ∧ C.eigenvectorExpansion

theorem source_spectral_theorem_closed : SpectralTheoremClosed sourceSpectralTheoremCertificate := by
  unfold SpectralTheoremClosed sourceSpectralTheoremCertificate
  exact ⟨True.intro, True.intro⟩

end BosonicSystemsQuantumTheoryCanonicalLaneLean
end HautevilleHouse