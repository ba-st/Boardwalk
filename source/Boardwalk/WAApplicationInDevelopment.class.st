"
I represent a Willow Application in development.
"
Class {
	#name : 'WAApplicationInDevelopment',
	#superclass : 'WADeploymentMode',
	#category : 'Boardwalk-WebApplication',
	#package : 'Boardwalk',
	#tag : 'WebApplication'
}

{ #category : 'accessing' }
WAApplicationInDevelopment >> filter: aWALibraryCollection [

	^ aWALibraryCollection select: [ :library | library subclasses isEmpty and: [ library isForDevelopment ] ]
]

{ #category : 'accessing' }
WAApplicationInDevelopment >> libraryFor: aWillowFileMetadataLibraryClass [

	^ aWillowFileMetadataLibraryClass forDevelopment
]
