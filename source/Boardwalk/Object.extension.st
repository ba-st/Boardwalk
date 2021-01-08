Extension { #name : #Object }

{ #category : #'*Boardwalk' }
Object >> asArrowFunction [

	^self asArrowFunction: #()
]

{ #category : #'*Boardwalk' }
Object >> asArrowFunction: aCollection [

	^ JSArrowFunction new
		add: self;
		arguments: aCollection;
		yourself
]
