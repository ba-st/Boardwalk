"
I'm an abstract metadata library, allowing my subclasses to declare what name to use instead of the class name for url resolution.
"
Class {
	#name : #WADeploymentAwareFileMetadataLibrary,
	#superclass : #WAFileMetadataLibrary,
	#category : #'Boardwalk-WebApplication'
}

{ #category : #Accessing }
WADeploymentAwareFileMetadataLibrary class >> folderName [

	^ '<1s>-<2s>' expandMacrosWith: self libraryName with: self version
]

{ #category : #Accessing }
WADeploymentAwareFileMetadataLibrary class >> forDeployment [

	^ self subclassResponsibility
]

{ #category : #Accessing }
WADeploymentAwareFileMetadataLibrary class >> forDevelopment [

	^ self subclassResponsibility
]

{ #category : #Testing }
WADeploymentAwareFileMetadataLibrary class >> handlesFolder: aSymbol [

	^ self ~~ WADeploymentAwareFileMetadataLibrary and: [ self subclasses isEmpty and: [ self folderName = aSymbol greaseString ] ]
]

{ #category : #Testing }
WADeploymentAwareFileMetadataLibrary class >> isForDeployment [

	^ self forDeployment = self
]

{ #category : #Testing }
WADeploymentAwareFileMetadataLibrary class >> isForDevelopment [

	^ self forDevelopment = self
]

{ #category : #Accessing }
WADeploymentAwareFileMetadataLibrary class >> libraryName [

	^ self subclassResponsibility
]

{ #category : #Accessing }
WADeploymentAwareFileMetadataLibrary class >> version [

	^ self subclassResponsibility
]

{ #category : #'private - utility' }
WADeploymentAwareFileMetadataLibrary >> javascriptContentFrom: aMonadycBlock [

	WACurrentRequestContext
		use: (WARequestContext request: WARequest new response: WABufferedResponse new)
		during: [ WAHtmlCanvas builder
				fullDocument: false;
				render: [ :canvas | 
					| javascript |
					javascript := canvas javascript.
					aMonadycBlock cull: javascript.
					^ javascript greaseString ] ]
]

{ #category : #testing }
WADeploymentAwareFileMetadataLibrary >> name [

	^ self class folderName
]

{ #category : #accessing }
WADeploymentAwareFileMetadataLibrary >> urlOf: aSymbol using: aHandler [

	^ aHandler baseUrlForLibrary
		addToPath: self name;
		addToPath: (self asFilename: aSymbol);
		yourself
]
