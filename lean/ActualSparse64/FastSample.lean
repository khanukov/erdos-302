import SparseBoundaryFast
import ActualSparse64.Data

namespace ActualSparse64
def mask : Nat := 91052749801197757631854608149352024825489175050810204486112420755354361529448240711796761622923597032638369937689575124074686829648734133620311040443040695959627636716470015957093474702255661753594009792420291703707163722566170581970023639205622402678372102493309235794953085282733479323436925495656920178108234825315481440401455732110341453144432175733380863184228848218954350624053479805575929199891728041740355040680397864963057275385818055358738015022927798350780706793479565657939205257075293057905008082889848252612875287332857166862784713934738807523216575252398076
def lookup (n : Nat) : Bool := mask.testBit n
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000
theorem lookup_all : S.all lookup = true := by decide
theorem pair118 : SparseBoundaryFast.pairs S lookup D 118 = true := by decide

theorem source_lookup (x : Nat) (hx : x ∈ S) : lookup x = true :=
  List.all_eq_true.mp lookup_all x hx

theorem vertex118 (a b c : Nat) (ha : a ∈ S) (hb : b ∈ S)
    (hc : c ∈ S) (he : SparseTriple.edge a b c)
    (hv : a = 118 ∨ b = 118 ∨ c = 118) :
    a ∈ D ∨ b ∈ D ∨ c ∈ D := by
  apply SparseBoundaryFast.pairs_sound S D lookup 118 source_lookup (by decide) pair118
  exact ha
  exact hb
  exact hc
  exact he
  exact hv

theorem shard118 : SparseBoundaryShards.shard S D 118 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 118 source_lookup (by decide) pair118

-- Mutation: no deletion cannot cover this vertex's actual edges.
example : SparseBoundaryFast.pairs S lookup [] 118 = false := by decide
#print axioms vertex118
#print axioms shard118
end ActualSparse64
