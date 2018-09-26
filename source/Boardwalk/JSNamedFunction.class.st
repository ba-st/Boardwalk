"
I represent a named javascript function. I'm useful for defining function in libraries using the Seaside support.
"
Class {
	#name : #JSNamedFunction,
	#superclass : #JSFunction,
	#instVars : [
		'name'
	],
	#category : 'Boardwalk-Javascript'
}

{ #category : #'instance creation' }
JSNamedFunction class >> named: aName [

	^self new initializeNamed: aName
]

{ #category : #initialization }
JSNamedFunction >> initializeNamed: aName [

	name := aName
]

{ #category : #printing }
JSNamedFunction >> javascriptContentOn: aStream [

	self javascriptFunctionDeclarationOn: aStream.
	self javascriptFunctionBodyOn: aStream
]

{ #category : #private }
JSNamedFunction >> javascriptFunctionBodyOn: aStream [

	aStream nextPut: ${.
	statements isEmpty
		ifFalse: [ statements allButLast
				do: [ :each | 
					aStream
						javascript: each;
						nextPut: $; ].
			self return
				ifTrue: [ aStream nextPutAll: 'return ' ].
			aStream javascript: statements last ].
	aStream nextPut: $}
]

{ #category : #private }
JSNamedFunction >> javascriptFunctionDeclarationOn: aStream [

	aStream
		nextPutAll: 'function';
		space;
		nextPutAll: self name.
	aStream nextPut: $(.
	self arguments
		do: [ :each | aStream nextPutAll: each ]
		separatedBy: [ aStream nextPut: $, ].
	aStream nextPut: $)
]

{ #category : #accessing }
JSNamedFunction >> name [

	^ name
]
