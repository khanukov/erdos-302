import RenewalConcreteOccurrence
import OccurrenceIndexTests
import RenewalPointwiseAllocationTests
import RenewalMultiplicityCandidateTests

open RenewalOccurrenceIndex RenewalConcreteOccurrence

example : RenewalMultiplicityCandidate.expansion (fun _ => 2) (fun _ _ => 1) 1 2 = 2 := by decide
example : RenewalMultiplicityCandidate.expansion (fun _ => 2) (fun _ _ => 1) 1 2 =
    ((occurrences (fun _ => 1) 1 2).map (fun a => (fun _ _ => 1) a.level a.arg)).sum := by
  exact index_expansion _ _ _ _
