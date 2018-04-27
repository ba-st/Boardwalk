"
A WillowApplicationInDevelopmentTest is a test class for testing the behavior of WillowApplicationInDevelopment
"
Class {
	#name : #WAApplicationInDevelopmentTest,
	#superclass : #TestCase,
	#category : #'Boardwalk-Tests-WebApplication'
}

{ #category : #'tests-accessing' }
WAApplicationInDevelopmentTest >> testFilter [

	| filtered |

	filtered := WAApplicationInDevelopment new filter: WAAbstractFileLibrary libraries.

	self
		assert: (filtered includes: WATestingFileMetadataDevelopmentLibrary);
		deny: (filtered includes: WATestingFileMetadataDeploymentLibrary)
]

{ #category : #'tests-accessing' }
WAApplicationInDevelopmentTest >> testLibraryFor [

	self
		assert: (WAApplicationInDevelopment new libraryFor: WATestingFileMetadataLibrary)
		equals: WATestingFileMetadataDevelopmentLibrary
]
