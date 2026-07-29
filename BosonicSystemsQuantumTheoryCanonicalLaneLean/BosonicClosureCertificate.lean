import HautevilleHouse.BosonicSystemsQuantumTheoryCanonicalLaneLean.AdmissibleClass
import HautevilleHouse.BosonicSystemsQuantumTheoryCanonicalLaneLean.BosonicStateSpace
import HautevilleHouse.BosonicSystemsQuantumTheoryCanonicalLaneLean.BosonicObservables

namespace HautevilleHouse
namespace BosonicSystemsQuantumTheoryCanonicalLaneLean

structure BosonicAnalyticCertificate where
  stateSpaceClosed : BosonicStateSpaceClosed primitiveBosonicSystem
  spectralClosed : BosonicSpectralClosed sourceSpectralCertificate
  uncertaintyClosed : BosonicUncertaintyClosed sourceUncertaintyCertificate
  canonicalCarriageImported : Prop
  stateSpaceClosedProof : stateSpaceClosed
  spectralClosedProof : spectralClosed
  uncertaintyClosedProof : uncertaintyClosed
  canonicalCarriageImportedProof : canonicalCarriageImported

def sourceBosonicAnalyticCertificate : BosonicAnalyticCertificate := {
  stateSpaceClosed := primitive_bosonic_state_space_closed
  spectralClosed := source_spectral_closed
  uncertaintyClosed := source_uncertainty_closed
  canonicalCarriageImported := True
  stateSpaceClosedProof := primitive_bosonic_state_space_closed
  spectralClosedProof := source_spectral_closed
  uncertaintyClosedProof := source_uncertainty_closed
  canonicalCarriageImportedProof := trivial
}

def BosonicAnalyticCertificateClosed (C : BosonicAnalyticCertificate) : Prop :=
  C.stateSpaceClosed ∧ C.spectralClosed ∧ C.uncertaintyClosed ∧ C.canonicalCarriageImported

theorem source_bosonic_analytic_certificate_closed :
    BosonicAnalyticCertificateClosed sourceBosonicAnalyticCertificate := by
  exact And.intro sourceBosonicAnalyticCertificate.stateSpaceClosedProof
    (And.intro sourceBosonicAnalyticCertificate.spectralClosedProof
      (And.intro sourceBosonicAnalyticCertificate.uncertaintyClosedProof
        sourceBosonicAnalyticCertificate.canonicalCarriageImportedProof))

end BosonicSystemsQuantumTheoryCanonicalLaneLean
end HautevilleHouse
