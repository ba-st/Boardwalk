tests
testJSDeclareGlobalNamespace

	self
		assert: (self javascript var: 'NS') equals: 'var NS';
		assert: (self javascript var: (JSStream on: 'NS')) equals: 'var NS'