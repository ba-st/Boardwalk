"
A WAFileMetadataLibraryDeployerTest is a test class for testing the behavior of WAFileMetadataLibraryDeployer
"
Class {
	#name : #WAFileMetadataLibraryDeployerTest,
	#superclass : #BWRenderingTest,
	#category : #'Boardwalk-Tests-WebApplication'
}

{ #category : #test }
WAFileMetadataLibraryDeployerTest >> testDeployFiles [

	| deployer |

	deployer := WAFileMetadataLibraryDeployer deployingAll: {WATestingFileMetadataLibrary}.
	self
		useFileTestingPlatformDuring: [ deployer deployFiles.
			self
				assert: GRPlatform current createdFolders equals: #('testing-0.0.0' 'testing-0.0.0/js');
				assert: GRPlatform current createdFiles equals: #('testing-0.0.0/js/undefined.js')
			]
]

{ #category : #test }
WAFileMetadataLibraryDeployerTest >> testDeployFilesMetadata [

	| deployer |

	deployer := WAFileMetadataLibraryDeployer deployingAll: {WATestingFileMetadataLibrary}.
	self
		useFileTestingPlatformDuring: [ | parsedContents |

			GRPlatform current recordFileContents.
			deployer deployFilesMetadata.
			self
				assert: GRPlatform current createdFolders isEmpty;
				assert: GRPlatform current createdFiles equals: #('./libraries-metadata.json').

			parsedContents := WAJsonParser
				parse: ( GRPlatform current savedContentsFor: './libraries-metadata.json' ).
			self
				assert: ( parsedContents at: 'filePath' ) equals: 'testing-0.0.0/js/undefined.js';
				assert: ( parsedContents at: 'mediaType' ) equals: 'text/javascript';
				assert: ( parsedContents at: 'cacheDurationInMs' ) equals: 60000
			]
]
