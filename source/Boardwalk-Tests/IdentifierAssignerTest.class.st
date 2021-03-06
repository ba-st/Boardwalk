Class {
	#name : #IdentifierAssignerTest,
	#superclass : #TestCase,
	#instVars : [
		'idOptional',
		'nextId'
	],
	#category : #'Boardwalk-Tests-WebApplication'
}

{ #category : #'test support' }
IdentifierAssignerTest >> id: anId [

	idOptional := Optional containing: anId
]

{ #category : #'test support' }
IdentifierAssignerTest >> nextId [

	nextId := nextId + 1.
	^ nextId - 1
]

{ #category : #running }
IdentifierAssignerTest >> setUp [

	super setUp.
	idOptional := Optional unused.
	nextId := 1
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
	idOptional withContentDo: [ :id | self assert: id equals: 'table-1' ] ifUnused: [ self fail ]
]

{ #category : #test }
IdentifierAssignerTest >> testBeRequiredAfterApplyingIsNotAllowed [

	| assigner |

	assigner := IdentifierAssigner prefixedBy: 'table'.
	assigner applyTo: self on: self.
	idOptional withContentDo: [ self fail ].
	self
		should: [ assigner beRequired ]
		raise: AssertionFailed
		withMessageText:
			'Identification requested after rendering was already started. Review view creation and configuration order. If a component renders its own container, and is created during the container rendering, the container must be sent `beIdentifiable` after its creation.'
]

{ #category : #test }
IdentifierAssignerTest >> testBeRequiredBeforeAndAfterApplyingIsAllowed [

	| assigner |

	assigner := IdentifierAssigner prefixedBy: 'table'.
	assigner beRequired.
	assigner applyTo: self on: self.
	idOptional withContentDo: [ :id | self assert: id equals: 'table-1' ] ifUnused: [ self fail ].

	assigner beRequired.
	idOptional withContentDo: [ :id | self assert: id equals: 'table-1' ] ifUnused: [ self fail ]
]

{ #category : #test }
IdentifierAssignerTest >> testIdentifierOn [

	| assigner |

	assigner := IdentifierAssigner prefixedBy: 'table'.
	self assert: ( assigner identifierOn: self ) equals: 'table-1'
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
	self assert: ( assigner identifierOn: self ) equals: 'table-1'
]

{ #category : #test }
IdentifierAssignerTest >> testStoredIdDoesNotKeepCounterFromIncreasing [

	| assigner |

	assigner := IdentifierAssigner prefixedBy: 'table'.
	self assert: nextId equals: 1.
	self assert: ( assigner identifierOn: self ) equals: 'table-1'.
	self assert: nextId equals: 2.
	self assert: ( assigner identifierOn: self ) equals: 'table-1'.
	self assert: nextId equals: 3
]
