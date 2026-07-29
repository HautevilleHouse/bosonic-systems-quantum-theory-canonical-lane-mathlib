import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BosonicSystemsQuantumTheoryCanonicalLaneLean.HilbertSpaceObjects
import Mathlib.Analysis.InnerProductSpace.Basic
import Mathlib.MeasureTheory.MeasureTheory

namespace HautevilleHouse
namespace BosonicSystemsQuantumTheoryCanonicalLaneLean

structure SpectralMeasure (H : HilbertSpace) [InnerProductSpace ℂ H] where
  measure : Set ℝ → Observable H
  projectionValued : ∀ Δ : Set ℝ, (measure Δ).selfAdjoint ∧ (measure Δ).operator ∘ (measure Δ).operator = (measure Δ).operator

def trivialSpectralMeasure (H : HilbertSpace) [InnerProductSpace ℂ H] : SpectralMeasure H where
  measure := fun _ => zeroObservable H
  projectionValued := by
    intro Δ; refine ⟨?_, ?_⟩
    · intro x y; simp
    · ext x; simp

structure SpectralTheoremCertificate (H : HilbertSpace) [InnerProductSpace ℂ H] where
  operator : Observable H
  spectralMeasure : SpectralMeasure H
  functionalCalculus : ℝ → Observable H
  spectralDecomposition : ∀ x : H, operator.operator x = ∫ λ, spectralMeasure.measure {λ} λ

def primitiveSpectralTheoremCertificate : SpectralTheoremCertificate ℂ where
  operator := zeroObservable ℂ
  spectralMeasure := trivialSpectralMeasure ℂ
  functionalCalculus := fun r => zeroObservable ℂ
  spectralDecomposition := by intro x; simp

def SpectralClosed (C : SpectralTheoremCertificate H) : Prop :=
  C.operator.selfAdjoint

theorem primitive_spectral_closed : SpectralClosed (primitiveSpectralTheoremCertificate) := rfl

end BosonicSystemsQuantumTheoryCanonicalLaneLean
end HautevilleHouse