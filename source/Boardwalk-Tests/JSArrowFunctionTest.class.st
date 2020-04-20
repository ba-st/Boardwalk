"
A JSArrowFunctionTest is a test class for testing the behavior of JSArrowFunction
"
Class {
	#name : #JSArrowFunctionTest,
	#superclass : #JSObjectTest,
	#category : #'Boardwalk-Tests-Javascript'
}

{ #category : #accessing }
JSArrowFunctionTest >> function [

	^ JSFunction context: self renderContext
]

{ #category : #accessing }
JSArrowFunctionTest >> nonEmptyFunction [

	^ self function
		add: ( JSStream on: 'const count = 1.0' );
		add: ( JSStream on: 'count' );
		return: true
]

{ #category : #accessing }
JSArrowFunctionTest >> script [

	^ JSScript context: self renderContext
]

{ #category : #tests }
JSArrowFunctionTest >> testAsFunction [

	self
		assert: ( 'a.example()' asArrowFunction: #(a) ) asFunction equals: 'function(a){a.example()}';
		assert: 'example()' asArrowFunction asFunction equals: 'function(){example()}';
		assert: ( self nonEmptyFunction asArrowFunction: #(a b) ) asFunction
			equals: 'function(a,b){const count = 1.0;return count}';
		assert: self nonEmptyFunction asArrowFunction asFunction
			equals: 'function(){const count = 1.0;return count}'
]

{ #category : #tests }
JSArrowFunctionTest >> testAsFunctionWithArguments [

	self
		assert: ( ( 'a.example()' asArrowFunction: #(a) ) asFunction: #(a) )
			equals: 'function(a){a.example()}';
		assert: ( 'example()' asArrowFunction asFunction: #(a) ) equals: 'function(a){example()}';
		assert: ( self nonEmptyFunction asArrowFunction asFunction: #(a b) )
			equals: 'function(a,b){const count = 1.0;return count}';
		assert: ( self nonEmptyFunction asArrowFunction asFunction: #(b) )
			equals: 'function(b){const count = 1.0;return count}'
]

{ #category : #tests }
JSArrowFunctionTest >> testEmptyFunctions [

	self
		assert: ( self script asArrowFunction: #(a) ) equals: '(a) => {}';
		assert: self script asArrowFunction equals: '() => {}';
		assert: ( self function asArrowFunction: #(a b) ) equals: '(a,b) => {}';
		assert: self function asArrowFunction equals: '() => {}'
]

{ #category : #tests }
JSArrowFunctionTest >> testNonEmptyFunctions [

	self
		assert: ( 'a.example()' asArrowFunction: #(a) ) equals: '(a) => {a.example()}';
		assert: 'example()' asArrowFunction equals: '() => {example()}';
		assert: ( self nonEmptyFunction asArrowFunction: #(a b) )
			equals: '(a,b) => {const count = 1.0;return count}';
		assert: self nonEmptyFunction asArrowFunction equals: '() => {const count = 1.0;return count}'
]
