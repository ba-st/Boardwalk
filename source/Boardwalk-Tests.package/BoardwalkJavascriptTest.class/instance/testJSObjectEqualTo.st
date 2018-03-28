tests
testJSObjectEqualTo

	| jsObject |

	jsObject := JSStream this equalTo: 0.

	self assert: jsObject equals: 'this==0'