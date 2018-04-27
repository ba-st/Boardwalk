"
I represent a Willow Application as deployed.
"
Class {
	#name : #WAApplicationDeployed,
	#superclass : #WADeploymentMode,
	#category : #'Boardwalk-WebApplication'
}

{ #category : #accessing }
WAApplicationDeployed >> filter: aWALibraryCollection [

	^ aWALibraryCollection select: [ :library | library subclasses isEmpty and: [ library isForDeployment ] ]
]

{ #category : #accessing }
WAApplicationDeployed >> libraryFor: aWillowFileMetadataLibraryClass [

	^ aWillowFileMetadataLibraryClass forDeployment
]
