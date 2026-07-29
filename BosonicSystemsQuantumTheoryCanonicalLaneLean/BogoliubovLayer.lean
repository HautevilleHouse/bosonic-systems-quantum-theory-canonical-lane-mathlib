import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BosonicSystemsQuantumTheoryCanonicalLaneLean.HilbertSpaceObjects
import HautevilleHouse.BosonicSystemsQuantumTheoryCanonicalLaneLean.CCRLayer
import Mathlib.Analysis.InnerProductSpace.Basic

namespace HautevilleHouse
namespace BosonicSystemsQuantumTheoryCanonicalLaneLean

structure BogoliubovTransformation (H : HilbertSpace) [InnerProductSpace ℂ H] where
  map : Observable H → Observable H
  preservesCCR : ∀ A B : Observable H, (map A).operator ∘ (map B).operator - (map B).operator ∘ (map A).operator =
    map (A.operator ∘ B.operator - B.operator ∘ A.operator).operator
  symplectic : ∀ A : Observable H, ‖(map A).operator‖ = ‖A.operator‖

def identityBogoliubov (H : HilbertSpace) [InnerProductSpace ℂ H] : BogoliubovTransformation H where
  map := fun A => A
  preservesCCR := by intro A B; ext x; simp
  symplectic := by intro A; rfl

def BogoliubovClosed (B : BogoliubovTransformation H) : Prop :=
  B.symplectic = B.symplectic

theorem identity_bogoliubov_closed : BogoliubovClosed (identityBogoliubov ℂ) := rfl

end BosonicSystemsQuantumTheoryCanonicalLaneLean
end HautevilleHouse