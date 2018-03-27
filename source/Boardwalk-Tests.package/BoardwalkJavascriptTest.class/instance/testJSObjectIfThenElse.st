tests
testJSObjectIfThenElse

	| jsObject |

	jsObject := self javascript if: (JSStream this equalTo: 0) then: true else: false.

	self assert: jsObject equals: 'if(this==0){true} else {false}'