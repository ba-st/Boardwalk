"
Implements a Javascript if (not th inlined conditional operator).
"
Class {
	#name : #JSNonInlinedIfThenElse,
	#superclass : #JSDecoration,
	#instVars : [
		'trueStatement',
		'falseStatementOptional'
	],
	#category : #'Boardwalk-Javascript'
}

{ #category : #accessing }
JSNonInlinedIfThenElse >> falseStatement: anStatement [

	falseStatementOptional := Optional containing: anStatement
]

{ #category : #private }
JSNonInlinedIfThenElse >> falseStatementContentOn: aStream [

	falseStatementOptional
		withContentDo: [ :falseStatement | 
			aStream
				space;
				nextPutAll: 'else';
				space;
				nextPut: ${;
				javascript: falseStatement;
				nextPut: $} ]
]

{ #category : #initialization }
JSNonInlinedIfThenElse >> initialize [

	super initialize.
	falseStatementOptional := Optional unused
]

{ #category : #printing }
JSNonInlinedIfThenElse >> javascriptContentOn: aStream [

	aStream
		nextPutAll: 'if';
		nextPut: $(.
	super javascriptContentOn: aStream.
	aStream
		nextPut: $);
		nextPut: ${;
		javascript: trueStatement;
		nextPut: $}.
	self falseStatementContentOn: aStream
]

{ #category : #accessing }
JSNonInlinedIfThenElse >> trueStatement: anStatement [

	trueStatement := anStatement 
]
