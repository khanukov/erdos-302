import ArchiveLedger

example : ArchiveLedger.check ArchiveLedger.ledger = true := ArchiveLedger.archive_check
example : ArchiveLedger.Valid ArchiveLedger.ledger := ArchiveLedger.archive_valid
example : ArchiveLedger.Arithmetic ArchiveLedger.ledger := ArchiveLedger.archive_arithmetic
#print axioms ArchiveLedger.archive_check
#print axioms ArchiveLedger.archive_valid
#print axioms ArchiveLedger.archive_arithmetic
