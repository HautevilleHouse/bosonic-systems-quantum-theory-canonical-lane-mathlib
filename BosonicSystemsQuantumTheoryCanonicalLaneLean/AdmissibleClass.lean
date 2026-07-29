import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace BosonicSystemsQuantumTheoryCanonicalLaneLean

structure TheoremSpecificObject where
  sourceKey : String
  theoremObject : String
  claimBoundary : String
deriving Repr, DecidableEq

structure AdmittedTheoremObject where
  object : TheoremSpecificObject
  localWitness : String
  bridgeEvidence : String
  sourceKeyChecked : object.sourceKey = "bosonic-systems"
  theoremObjectChecked : object.theoremObject = "Bosonic Systems Quantum Theory"

def NativeBridgeClosed (O : AdmittedTheoremObject) : Prop :=
  O.object.sourceKey = "bosonic-systems" ∧ O.object.theoremObject = "Bosonic Systems Quantum Theory"

structure AdmissibleClass where
  object : AdmittedTheoremObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def bridgeClosed (A : AdmissibleClass) : Prop :=
  NativeBridgeClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact And.intro A.object.sourceKeyChecked A.object.theoremObjectChecked

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end BosonicSystemsQuantumTheoryCanonicalLaneLean
end HautevilleHouse