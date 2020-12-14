"
I'm responsible of the generation and assignment of identifiers to the web view using me.
"
Class {
	#name : #IdentifierAssigner,
	#superclass : #Object,
	#instVars : [
		'prefix',
		'identifierOptional'
	],
	#category : #'Boardwalk-WebApplication'
}

{ #category : #'Instance Creation' }
IdentifierAssigner class >> prefixedBy: aPrefix [

	AssertionChecker enforce: [ aPrefix notEmpty ] because: 'The supplied prefix cannot be empty' raising: InstanceCreationFailed.

	^ self new initializePrefixedBy: aPrefix
]

{ #category : #Accessing }
IdentifierAssigner >> assignedIdentifier [

	^ identifierOptional
		withContentDo: [ :id | id ]
		ifUnused: [ :explanations | AssertionFailed signalAll: explanations ]
]

{ #category : #Configuring }
IdentifierAssigner >> identifyIn: aCanvas [

	^ identifierOptional
		withContentDo: [ :identifier | identifier ]
		ifUnused: [ | identifier |

			identifier := '<1s>-<2s>' expandMacrosWith: prefix greaseString with: aCanvas nextId greaseString.
			HTMLAsserter new assertIsValidIdentifier: identifier.
			identifierOptional := Optional containing: identifier.
			identifier ]
]

{ #category : #initialization }
IdentifierAssigner >> initializePrefixedBy: aPrefix [

	prefix := aPrefix.
	identifierOptional := Optional unusedBecause: 'The identifier was never assigned'
]

{ #category : #Accessing }
IdentifierAssigner >> withAssignedIdentifierDo: aMonadycBlock [

	identifierOptional withContentDo: aMonadycBlock 
]
