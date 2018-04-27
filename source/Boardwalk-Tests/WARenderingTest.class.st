"
I'm an abstract test case providing facilities to test Seaside components
"
Class {
	#name : #WARenderingTest,
	#superclass : #WAContextTest,
	#category : #'Boardwalk-Tests-WebApplication'
}

{ #category : #testing }
WARenderingTest class >> isAbstract [
	"Override to true if a TestCase subclass is Abstract and should not have
	TestCase instances built from it"

	^self name = #WARenderingTest
]

{ #category : #asserting }
WARenderingTest >> assertFileDeploymentOf: fileMetadataLibrary createsAsFolders: expectedFolders andFileContentsMatching: expectedFilesMetadata [

	"expectedFilesMetadata MUST be a collection of associations with key = expectedFilePath and value = expectedFileContentsHash"

	self
		useFileTestingPlatformDuring: [ | expectedFiles hashByFile |

			fileMetadataLibrary deployFiles.
			expectedFiles := expectedFilesMetadata asArray collect: [ :fileMetadata | fileMetadata key ].
			hashByFile := expectedFilesMetadata asDictionary.
			self
				assert: GRPlatform current createdFolders equals: expectedFolders asArray;
				assert: GRPlatform current createdFiles equals: expectedFiles.
			hashByFile keysAndValuesDo: [ :file :hash | self assert: (GRPlatform current savedHashFor: file)  equals: hash ] ]
]

{ #category : #utility }
WARenderingTest >> builder [

	^ WAHtmlCanvas builder
		fullDocument: false;
		codec: self createCodec;
		yourself
]

{ #category : #utility }
WARenderingTest >> createCodec [

	^ GRPharoUtf8Codec new
]

{ #category : #utility }
WARenderingTest >> fullDocumentRendering: aWARootComponent [

	^ self builder
		fullDocument: true;
		rootBlock: [ :root | aWARootComponent updateRoot: root ];
		render: aWARootComponent
]

{ #category : #utility }
WARenderingTest >> render: aRenderable [

	^ self renderUsing: [ :canvas | canvas render: aRenderable ]
]

{ #category : #utility }
WARenderingTest >> renderUsing: aMonadycBlock [

	^ self builder render: [ :canvas | aMonadycBlock cull: canvas ]
]

{ #category : #utility }
WARenderingTest >> useFileTestingPlatformDuring: aBlock [

	| installedPlatform |

	installedPlatform := GRPlatform current.
	[ GRPlatform current: (WAFileTestingPlatform wrapping: installedPlatform).
	aBlock value ]
		ensure: [ GRPlatform current: installedPlatform ]
]
