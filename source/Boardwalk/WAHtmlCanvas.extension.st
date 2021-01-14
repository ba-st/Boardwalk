Extension { #name : #WAHtmlCanvas }

{ #category : #'*Boardwalk' }
WAHtmlCanvas >> ensureIdFor: aTagBrush [

	aTagBrush id ifNil: [ aTagBrush id: ((IdentifierAssigner prefixedBy: aTagBrush tag) identifierOn: self) ]
]

{ #category : #'*Boardwalk' }
WAHtmlCanvas >> locate: aView [

	^ self jQuery id: ( aView identifierOn: self )
]
