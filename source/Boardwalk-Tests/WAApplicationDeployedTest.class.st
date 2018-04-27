"
A WillowApplicationDeployedTest is a test class for testing the behavior of WillowApplicationDeployed
"
Class {
	#name : #WAApplicationDeployedTest,
	#superclass : #TestCase,
	#category : #'Boardwalk-Tests-WebApplication'
}

{ #category : #'tests-accessing' }
WAApplicationDeployedTest >> testFilter [

	| filtered |

	filtered := WAApplicationDeployed new filter: WAAbstractFileLibrary libraries.

	self
		assert: (filtered includes: WATestingFileMetadataDeploymentLibrary);
		deny: (filtered includes: WATestingFileMetadataDevelopmentLibrary)
]

{ #category : #'tests-accessing' }
WAApplicationDeployedTest >> testLibraryFor [

	self
		assert: (WAApplicationDeployed new libraryFor: WATestingFileMetadataLibrary)
		equals: WATestingFileMetadataDeploymentLibrary
]
