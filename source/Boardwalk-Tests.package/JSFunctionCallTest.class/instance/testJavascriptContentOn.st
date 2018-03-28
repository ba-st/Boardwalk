tests-printing
testJavascriptContentOn

	| globalFunctionCall |

	globalFunctionCall := JSFunctionCall for: 'empty'.
	self assert: globalFunctionCall equals: 'empty()'