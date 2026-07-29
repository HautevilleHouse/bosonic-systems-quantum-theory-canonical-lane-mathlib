import CanonicalLaneMathlibCore
import Mathlib.Data.Set.Basic

namespace HautevilleHouse
namespace BosonicSystemsQuantumTheoryCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

def sourceRepository : String := "bosonic-systems-quantum-theory-canonical-lane"
def sourceDescription : String := "Canonical lane for Bosonic Systems Quantum Theory: spectral theorem, CCR, Fock space, free field closure."
def sourceTheoremBoundary : String := "Classical mathematical physics boundary for bosonic quantum theory."

structure TheoremSpecificObject where
  sourceKey : String
  theoremObject : String
  claimBoundary : String
deriving Repr, DecidableEq

structure AdmittedTheoremObject where
  object : TheoremSpecificObject
  localWitness : String
  bridgeEvidence : String
  sourceKeyChecked : object.sourceKey = sourceRepository
  theoremObjectChecked : object.theoremObject = sourceDescription

def theoremSpecificObject : TheoremSpecificObject := {
  sourceKey := sourceRepository,
  theoremObject := sourceDescription,
  claimBoundary := sourceTheoremBoundary
}

def NativeBridgeClosed (O : AdmittedTheoremObject) : Prop :=
  O.object.sourceKey = sourceRepository ∧ O.object.theoremObject = sourceDescription

end BosonicSystemsQuantumTheoryCanonicalLaneLean
end HautevilleHouse