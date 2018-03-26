tests
testJSDeclareGlobalNamespace

	| jsObject |

	jsObject := JSDeclareGlobalNamespace named: (JSStream on: 'NS').

	self assert: jsObject asJavascript equals: 'var NS'