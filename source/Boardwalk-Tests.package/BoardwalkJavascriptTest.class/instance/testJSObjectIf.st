tests
testJSObjectIf

	| jsObject |

	jsObject := self javascript if: (JSStream this equalTo: 0) then: true.

	self assert: jsObject equals: 'if(this==0){true}'