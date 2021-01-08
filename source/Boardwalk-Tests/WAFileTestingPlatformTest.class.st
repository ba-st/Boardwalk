"
I'm a test for WAFileTestingPlatform
"
Class {
	#name : #WAFileTestingPlatformTest,
	#superclass : #BWRenderingTest,
	#instVars : [
		'testingPlatform'
	],
	#category : #'Boardwalk-Tests-WebApplication'
}

{ #category : #initialization }
WAFileTestingPlatformTest >> setUp [

	super setUp.
	testingPlatform := WAFileTestingPlatform wrapping: GRPlatform current
]

{ #category : #tests }
WAFileTestingPlatformTest >> testFileLibrary [

	self
		assert: testingPlatform createdFiles isEmpty;
		assert: testingPlatform createdFolders isEmpty.

	self
		assert: (testingPlatform ensureExistenceOfFolder: 'project/source');
		assert: (testingPlatform ensureExistenceOfFolder: 'folder').

	self
		assertCollection: testingPlatform createdFolders
		equals: #('folder' 'project/source').

	testingPlatform write: '' toFile: 'example.txt' inFolder: 'folder'.

	self assertCollection: testingPlatform createdFiles equals: #('folder/example.txt')
]

{ #category : #tests }
WAFileTestingPlatformTest >> testLabel [

	self assert: testingPlatform label equals: 'File Testing Wrapper'
]
