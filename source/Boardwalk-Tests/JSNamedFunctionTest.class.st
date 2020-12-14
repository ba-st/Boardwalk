"
A NamedJavascriptFunctionTest is a test class for testing the behavior of NamedJavascriptFunction
"
Class {
	#name : #JSNamedFunctionTest,
	#superclass : #JSObjectTest,
	#category : 'Boardwalk-Tests-Javascript'
}

{ #category : #'tests-printing' }
JSNamedFunctionTest >> testJavascriptContentOn [

	| emptyJsFunction |

	emptyJsFunction := JSNamedFunction named: 'empty'.
	self assert: emptyJsFunction equals: 'function empty(){}'
]

{ #category : #'tests-printing' }
JSNamedFunctionTest >> testJavascriptContentOnWithBody [

	| jsFunction |

	jsFunction := JSNamedFunction named: 'handleAjaxErrorCall'.
	jsFunction arguments: #('theXMLHttpRequest' 'textStatus' 'errorThrown').
	jsFunction << (JSStream on: 'theXMLHttpRequest') call: 'getAllResponseHeaders'.

	self
		assert: jsFunction
		equals: 'function handleAjaxErrorCall(theXMLHttpRequest,textStatus,errorThrown){theXMLHttpRequest.getAllResponseHeaders()}'
]
