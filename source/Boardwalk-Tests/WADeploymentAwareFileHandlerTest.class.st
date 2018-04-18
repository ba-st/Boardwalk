"
A WillowFileHandlerTest is a test class for testing the behavior of WillowFileHandler
"
Class {
	#name : #WADeploymentAwareFileHandlerTest,
	#superclass : #TestCase,
	#category : 'Boardwalk-Tests-WebApplication'
}

{ #category : #private }
WADeploymentAwareFileHandlerTest >> changeRegisteredFileHandlerDuring: aBlock [

	| installedHandler |

	installedHandler := WAFileHandler default.
	installedHandler unregister.

	aBlock
		ensure: [ WAFileHandler default: installedHandler.
			WAAdmin defaultDispatcher register: installedHandler at: 'files' ]
]

{ #category : #'tests-accessing' }
WADeploymentAwareFileHandlerTest >> testInstallAsFileHandlerAccordingTo [

	self
		changeRegisteredFileHandlerDuring: [ | handler |

			handler := WADeploymentAwareFileHandler installAsFileHandlerAccordingTo: WAApplicationInDevelopment new.
			self
				assert: (handler libraries includes: WATestingFileMetadataDevelopmentLibrary);
				assert: WAFileHandler default equals: handler;
				assert: (WATestingFileMetadataDevelopmentLibrary default urlOf: #'' using: handler) greaseString equals: '/files/testing-0.0.0' ]
]

{ #category : #'tests-accessing' }
WADeploymentAwareFileHandlerTest >> testInstallAsFileHandlerAccordingToServedAt [

	self
		changeRegisteredFileHandlerDuring: [ | handler |

			handler := WADeploymentAwareFileHandler installAsFileHandlerAccordingTo: WAApplicationInDevelopment new servedAt: 'https://cdn.example.com' seasideUrl.
			self
				assert: (handler libraries includes: WATestingFileMetadataDevelopmentLibrary);
				assert: WAFileHandler default equals: handler;
				assert: (WATestingFileMetadataDevelopmentLibrary default urlOf: #'' using: handler) greaseString equals: 'https://cdn.example.com/testing-0.0.0' ]
]

{ #category : #'tests-accessing' }
WADeploymentAwareFileHandlerTest >> testLibraries [

	| libraries handler |

	libraries := Array with: WATestingFileMetadataDeploymentLibrary.
	handler := WADeploymentAwareFileHandler providing: libraries.

	self assert: handler libraries equals: libraries
]
