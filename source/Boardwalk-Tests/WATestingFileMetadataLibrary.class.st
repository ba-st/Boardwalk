"
Test support library
"
Class {
	#name : #WATestingFileMetadataLibrary,
	#superclass : #WADeploymentAwareFileMetadataLibrary,
	#category : #'Boardwalk-Tests-WebApplication'
}

{ #category : #Accessing }
WATestingFileMetadataLibrary class >> forDeployment [

	^ WATestingFileMetadataDeploymentLibrary
]

{ #category : #Accessing }
WATestingFileMetadataLibrary class >> forDevelopment [

	^ WATestingFileMetadataDevelopmentLibrary
]

{ #category : #Accessing }
WATestingFileMetadataLibrary class >> libraryName [

	^ 'testing'
]

{ #category : #Accessing }
WATestingFileMetadataLibrary class >> version [

	^ '0.0.0'
]

{ #category : #accesing }
WATestingFileMetadataLibrary >> jsUndefinedJs [

	^ WAFileLibraryResource
		filepath: 'js/undefined.js'
		mimeType: WAMimeType applicationJavascript
		cacheDuration:
			( Duration
				days: 0
				hours: 0
				minutes: 1
				seconds: 0 )
		contents: ( GRDelayedSend receiver: self selector: #jsUndefinedJsContent )
]

{ #category : #accesing }
WATestingFileMetadataLibrary >> jsUndefinedJsContent [

	^ self javascriptContentFrom: [ :js | js << JSStream undefined ]
]
