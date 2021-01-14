"
I'm a File Handler that allows to configure the available file library classes.
"
Class {
	#name : #WADeploymentAwareFileHandler,
	#superclass : #WAFileHandler,
	#instVars : [
		'libraries',
		'baseUrlForLibraryOptional'
	],
	#category : 'Boardwalk-WebApplication'
}

{ #category : #'private-Installing' }
WADeploymentAwareFileHandler class >> install: fileHandler [

	WAFileHandler default: fileHandler.
	WADispatcher default register: fileHandler at: 'files'.
	^ fileHandler
]

{ #category : #Installing }
WADeploymentAwareFileHandler class >> installAsFileHandlerAccordingTo: aDeploymentMode [

	| libraries fileHandler |

	libraries := aDeploymentMode filter: WAAbstractFileLibrary libraries.
	fileHandler := self providing: libraries.
	^ self install: fileHandler
]

{ #category : #Installing }
WADeploymentAwareFileHandler class >> installAsFileHandlerAccordingTo: aDeploymentMode servedAt: aURL [

	| libraries fileHandler |

	libraries := aDeploymentMode filter: WAAbstractFileLibrary libraries.
	fileHandler := self providing: libraries baseUrlForLibraryOptional: (Optional containing: aURL).
	^ self install: fileHandler
]

{ #category : #'Instance Creation' }
WADeploymentAwareFileHandler class >> providing: aWAFileLibraryCollection [

	^ self providing: aWAFileLibraryCollection baseUrlForLibraryOptional: Optional unused
]

{ #category : #'private - Instance Creation' }
WADeploymentAwareFileHandler class >> providing: aWAFileLibraryCollection baseUrlForLibraryOptional: anOptional [

	^ self new
		initializeProviding: aWAFileLibraryCollection
		baseUrlForLibraryOptional: anOptional
]

{ #category : #accessing }
WADeploymentAwareFileHandler >> baseUrlForLibrary [

	^baseUrlForLibraryOptional withContentDo: [:url | url copy] ifUnused: [super baseUrlForLibrary]
]

{ #category : #initialization }
WADeploymentAwareFileHandler >> initialize [

	super initialize.
	libraries := #()
]

{ #category : #initialization }
WADeploymentAwareFileHandler >> initializeProviding: aWALibraryCollection baseUrlForLibraryOptional: anOptional [

	libraries := aWALibraryCollection.
	baseUrlForLibraryOptional := anOptional
]

{ #category : #accessing }
WADeploymentAwareFileHandler >> libraries [

	^libraries 
]
