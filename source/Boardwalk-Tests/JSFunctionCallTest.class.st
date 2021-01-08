"
A JavascriptFunctionCallTest is a test class for testing the behavior of JavascriptFunctionCall
"
Class {
	#name : #JSFunctionCallTest,
	#superclass : #JSObjectTest,
	#category : 'Boardwalk-Tests-Javascript'
}

{ #category : #'tests-printing' }
JSFunctionCallTest >> testCallJsFunction [

	self
		assert: (self javascript call: 'empty') equals: 'empty()';
		assert: (self javascript call: 'empty' with: true) equals: 'empty(true)';
		assert: (self javascript call: 'empty' with: true with: JSStream this) equals: 'empty(true,this)';
		assert:
			(self javascript
				call: 'empty'
				with: true
				with: JSStream this
				with: JSStream undefined)
			equals: 'empty(true,this,undefined)'
]

{ #category : #'tests-printing' }
JSFunctionCallTest >> testJavascriptContentOn [

	| globalFunctionCall |

	globalFunctionCall := JSFunctionCall for: 'empty'.
	self assert: globalFunctionCall equals: 'empty()'
]

{ #category : #'tests-printing' }
JSFunctionCallTest >> testJavascriptContentOnWithOneParameters [

	| globalFunctionCall |

	globalFunctionCall := JSFunctionCall for: 'enable' with: true.
	self assert: globalFunctionCall equals: 'enable(true)'
]

{ #category : #'tests-printing' }
JSFunctionCallTest >> testJavascriptContentOnWithParameters [

	| globalFunctionCall |

	globalFunctionCall := JSFunctionCall
		for: 'enable'
		withAll:
			{true.
			JSStream this}.
	self assert: globalFunctionCall equals: 'enable(true,this)'
]
