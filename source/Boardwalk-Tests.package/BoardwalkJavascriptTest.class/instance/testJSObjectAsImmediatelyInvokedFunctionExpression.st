tests
testJSObjectAsImmediatelyInvokedFunctionExpression

	| jsObject |

	jsObject := (JSStream this equalTo: 0) asImmediatelyInvokedFunctionExpression.

	self assert: jsObject equals: '(function(){this==0}())'