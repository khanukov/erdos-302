import FullLocal0000

/- Candidate bounded smoke test, not a replay of the shard. -/
namespace FullLocalFirstShardTest

set_option maxRecDepth 100000 in
theorem node0_valid : MixedDag.Check FullLocalShards.extraCheck FullLocalShards.S0.nodes 0 := by
  -- Reduce the concrete node first, retaining SmallCheck's computational instance.
  change ArchiveDag.SmallCheck ({2, 3, 6} : Finset ℕ) 1
  decide

set_option maxRecDepth 1000000 in
theorem node0_bound : Extended.Bound (FullLocalShards.S0.nodes 0).support
    (FullLocalShards.S0.nodes 0).demand := by
  apply MixedDagLocality.sound_one FullLocalAssemblyCandidate.extraCheck
    FullLocalAssemblyCandidate.extraReads FullLocalAssemblyCandidate.extra_sound
    FullLocalShards.S0.nodes 0 node0_valid
  intro j hj
  simp [FullLocalShards.S0.nodes, MixedDagLocality.Reads] at hj

#print axioms node0_valid
#print axioms node0_bound
end FullLocalFirstShardTest
