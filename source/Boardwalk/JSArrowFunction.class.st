"
I represent an anonymous JavaScript function using the arrow (->) syntax
"
Class {
	#name : #JSArrowFunction,
	#superclass : #JSFunction,
	#category : #'Boardwalk-Javascript'
}

{ #category : #converting }
JSArrowFunction >> asArrowFunction [

	^ self
]

{ #category : #converting }
JSArrowFunction >> asArrowFunction: aCollection [

	self arguments: aCollection
]

{ #category : #converting }
JSArrowFunction >> asFunction [

	| function |

	function := JSFunction context: self renderContext.
	function arguments: arguments.
	statements do: [ :statement | function add: statement ].
	function return: return.
	^ function
]

{ #category : #converting }
JSArrowFunction >> asFunction: aCollection [

	^ self asFunction asFunction: aCollection
]

{ #category : #printing }
JSArrowFunction >> javascriptContentOn: aStream [

	aStream nextPutAll: '('.
	self arguments do: [ :each | aStream nextPutAll: each ] separatedBy: [ aStream nextPut: $, ].
	aStream nextPutAll: ') => {'.
	statements isEmpty
		ifFalse: [ statements allButLast
				do: [ :each | 
					aStream
						javascript: each;
						nextPut: $;
					].
			self return
				ifTrue: [ aStream nextPutAll: 'return ' ].
			aStream javascript: statements last
			].
	aStream nextPut: $}
]
