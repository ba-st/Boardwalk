"
A HTMLAsserterTest is a test class for testing the behavior of HTMLAsserter
"
Class {
	#name : #HTMLAsserterTest,
	#superclass : #TestCase,
	#category : 'Boardwalk-Tests-WebApplication'
}

{ #category : #'tests-Asserting' }
HTMLAsserterTest >> testAssertIsValidIdentifier [

	self shouldnt: [ HTMLAsserter new assertIsValidIdentifier: 'id-1_more.1.0' ] raise: AssertionFailed
]

{ #category : #tests }
HTMLAsserterTest >> testAssertingEmptyString [

	self
		should: [ HTMLAsserter new assertIsValidIdentifier: '' ]
		raise: AssertionFailed
		withMessageText: 'An id attribute can''t be empty'
]

{ #category : #tests }
HTMLAsserterTest >> testAssertingInvalidString [

	self
		should: [ HTMLAsserter new assertIsValidIdentifier: '1/aaa' ]
		raise: AssertionFailed
		withMessageText: 'An id attribute must begin with a letter. The id contains an unsafe character'
]

{ #category : #tests }
HTMLAsserterTest >> testAssertingStringStartingWithSafeCharacterButNotALetter [

	self
		should: [ HTMLAsserter new assertIsValidIdentifier: '1id' ]
		raise: AssertionFailed
		withMessageText: 'An id attribute must begin with a letter'
]
