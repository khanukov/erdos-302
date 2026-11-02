import EndpointPremisesCandidateTests
import DensityPrefixCandidateTests
import HGainCandidateTest
import ArchiveIndexedGainEndpointTest
import ArchiveGainPrefixTest
import UpperRenewal
import Projection
import CaseTreeTest
import ArchiveCase4Semantic
import ArchiveCase4StagedTest
import ArchiveTrim5Test
import ArchiveTrim8Test
import ArchiveCase7StagedTest
import ArchiveNextSmallTest
import DagForceTests
import Pack1094Shard
import PackShardTests
import CellEquivalenceTests
import ScalingTest
import RoughCountTest
import RoughIntersectionTests
import RoughFinalTests
import RoughRoundingTests
import RoughDiscrepancyTests
import SumBridgeTest
import SmoothCoverTest
import RoughCoprimeTest
import RenewalUnrollTest
import LocalBlockDemandTests
import PrimePowerReindexTest
import PrimePowerSum
import PrimePowerRenewalTest
import BankProfileTests
import ArchiveSmallPrefixTest
import PrefixArchiveBridgeTests
import ExactComparison
import ArchiveLedgerSumBridge
import ArchiveErrorMatchCandidateTests
import ArchiveIndexedEndpointTests
import LedgerTests
import GainPrefixTest

/-! Integration is a collection of partial results, not an endpoint theorem. -/
#print axioms UpperBridge.finite_card_bound
#print axioms ArchiveSumBridge.boundaryOK_of_pos
#print axioms ArchiveSumBridge.global_upper_archive
#print axioms SmoothPartition.global_from_prefix_demands
#print axioms PrimePowerReindex.bounded_decomposition
#print axioms PrimePowerSum.sum_reindex
#print axioms PrimePowerRenewal.sum_unroll
#print axioms PrimePowerRenewal.sum_update

#print axioms BankProfile.checked_node_seed
#print axioms BankProfileConcrete.full_prefix
#print axioms ArchiveSmallPrefix.valid
#print axioms ArchiveSmallPrefix.sound
#print axioms ArchiveCase4Staged.image0
#print axioms ArchiveCase4Staged.image1
#print axioms ArchiveCase4Staged.image2
#print axioms ArchiveCase4Staged.bound4
#print axioms ArchiveCase4Staged.sound
#print axioms ArchiveTrim5.all_edges_retained
#print axioms ArchiveTrim5.witnesses_valid
#print axioms ArchiveTrim5.every_retained_has_witness
#print axioms ArchiveTrim5.isolated_trim
#print axioms ArchiveTrim5.image3_bound
#print axioms ArchiveTrim5.bound5
#print axioms ArchiveTrim5.sound
#print axioms ArchiveNextSmall.bound6
#print axioms ArchiveNextSmall.sound
#print axioms ArchiveNextSmallTest.overstated_rejected
#print axioms PrefixArchiveBridge.cells_le_prefix
#print axioms PrefixArchiveBridge.upper_from_prefix

#print axioms ArchiveLedger.archive_check
#print axioms ArchiveLedger.archive_valid
#print axioms ArchiveLedger.archive_arithmetic
#print axioms ArchiveLedgerSumBridge.ledger_gain_complement
#print axioms ArchiveLedgerSumBridge.ledger_error_real
#print axioms ArchiveLedgerSumBridge.conditional_literal_endpoint
#print axioms ArchiveLedgerSumBridge.conditional_indexed_endpoint

#print axioms GainFold.fold_gain_occurrences
#print axioms GainFold.fold_gain_fin
#print axioms GainFold.fold_project
#print axioms GainPrefix.occurrences_eq_prefix_entries
#print axioms GainPrefix.fold_eq_prefix_entries

#print axioms ArchiveGainPrefix.distribute
#print axioms ArchiveGainPrefix.step_project
#print axioms ArchiveGainPrefix.project_fold
#print axioms ArchiveGainPrefix.gain_eq_prefix

#print axioms ArchiveErrorMatchCandidate.entries_error
#print axioms ArchiveErrorMatchCandidate.occurrence_error
#print axioms ArchiveErrorMatchCandidate.indexed_error
#print axioms ArchiveLedgerSumBridge.indexed_endpoint_no_error

#print axioms ArchiveTrim8.all_edges_retained
#print axioms ArchiveTrim8.target_subset
#print axioms ArchiveTrim8.witnesses_valid
#print axioms ArchiveTrim8.every_retained_has_witness
#print axioms ArchiveTrim8.image7_eq
#print axioms ArchiveTrim8.image7_bound
#print axioms ArchiveTrim8.bound8
#print axioms ArchiveTrim8Test.replay_bound

#print axioms ArchiveCase7.check_valid
#print axioms ArchiveCase7Staged.image0
#print axioms ArchiveCase7Staged.image1
#print axioms ArchiveCase7Staged.image2
#print axioms ArchiveCase7Staged.image3
#print axioms ArchiveCase7Staged.bound7
#print axioms ArchiveCase7StagedTest.replay_bound

#print axioms DensityPrefixCandidate.primes_nodup
#print axioms DensityPrefixCandidate.all_prefixes_nodup
#print axioms DensityPrefixCandidate.entry_prefixes
#print axioms DensityPrefixCandidate.rational_prefixes
#print axioms DensityPrefixCandidate.real_prefix
#print axioms DensityPrefixCandidate.indexed_density
#print axioms DensityPrefixCandidate.indexed_density_direct
#print axioms HGainCandidate.entries_match
#print axioms HGainCandidate.gain_list
#print axioms HGainCandidate.gain_fin
#print axioms HGainCandidate.indexed_hgain
#print axioms ArchiveLedgerSumBridge.indexed_endpoint_no_error_no_gain

#print axioms EndpointPremisesCandidate.literal_cell_bounds
#print axioms EndpointPremisesCandidate.literal_prefix_inputs
#print axioms EndpointPremisesCandidate.indexed_a_pos
#print axioms EndpointPremisesCandidate.indexed_a_lt_b
#print axioms EndpointPremisesCandidate.indexed_b_pos
#print axioms EndpointPremisesCandidate.indexed_quotient_order
#print axioms EndpointPremisesCandidate.indexed_prime
#print axioms EndpointPremisesCandidate.indexed_density_bounds
#print axioms EndpointPremisesCandidate.indexed_budget
#print axioms EndpointPremisesCandidate.endpoint_of_cover
