"
I'm a deployer aimed at not only generating the static contents from a list of libraries, but also creating a file including useful metadata to be used when the files are uploaded to a CDN.
"
Class {
	#name : #WAFileMetadataLibraryDeployer,
	#superclass : #Object,
	#instVars : [
		'libraries'
	],
	#category : #'Boardwalk-WebApplication'
}

{ #category : #'instance creation' }
WAFileMetadataLibraryDeployer class >> deployingAll: libraryFactories [

	^ self new initializeDeployingAll: libraryFactories
]

{ #category : #actions }
WAFileMetadataLibraryDeployer >> deployFiles [

	libraries do: [ :library | library deployFiles ]
]

{ #category : #actions }
WAFileMetadataLibraryDeployer >> deployFilesMetadata [

	| metadataJSON |

	metadataJSON := ( libraries
		inject: Dictionary new
		into: [ :metadata :library | 
			( self resourcesOf: library )
				do: [ :resource | 
					metadata
						at: 'filePath'
							put: ( '<1s>/<2s>' expandMacrosWith: library class folderName with: resource filepath );
						at: 'mediaType' put: resource mimeType greaseString.
					[ metadata at: 'cacheDurationInMs' put: resource cacheDuration asMilliseconds ]
						unless: resource cacheDuration = library class defaultCacheDuration
					].
			metadata
			] ) asJson.

	GRPlatform current write: metadataJSON toFile: 'libraries-metadata.json' inFolder: '.'
]

{ #category : #initialization }
WAFileMetadataLibraryDeployer >> initializeDeployingAll: libraryFactories [

	libraries := libraryFactories
		collect: [ :factory | 
			| library |
			library := factory forDeployment.
			library isClass then: [ library default ] otherwise: [ library ]
			].
	WADeploymentAwareFileHandler
		installAsFileHandlerAccordingTo: WAApplicationDeployed new
		servedAt: '/' seasideUrl
]

{ #category : #private }
WAFileMetadataLibraryDeployer >> resourcesOf: library [

	^ library fileSelectors collect: [ :selector | library perform: selector ]
]
