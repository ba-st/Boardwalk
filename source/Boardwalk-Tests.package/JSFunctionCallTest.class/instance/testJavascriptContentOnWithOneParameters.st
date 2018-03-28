tests-printing
testJavascriptContentOnWithOneParameters

	| globalFunctionCall |

	globalFunctionCall := JSFunctionCall for: 'enable' with: true.
	self assert: globalFunctionCall equals: 'enable(true)'