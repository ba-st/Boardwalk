"
I'm responsible of the generation and assignment of identifiers to the web view using me.
"
Class {
	#name : #IdentifierAssigner,
	#superclass : #Object,
	#instVars : [
		'prefix',
		'identifierOptional',
		'shouldBeUsed'
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

	shouldBeUsed then: [ aComponent id: ( self identifierOn: aCanvas ) ]
]

{ #category : #configuring }
IdentifierAssigner >> beRequiredAfterRendering [

	[ AssertionFailed
		signal: 'Identification requested after rendering was already started. Review initialization order'
	] unless: shouldBeUsed
]

{ #category : #configuring }
IdentifierAssigner >> beRequiredBeforeRendering [

	shouldBeUsed := true
]

{ #category : #configuring }
IdentifierAssigner >> identifierOn: aCanvas [

	shouldBeUsed := true.
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

	prefix := aPrefix.
	shouldBeUsed := false.
	identifierOptional := Optional unusedBecause: 'The identifier was never assigned'
]
