"
Implements a Javascript if (not th inlined conditional operator).
"
Class {
	#name : 'JSNonInlinedIfThenElse',
	#superclass : 'JSDecoration',
	#instVars : [
		'trueStatement',
		'falseStatementOptional'
	],
	#category : 'Boardwalk-Javascript',
	#package : 'Boardwalk',
	#tag : 'Javascript'
}

{ #category : 'accessing' }
JSNonInlinedIfThenElse >> falseStatement: anStatement [

	falseStatementOptional := Optional containing: anStatement
]

{ #category : 'private' }
JSNonInlinedIfThenElse >> falseStatementContentOn: aRenderer [

	falseStatementOptional withContentDo: [ :falseStatement |
			aRenderer document
				nextPut: Character space;
				identifier: 'else';
				nextPut: Character space.
			aRenderer object: [ aRenderer render: falseStatement ]
		]
]

{ #category : 'initialization' }
JSNonInlinedIfThenElse >> initialize [

	super initialize.
	falseStatementOptional := Optional unused
]

{ #category : 'printing' }
JSNonInlinedIfThenElse >> javascriptContentOn: aRenderer [

	( aRenderer function: 'if' ) with: [ super javascriptContentOn: aRenderer ].
	aRenderer document openBlock.
	aRenderer render: trueStatement.
	aRenderer document closeBlock.

	self falseStatementContentOn: aRenderer
]

{ #category : 'accessing' }
JSNonInlinedIfThenElse >> trueStatement: anStatement [

	trueStatement := anStatement 
]
