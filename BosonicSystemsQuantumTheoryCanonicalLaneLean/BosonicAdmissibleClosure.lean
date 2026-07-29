import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BosonicSystemsQuantumTheoryCanonicalLaneLean.HilbertSpaceObjects
import HautevilleHouse.BosonicSystemsQuantumTheoryCanonicalLaneLean.CCRLayer
import HautevilleHouse.BosonicSystemsQuantumTheoryCanonicalLaneLean.FockSpaceConstruction
import HautevilleHouse.BosonicSystemsQuantumTheoryCanonicalLaneLean.BogoliubovLayer
import HautevilleHouse.BosonicSystemsQuantumTheoryCanonicalLaneLean.BosonicSpectralTheorem

namespace HautevilleHouse
namespace BosonicSystemsQuantumTheoryCanonicalLaneLean

structure BosonicAnalyticCertificate where
  hilbertClosed : HilbertSpaceClosed primitiveBosonicObject
  ccrAdmitted : CCRAdmissible (primitiveCCRAlgebra ℂ)
  fockClosed : FockClosed trivialFockSpace
  bogoliubovClosed : BogoliubovClosed (identityBogoliubov ℂ)
  spectralClosed : SpectralClosed primitiveSpectralTheoremCertificate

def sourceBosonicCertificate : BosonicAnalyticCertificate := {
  hilbertClosed := primitive_hilbert_space_closed
  ccrAdmitted := primitive_ccr_admissible
  fockClosed := trivial_fock_closed
  bogoliubovClosed := identity_bogoliubov_closed
  spectralClosed := primitive_spectral_closed
}

def BosonicAdmissibleClosure (C : BosonicAnalyticCertificate) : Prop :=
  C.hilbertClosed ∧ C.ccrAdmitted ∧ C.fockClosed ∧ C.bogoliubovClosed ∧ C.spectralClosed

theorem source_bosonic_admissible_closure : BosonicAdmissibleClosure sourceBosonicCertificate := by
  exact And.intro sourceBosonicCertificate.hilbertClosed
    (And.intro sourceBosonicCertificate.ccrAdmitted
      (And.intro sourceBosonicCertificate.fockClosed
        (And.intro sourceBosonicCertificate.bogoliubovClosed
          sourceBosonicCertificate.spectralClosed)))

end BosonicSystemsQuantumTheoryCanonicalLaneLean
end HautevilleHouse