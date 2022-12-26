"
I'm responsible of the generation and assignment of identifiers to the web view using me.
"
Class {
	#name : #IdentifierAssigner,
	#superclass : #Object,
	#instVars : [
		'identifierOptional',
		'wasApplied',
		'isRequired',
		'getIdentifierBlock'
	],
	#category : #'Boardwalk-WebApplication'
}

{ #category : #'Instance Creation' }
IdentifierAssigner class >> assigningAlways: anIndentifier [

	^ self resolvingIdentifierWith: [ :canvas | anIndentifier ]
]

{ #category : #'Instance Creation' }
IdentifierAssigner class >> prefixedBy: aPrefix [

	AssertionChecker
		enforce: [ aPrefix notEmpty ]
		because: 'The supplied prefix cannot be empty'
		raising: InstanceCreationFailed.

	^ self resolvingIdentifierWith: [ :canvas | 
		  '<1s>-<2s>'
			  expandMacrosWith: aPrefix greaseString
			  with: canvas nextId greaseString ]
]

{ #category : #private }
IdentifierAssigner class >> resolvingIdentifierWith: aGetIdentifierBlock [

	^ self new initializeResolvingIdentifierWith: aGetIdentifierBlock
]

{ #category : #configuring }
IdentifierAssigner >> applyTo: aComponent on: aCanvas [

	isRequired then: [ aComponent id: ( self identifierOn: aCanvas ) ].
	wasApplied := true
]

{ #category : #configuring }
IdentifierAssigner >> beRequired [

	[ wasApplied then: [ self signalAlreadyApplied ] otherwise: [ isRequired := true ] ]
		unless: isRequired
]

{ #category : #accessing }
IdentifierAssigner >> identifierOn: aCanvas [

	self beRequired.
	^ identifierOptional
		  withContentDo: [ :identifier | 
			  aCanvas nextId.
			  identifier ]
		  ifUnused: [ 
			  | identifier |
			  identifier := getIdentifierBlock cull: aCanvas.
			  HTMLAsserter new assertIsValidIdentifier: identifier.
			  identifierOptional := Optional containing: identifier.
			  identifier ]

]

{ #category : #initialization }
IdentifierAssigner >> initializeResolvingIdentifierWith: aGetIdentifierBlock [

	wasApplied := false.
	isRequired := false.
	identifierOptional := Optional unusedBecause: 'The identifier was never assigned'.
	getIdentifierBlock := aGetIdentifierBlock
]

{ #category : #private }
IdentifierAssigner >> signalAlreadyApplied [

	^ AssertionFailed
		signal:
			'Identification requested after rendering was already started. Review view creation and configuration order. If a component renders its own container, and is created during the container rendering, the container must be sent `beIdentifiable` after its creation.'
]
