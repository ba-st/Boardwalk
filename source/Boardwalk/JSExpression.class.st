"
A JS expression enclosed in parenthesis
"
Class {
	#name : #JSExpression,
	#superclass : #JSDecoration,
	#category : 'Boardwalk-Javascript'
}

{ #category : #printing }
JSExpression >> javascriptContentOn: aStream [

	aStream nextPut: $(.
	super javascriptContentOn: aStream.
	aStream nextPut: $)
]
