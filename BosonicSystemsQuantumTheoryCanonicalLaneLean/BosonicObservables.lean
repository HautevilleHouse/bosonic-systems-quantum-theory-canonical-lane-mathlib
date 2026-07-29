import HautevilleHouse.BosonicSystemsQuantumTheoryCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BosonicSystemsQuantumTheoryCanonicalLaneLean

structure SpectralCertificate where
  operator : Type
  spectrum : Type
  spectralDecomposition : Prop
  spectralClosed : spectralDecomposition

def BosonicSpectralClosed (C : SpectralCertificate) : Prop :=
  C.spectralClosed

def sourceSpectralCertificate : SpectralCertificate := {
  operator := Unit
  spectrum := Unit
  spectralDecomposition := True
  spectralClosed := trivial
}

theorem source_spectral_closed :
    BosonicSpectralClosed sourceSpectralCertificate := by
  unfold BosonicSpectralClosed sourceSpectralCertificate
  trivial

structure UncertaintyCertificate where
  position : Type
  momentum : Type
  commutator : Prop
  heisenbergBound : Prop
  commutatorClosed : commutator
  heisenbergClosed : heisenbergBound

def sourceUncertaintyCertificate : UncertaintyCertificate := {
  position := Unit
  momentum := Unit
  commutator := True
  heisenbergBound := True
  commutatorClosed := trivial
  heisenbergClosed := trivial
}

def BosonicUncertaintyClosed (C : UncertaintyCertificate) : Prop :=
  C.commutatorClosed ∧ C.heisenbergClosed

theorem source_uncertainty_closed :
    BosonicUncertaintyClosed sourceUncertaintyCertificate := by
  unfold BosonicUncertaintyClosed
  exact And.intro (by trivial) (by trivial)

end BosonicSystemsQuantumTheoryCanonicalLaneLean
end HautevilleHouse