Extension { #name : #WATagBrush }

{ #category : #'*Boardwalk' }
WATagBrush >> beIdentifiableUsing: anIdentifierAssigner [

	anIdentifierAssigner applyTo: self on: canvas
]

{ #category : #'*Boardwalk' }
WATagBrush >> classes: cssClasses [

	cssClasses do: [ :cssClass | self class: cssClass ]
]

{ #category : #'*Boardwalk' }
WATagBrush >> identifierOn: aCanvas [

	self ensureId.
	^ self id
]
