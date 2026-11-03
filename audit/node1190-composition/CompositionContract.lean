import Composition

example : (Node1209Dense.nodes 336).support ⊆
    (Node1209RootDense.nodes 375).support := Node1190Composition.support_subset
example : Extended.Bound (Node1209RootDense.nodes 375).support 258 :=
  Node1190Composition.root_bound
example : Extended.Bound ExtensionFirstArchive.source 258 := Node1190Composition.source_bound
example : Extended.Bound ExtensionFirstArchive.target 242 := Node1190Composition.target_bound
#print axioms Node1190Composition.support_subset
#print axioms Node1190Composition.root_bound
#print axioms Node1190Composition.source_bound
#print axioms Node1190Composition.target_bound
