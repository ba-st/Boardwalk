Extension { #name : #JSObject }

{ #category : #'*Boardwalk' }
JSObject >> * anObject [ 
	"Multiply the receiver and anObject"
	
	self
		addDecoration:
			(JSBinary new
				operator: '*';
				statement: anObject)
]

{ #category : #'*Boardwalk' }
JSObject >> asExpression [

	self addDecoration: JSExpression new
]

{ #category : #'*Boardwalk' }
JSObject >> asImmediatelyInvokedFunctionExpression [

	^ (self asFunction apply: #()) addDecoration: JSExpression new
]

{ #category : #'*Boardwalk' }
JSObject >> collect: aBlock [

	self
		call: 'map'
		with:
			( ( ( aBlock value: ( JSStream on: 'currentValue' ) ) asArrowFunction: #('currentValue') )
				return: true;
				yourself )
]

{ #category : #'*Boardwalk' }
JSObject >> detect: aBlock [

	self
		call: 'find'
		with:
			( ( ( aBlock value: ( JSStream on: 'currentValue' ) ) asArrowFunction: #('currentValue') )
				return: true;
				yourself )
]

{ #category : #'*Boardwalk' }
JSObject >> detect: aBlock ifFound: foundBlock [

	| thenScript |

	thenScript := self javascript.
	foundBlock value: ( JSStream on: 'foundValue' ) value: thenScript.

	^ self javascript
		if:
			( ( ( JSStream on: 'foundValue' )
				assign:
					( self
						call: 'find'
						with:
							( ( ( aBlock value: ( JSStream on: 'currentValue' ) ) asArrowFunction: #('currentValue') )
								return: true;
								yourself ) ) ) asExpression notEqualTo: JSStream undefined )
		then: thenScript
]

{ #category : #'*Boardwalk' }
JSObject >> detect: aBlock ifFound: foundBlock ifNone: errorBlock [

	| thenScript elseScript |

	thenScript := self javascript.
	elseScript := self javascript.
	foundBlock value: ( JSStream on: 'foundValue' ) value: thenScript.
	errorBlock value: elseScript.
	^ self javascript
		if:
			( ( ( JSStream on: 'foundValue' )
				assign:
					( self
						call: 'find'
						with:
							( ( ( aBlock value: ( JSStream on: 'currentValue' ) ) asArrowFunction: #('currentValue') )
								return: true;
								yourself ) ) ) asExpression notEqualTo: JSStream undefined )
		then: thenScript
		else: elseScript
]

{ #category : #'*Boardwalk' }
JSObject >> detect: aBlock ifNone: errorBlock [

	| thenScript |

	thenScript := self javascript.
	errorBlock value: thenScript.
	^ self javascript
		if:
			( ( ( JSStream on: 'foundValue' )
				assign:
					( self
						call: 'find'
						with:
							( ( ( aBlock value: ( JSStream on: 'currentValue' ) ) asArrowFunction: #('currentValue') )
								return: true;
								yourself ) ) ) asExpression equalTo: JSStream undefined )
		then: thenScript
]

{ #category : #'*Boardwalk' }
JSObject >> equalTo: anObject [

	self
		addDecoration:
			(JSBinary new
				operator: '==';
				statement: anObject)
]

{ #category : #'*Boardwalk' }
JSObject >> greaterThan: anObject [

	self
		addDecoration:
			( JSBinary new
				operator: '>';
				statement: anObject )
]

{ #category : #'*Boardwalk' }
JSObject >> greaterThanOrEqualTo: anObject [

	self
		addDecoration:
			( JSBinary new
				operator: '>=';
				statement: anObject )
]

{ #category : #'*Boardwalk' }
JSObject >> identicalTo: anObject [

	self
		addDecoration:
			(JSBinary new
				operator: '===';
				statement: anObject)
]

{ #category : #'*Boardwalk' }
JSObject >> javascript [

	^ ( JSScript context: self renderContext )
		rendererClass: self rendererClass;
		yourself
]

{ #category : #'*Boardwalk' }
JSObject >> lessThan: anObject [

	self
		addDecoration:
			( JSBinary new
				operator: '<';
				statement: anObject )
]

{ #category : #'*Boardwalk' }
JSObject >> lessThanOrEqualTo: anObject [

	self
		addDecoration:
			( JSBinary new
				operator: '<=';
				statement: anObject )
]

{ #category : #'*Boardwalk' }
JSObject >> nonInlinedThen: anObject [

	self addDecoration: (JSNonInlinedIfThenElse new trueStatement: anObject)
]

{ #category : #'*Boardwalk' }
JSObject >> nonInlinedThen: anObject else: anotherObject [

	self
		addDecoration:
			(JSNonInlinedIfThenElse new
				trueStatement: anObject;
				falseStatement: anotherObject)
]

{ #category : #'*Boardwalk' }
JSObject >> notEqualTo: anObject [

	self
		addDecoration:
			( JSBinary new
				operator: '!=';
				statement: anObject )
]

{ #category : #'*Boardwalk' }
JSObject >> notIdenticalTo: anObject [

	self
		addDecoration:
			(JSBinary new
				operator: '!==';
				statement: anObject)
]

{ #category : #'*Boardwalk' }
JSObject >> select: aBlock [

	self
		call: 'filter'
		with:
			( ( ( aBlock value: ( JSStream on: 'currentValue' ) ) asArrowFunction: #('currentValue') )
				return: true;
				yourself )
]

{ #category : #'*Boardwalk' }
JSObject >> sessionStorage [

	^self alias: 'sessionStorage'
]

{ #category : #'*Boardwalk' }
JSObject >> typeOf [
    "Returns the type of the receiver."

    self addDecoration: JSTypeOf new
]
