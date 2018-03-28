tests
testJSObjectIdenticalTo

	| jsObject |

	jsObject := JSStream this identicalTo: 0.

	self assert: jsObject equals: 'this===0'