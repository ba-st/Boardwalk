"
I represent a named javascript function. I'm useful for defining function in libraries using the Seaside support.
"
Class {
	#name : 'JSNamedFunction',
	#superclass : 'JSFunction',
	#instVars : [
		'name'
	],
	#category : 'Boardwalk-Javascript',
	#package : 'Boardwalk',
	#tag : 'Javascript'
}

{ #category : 'instance creation' }
JSNamedFunction class >> named: aName [

	^self new initializeNamed: aName
]

{ #category : 'initialization' }
JSNamedFunction >> initializeNamed: aName [

	name := aName
]

{ #category : 'printing' }
JSNamedFunction >> javascriptContentOn: aStream [

	self javascriptFunctionDeclarationOn: aStream.
	self javascriptFunctionBodyOn: aStream
]

{ #category : 'private' }
JSNamedFunction >> javascriptFunctionBodyOn: aRenderer [

	aRenderer object: [
			statements isEmpty ifFalse: [
					self return
						ifTrue: [
								1 to: statements size - 1 do: [ :index |
										aRenderer render: ( statements at: index ).
										aRenderer document separator
									].
								aRenderer return: statements last
							]
						ifFalse: [
							statements
								do: [ :each | aRenderer render: each ]
								separatedBy: [ aRenderer document separator ] ]
				]
		]
]

{ #category : 'private' }
JSNamedFunction >> javascriptFunctionDeclarationOn: aRenderer [

	aRenderer document nextPutAll: ( 'function <1s>(' expandMacrosWith: self name ).
	self arguments
		do: [ :argument | aRenderer document identifier: argument ]
		separatedBy: [ aRenderer document nextPut: $, ].
	aRenderer document nextPut: $)
]

{ #category : 'accessing' }
JSNamedFunction >> name [

	^ name
]
