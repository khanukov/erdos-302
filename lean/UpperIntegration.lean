import ArchiveGainPrefixTest
import UpperRenewal
import Projection
import CaseTreeTest
import ArchiveCase4Semantic
import ArchiveCase4StagedTest
import ArchiveTrim5Test
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
