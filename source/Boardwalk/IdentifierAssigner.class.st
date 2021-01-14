"
I'm responsible of the generation and assignment of identifiers to the web view using me.
"
Class {
	#name : #IdentifierAssigner,
	#superclass : #Object,
	#instVars : [
		'prefix',
		'identifierOptional',
		'shouldBeUsed',
		'wasApplied'
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

	shouldBeUsed then: [ aComponent id: ( self identifierOn: aCanvas ) ].
	wasApplied := true
]

{ #category : #configuring }
IdentifierAssigner >> beRequired [

	shouldBeUsed
		ifFalse: [ wasApplied
				ifTrue: [ AssertionFailed
						signal:
							'Identification requested after rendering was already started. Review view creation and configuration order. If a component renders its own container, and is created during the container rendering, the container must be sent `beIdentifiable` after its creation.'
					]
				ifFalse: [ shouldBeUsed := true ]
			]
]

{ #category : #configuring }
IdentifierAssigner >> identifierOn: aCanvas [

	self beRequired.
	^ identifierOptional
		withContentDo: [ :identifier | identifier ]
		ifUnused: [ | identifier |

			identifier := '<1s>-<2s>' expandMacrosWith: prefix greaseString with: aCanvas nextId greaseString.
			HTMLAsserter new assertIsValidIdentifier: identifier.
			identifierOptional := Optional containing: identifier.
			identifier
			]
]

{ #category : #initialization }
IdentifierAssigner >> initializePrefixedBy: aPrefix [

	wasApplied := false.
	prefix := aPrefix.
	shouldBeUsed := false.
	identifierOptional := Optional unusedBecause: 'The identifier was never assigned'
]
