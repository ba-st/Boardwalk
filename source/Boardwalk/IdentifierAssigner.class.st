"
I'm responsible of the generation and assignment of identifiers to the web view using me.
"
Class {
	#name : #IdentifierAssigner,
	#superclass : #Object,
	#instVars : [
		'prefix',
		'identifierOptional',
		'wasApplied',
		'isRequired'
	],
	#category : #'Boardwalk-WebApplication'
}

{ #category : #'Instance Creation' }
IdentifierAssigner class >> prefixedBy: aPrefix [

	AssertionChecker enforce: [ aPrefix notEmpty ] because: 'The supplied prefix cannot be empty' raising: InstanceCreationFailed.

	^ self new initializePrefixedBy: aPrefix
]

{ #category : #configuring }
IdentifierAssigner >> applyTo: aComponent on: aCanvas [

	isRequired then: [ aComponent id: ( self identifierOn: aCanvas ) ].
	wasApplied := true
]

{ #category : #accessing }
IdentifierAssigner >> assignedIdentifier [

	self beRequired.
	^ identifierOptional
		withContentDo: [ :identifier | identifier ]
		ifUnused: [ | identifier |

			identifier := '<1s>-<2s>' expandMacrosWith: prefix with: UUID new asString.
			HTMLAsserter new assertIsValidIdentifier: identifier.
			identifierOptional := Optional containing: identifier.
			identifier
			]
]

{ #category : #configuring }
IdentifierAssigner >> beRequired [

	[ wasApplied then: [ self signalAlreadyApplied ] otherwise: [ isRequired := true ] ]
		unless: isRequired
]

{ #category : #configuring }
IdentifierAssigner >> identifierOn: aCanvas [

	^ self assignedIdentifier
]

{ #category : #initialization }
IdentifierAssigner >> initializePrefixedBy: aPrefix [

	wasApplied := false.
	prefix := aPrefix.
	isRequired := false.
	identifierOptional := Optional unusedBecause: 'The identifier was never assigned'
]

{ #category : #private }
IdentifierAssigner >> signalAlreadyApplied [

	^ AssertionFailed
		signal:
			'Identification requested after rendering was already started. Review view creation and configuration order. If a component renders its own container, and is created during the container rendering, the container must be sent `beIdentifiable` after its creation.'
]
