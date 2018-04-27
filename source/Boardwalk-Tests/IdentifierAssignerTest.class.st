Class {
	#name : #IdentifierAssignerTest,
	#superclass : #TestCase,
	#category : #'Boardwalk-Tests-WebApplication'
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
		withExceptionDo: [ :error | self assert: error messageText equals: 'The identifier was never assigned' ]
]

{ #category : #test }
IdentifierAssignerTest >> testPrefixCantBeEmpty [

	self should: [ IdentifierAssigner prefixedBy: '' ] raise: InstanceCreationFailed withExceptionDo: [ :error | self assert: error messageText equals: 'The supplied prefix cannot be empty' ]
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
