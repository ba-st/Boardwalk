Extension { #name : #JSScript }

{ #category : #'*Boardwalk' }
JSScript >> asVariableName: aVariableName [

	^ aVariableName isString
		ifTrue: [ JSStream on: aVariableName ]
		ifFalse: [ aVariableName ]
]

{ #category : #'*Boardwalk' }
JSScript >> call: aFunctionName [

	^ self call: aFunctionName withArguments: #()
]

{ #category : #'*Boardwalk' }
JSScript >> call: aFunctionName with: anObject [

	^ self call: aFunctionName withArguments: (Array with: anObject)
]

{ #category : #'*Boardwalk' }
JSScript >> call: aFunctionName with: anObject1 with: anObject2 [

	^ self call: aFunctionName withArguments: (Array with: anObject1 with: anObject2)
]

{ #category : #'*Boardwalk' }
JSScript >> call: aFunctionName with: anObject1 with: anObject2 with: anObject3 [

	^ self
		call: aFunctionName
		withArguments: (Array with: anObject1 with: anObject2 with: anObject3)
]

{ #category : #'*Boardwalk' }
JSScript >> call: aFunctionName withArguments: anArray [

	^JSFunctionCall for: aFunctionName withAll: anArray 
]

{ #category : #'*Boardwalk' }
JSScript >> const: aVariableName assign: anObject [

	^ JSDeclareConstVariable named: ( ( self asVariableName: aVariableName ) assign: anObject )
]

{ #category : #'*Boardwalk' }
JSScript >> if: condition then: statement [

	^ condition nonInlinedThen: statement
]

{ #category : #'*Boardwalk' }
JSScript >> if: condition then: trueStatement else: falseStatement [

	^ condition nonInlinedThen: trueStatement else: falseStatement
]

{ #category : #'*Boardwalk' }
JSScript >> var: aVariableName [

	^ JSDeclareGlobalNamespace named: ( self asVariableName: aVariableName )
]
