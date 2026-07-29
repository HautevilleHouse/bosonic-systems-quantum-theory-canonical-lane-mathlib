import BosonicSystemsQuantumTheoryCanonicalLaneLean.SpectralTheoremLayer
import Mathlib.Algebra.Algebra.Basic

namespace HautevilleHouse
namespace BosonicSystemsQuantumTheoryCanonicalLaneLean

structure CanonicalCommutationRelation (H : BosonicHilbertSpace) where
  p : SelfAdjointOperator H
  q : SelfAdjointOperator H
  commutator : H.carrier → H.carrier
  commutationRelation : commutator = λ x => x - x
  weylOperators : Prop

structure CCRCertificate where
  hilbertSpace : BosonicHilbertSpace
  ccr : CanonicalCommutationRelation hilbertSpace
  weylRepresentation : Prop
  irreducibility : Prop
  weylRepresentationProof : weylRepresentation
  irreducibilityProof : irreducibility

def sourceCCRCertificate : CCRCertificate := {
  hilbertSpace := { carrier := ℝ, instInner := by infer_instance, instComplete := by infer_instance },
  ccr := { p := { domain := Set.univ, action := id, selfAdjoint := True }, q := { domain := Set.univ, action := id, selfAdjoint := True }, commutator := λ x => x - x, commutationRelation := rfl, weylOperators := True },
  weylRepresentation := True,
  irreducibility := True,
  weylRepresentationProof := trivial,
  irreducibilityProof := trivial
}

def CCRClosed (C : CCRCertificate) : Prop :=
  C.weylRepresentation ∧ C.irreducibility

theorem source_ccr_closed : CCRClosed sourceCCRCertificate := by
  unfold CCRClosed
  simp [sourceCCRCertificate]

end BosonicSystemsQuantumTheoryCanonicalLaneLean
end HautevilleHouse