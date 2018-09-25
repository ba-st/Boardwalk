"
I'm responsible of the generation and assignment of identifiers to the web view using me.
"
Class {
	#name : #IdentifierAssigner,
	#superclass : #Object,
	#instVars : [
		'prefix',
		'identifierHolder'
	],
	#category : 'Boardwalk-WebApplication'
}

{ #category : #'Instance Creation' }
IdentifierAssigner class >> prefixedBy: aPrefix [

	AssertionChecker enforce: [ aPrefix notEmpty ] because: 'The supplied prefix cannot be empty' raising: InstanceCreationFailed.

	^ self new initializePrefixedBy: aPrefix
]

{ #category : #Accessing }
IdentifierAssigner >> assignedIdentifier [

	^ identifierHolder
		withContentDo: [ :id | id ]
		ifUnused: [ :explanations | AssertionFailed signalAll: explanations ]
]

{ #category : #Configuring }
IdentifierAssigner >> identifyIn: aCanvas [

	^ identifierHolder
		withContentDo: [ :identifier | identifier ]
		ifUnused: [ | identifier |

			identifier := '<1s>-<2s>' expandMacrosWith: prefix greaseString with: aCanvas nextId greaseString.
			HTMLAsserter new assertIsValidIdentifier: identifier.
			identifierHolder := Optional containing: identifier.
			identifier ]
]

{ #category : #initialization }
IdentifierAssigner >> initializePrefixedBy: aPrefix [

	prefix := aPrefix.
	identifierHolder := Optional unusedBecause: 'The identifier was never assigned'
]

{ #category : #Accessing }
IdentifierAssigner >> withAssignedIdentifierDo: aMonadycBlock [

	identifierHolder withContentDo: aMonadycBlock 
]
