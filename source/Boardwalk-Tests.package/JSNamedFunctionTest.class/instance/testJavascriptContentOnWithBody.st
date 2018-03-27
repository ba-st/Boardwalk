tests-printing
testJavascriptContentOnWithBody

	| jsFunction |

	jsFunction := JSNamedFunction named: 'handleAjaxErrorCall'.
	jsFunction arguments: #('theXMLHttpRequest' 'textStatus' 'errorThrown').
	jsFunction << (JSStream on: 'theXMLHttpRequest') call: 'getAllResponseHeaders'.

	self
		assert: jsFunction
		equals: 'function handleAjaxErrorCall(theXMLHttpRequest,textStatus,errorThrown){theXMLHttpRequest.getAllResponseHeaders()}'