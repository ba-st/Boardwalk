Class {
	#name : #IdentifierAssignerTest,
	#superclass : #TestCase,
	#category : 'Boardwalk-Tests-WebApplication'
}

{ #category : #'test support' }
IdentifierAssignerTest >> nextId [

	^ '123'
]

{ #category : #test }
IdentifierAssignerTest >> testAssignedIdentifier [

	| assigner |

	assigner := IdentifierAssigner prefixedBy: 'table'.
	assigner identifyIn: self.
	self assert: assigner assignedIdentifier equals: 'table-123'
]

{ #category : #test }
IdentifierAssignerTest >> testAssignedIdentifierWhenNotAssigned [

	| assigner |

	assigner := IdentifierAssigner prefixedBy: 'table'.

	self
		should: [ assigner assignedIdentifier ]
		raise: AssertionFailed
		withMessageText: 'The identifier was never assigned'
]

{ #category : #test }
IdentifierAssignerTest >> testPrefixCantBeEmpty [

	self
		should: [ IdentifierAssigner prefixedBy: '' ]
		raise: InstanceCreationFailed
		withMessageText: 'The supplied prefix cannot be empty'
]

{ #category : #test }
IdentifierAssignerTest >> testWithAssignedIdentifierDo [

	| assigner |

	assigner := IdentifierAssigner prefixedBy: 'table'.
	assigner identifyIn: self.

	assigner withAssignedIdentifierDo: [ :id | self assert: id equals: 'table-123' ]
]

{ #category : #test }
IdentifierAssignerTest >> testWithAssignedIdentifierDoWhenNotAssigned [

	| assigner |

	assigner := IdentifierAssigner prefixedBy: 'table'.

	assigner withAssignedIdentifierDo: [ :id | self fail ]
]
