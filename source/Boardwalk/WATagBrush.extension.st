Extension { #name : #WATagBrush }

{ #category : #'*Boardwalk' }
WATagBrush >> classes: cssClasses [

	cssClasses do: [ :cssClass | self class: cssClass ]
]

{ #category : #'*Boardwalk' }
WATagBrush >> identifier [

	^ self id
		ifNil: [ AssertionFailed signal: 'The identifier was never assigned' ]
		ifNotNil: [ :id | id ]
]

{ #category : #'*Boardwalk' }
WATagBrush >> identifyIn: aCanvas [

	self ensureId 
]
