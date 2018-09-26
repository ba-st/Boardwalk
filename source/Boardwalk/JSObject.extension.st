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
JSObject >> asImmediatelyInvokedFunctionExpression [

	^ (self asFunction apply: #()) addDecoration: JSExpression new
]

{ #category : #'*Boardwalk' }
JSObject >> collect: aBlock [

	self
		call: 'map'
		with:
			(((aBlock value: (JSStream on: 'currentValue'))
				asFunction: (Array with: 'currentValue'))
				return: true;
				yourself)
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
JSObject >> identicalTo: anObject [

	self
		addDecoration:
			(JSBinary new
				operator: '===';
				statement: anObject)
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
			(((aBlock value: (JSStream on: 'currentValue'))
				asFunction: (Array with: 'currentValue'))
				return: true;
				yourself)
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
