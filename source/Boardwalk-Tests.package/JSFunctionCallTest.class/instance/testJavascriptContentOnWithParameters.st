tests-printing
testJavascriptContentOnWithParameters

	| globalFunctionCall |

	globalFunctionCall := JSFunctionCall
		for: 'enable'
		withAll:
			{true.
			JSStream this}.
	self assert: globalFunctionCall equals: 'enable(true,this)'