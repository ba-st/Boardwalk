"
I represent a Willow Application Deployment mode. Currently I help in filtering file libraries to use according to the configured mode. 
"
Class {
	#name : #WADeploymentMode,
	#superclass : #Object,
	#category : 'Boardwalk-WebApplication'
}

{ #category : #accessing }
WADeploymentMode >> filter: allFileLibraryClasses [

	^ self subclassResponsibility
]

{ #category : #accessing }
WADeploymentMode >> libraryFor: aWillowFileMetadataLibraryClass [

	^ self subclassResponsibility 
]
