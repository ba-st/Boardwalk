Class {
	#name : #IdentifierAssignerTest,
	#superclass : #TestCase,
	#instVars : [
		'idOptional'
	],
	#category : #'Boardwalk-Tests-WebApplication'
}

{ #category : #'test support' }
IdentifierAssignerTest >> id: anId [

	idOptional := Optional containing: anId
]

{ #category : #'test support' }
IdentifierAssignerTest >> nextId [

	^ '123'
]

{ #category : #running }
IdentifierAssignerTest >> setUp [

	super setUp.
	idOptional := Optional unused
]

{ #category : #test }
IdentifierAssignerTest >> testApplyToOn [

	| assigner |

	assigner := IdentifierAssigner prefixedBy: 'table'.
	assigner applyTo: self on: self.
	idOptional withContentDo: [ self fail ]
]

{ #category : #test }
IdentifierAssignerTest >> testBeRequired [

	| assigner |

	assigner := IdentifierAssigner prefixedBy: 'table'.
	assigner beRequired.
	assigner applyTo: self on: self.
	idOptional withContentDo: [ :id | self assert: id equals: 'table-123' ] ifUnused: [ self fail ]
]

{ #category : #test }
IdentifierAssignerTest >> testIdentifierOn [

	| assigner |

	assigner := IdentifierAssigner prefixedBy: 'table'.
	self assert: ( assigner identifierOn: self ) equals: 'table-123'
]

{ #category : #test }
IdentifierAssignerTest >> testPrefixCantBeEmpty [

	self
		should: [ IdentifierAssigner prefixedBy: '' ]
		raise: InstanceCreationFailed
		withMessageText: 'The supplied prefix cannot be empty'
]

{ #category : #test }
IdentifierAssignerTest >> testPrefixedBy [

	| assigner |

	assigner := IdentifierAssigner prefixedBy: 'table'.
	self assert: ( assigner identifierOn: self ) equals: 'table-123'
]
