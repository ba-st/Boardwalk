tests-printing
testJavascriptContentOn

	| emptyJsFunction |

	emptyJsFunction := JSNamedFunction named: 'empty'.
	self assert: emptyJsFunction equals: 'function empty(){}'