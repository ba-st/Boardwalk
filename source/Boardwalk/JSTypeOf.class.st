"
Implements the Javascript typeOf  operator
"
Class {
	#name : #JSTypeOf,
	#superclass : #JSDecoration,
	#category : #'Boardwalk-Javascript'
}

{ #category : #printing }
JSTypeOf >> javascriptContentOn: aStream [

	aStream
		nextPutAll: 'typeof';
		space.
	super javascriptContentOn: aStream
]
