*Boardwalk
ensureIdFor: aTagBrush

	aTagBrush id ifNil: [ aTagBrush id: ((IdentifierAssigner prefixedBy: aTagBrush tag) identifyIn: self) ]