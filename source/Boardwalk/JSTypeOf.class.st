"
Implements the Javascript typeOf  operator
"
Class {
	#name : 'JSTypeOf',
	#superclass : 'JSDecoration',
	#category : 'Boardwalk-Javascript',
	#package : 'Boardwalk',
	#tag : 'Javascript'
}

{ #category : 'printing' }
JSTypeOf >> javascriptContentOn: aRenderer [

	aRenderer document
		identifier: 'typeof';
		nextPut: Character space.
	super javascriptContentOn: aRenderer
]
