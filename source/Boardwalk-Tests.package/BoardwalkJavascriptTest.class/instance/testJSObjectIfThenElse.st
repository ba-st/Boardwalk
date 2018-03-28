tests
testJSObjectIfThenElse

	| jsObject |

	jsObject := self javascript
		if: (JSStream this equalTo: 0)
		then:
			(self javascript
				<< (self javascript var: 'a');
				<< true;
				yourself)
		else: false.

	self assert: jsObject equals: 'if(this==0){var a;true} else {false}'