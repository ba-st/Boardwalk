tests-printing
testCallJsFunction

	self
		assert: (self javascript call: 'empty') equals: 'empty()';
		assert: (self javascript call: 'empty' with: true) equals: 'empty(true)';
		assert: (self javascript call: 'empty' with: true with: JSStream this) equals: 'empty(true,this)';
		assert:
			(self javascript
				call: 'empty'
				with: true
				with: JSStream this
				with: JSStream undefined)
			equals: 'empty(true,this,undefined)'