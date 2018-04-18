"
A WillowFileMetadataLibraryTest is a test class for testing the behavior of WillowFileMetadataLibrary
"
Class {
	#name : #WADeploymentAwareFileMetadataLibraryTest,
	#superclass : #TestCase,
	#category : 'Boardwalk-Tests-WebApplication'
}

{ #category : #tests }
WADeploymentAwareFileMetadataLibraryTest >> testForDeployment [

	self assert: WATestingFileMetadataLibrary forDeployment equals: WATestingFileMetadataDeploymentLibrary
]

{ #category : #tests }
WADeploymentAwareFileMetadataLibraryTest >> testForDevelopment [

	self assert: WATestingFileMetadataLibrary forDevelopment equals: WATestingFileMetadataDevelopmentLibrary
]

{ #category : #tests }
WADeploymentAwareFileMetadataLibraryTest >> testHandlesFolder [

	self deny: (WADeploymentAwareFileMetadataLibrary handlesFolder: #folder)
]

{ #category : #tests }
WADeploymentAwareFileMetadataLibraryTest >> testJavascriptGeneration [

	self assert: WATestingFileMetadataDeploymentLibrary default contentJs equals: 'undefined'
]

{ #category : #tests }
WADeploymentAwareFileMetadataLibraryTest >> testLibraryName [

	self assert: WATestingFileMetadataLibrary libraryName equals: 'testing'
]
