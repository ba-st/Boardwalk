"
I'm an abstract test case providing facilities to test Seaside components
"
Class {
	#name : #BWRenderingTest,
	#superclass : #WAContextTest,
	#category : #'Boardwalk-SUnit'
}

{ #category : #testing }
BWRenderingTest class >> isAbstract [

	^ self name = #BWRenderingTest
]

{ #category : #asserting }
BWRenderingTest >> assertFileDeploymentOf: fileMetadataLibrary
	createsAsFolders: expectedFolders
	andFileContentsMatching: expectedFilesMetadata [


	"expectedFilesMetadata MUST be a collection of associations with key = expectedFilePath and value = expectedFileContentsHash"

	self
		useFileTestingPlatformDuring: [ | expectedFiles hashByFile |

			fileMetadataLibrary deployFiles.
			expectedFiles := expectedFilesMetadata asArray collect: [ :fileMetadata | fileMetadata key ].
			hashByFile := expectedFilesMetadata asDictionary.
			self
				assert: GRPlatform current createdFolders equals: expectedFolders asArray;
				assert: GRPlatform current createdFiles equals: expectedFiles.
			hashByFile
				keysAndValuesDo: [ :file :hash | 
					self
						assert: ( '<1s>: <2s>' expandMacrosWith: file with: ( GRPlatform current savedHashFor: file ) )
						equals: ( '<1s>: <2s>' expandMacrosWith: file with: hash )
					]
			]
]

{ #category : #utility }
BWRenderingTest >> builder [

	^ WAHtmlCanvas builder
		fullDocument: false;
		codec: self createCodec;
		yourself
]

{ #category : #utility }
BWRenderingTest >> createCodec [

	^ GRPharoUtf8Codec new
]

{ #category : #utility }
BWRenderingTest >> createHandlers [

	^ Array with: WARequestHandler new
]

{ #category : #utility }
BWRenderingTest >> executeAjaxCallbackUsing: aDictionary on: aCanvas [

	| ajaxRequestContext ajaxRequest |

	ajaxRequest := ( WARequest method: 'POST' uri: WARequest defaultUri )
		setPostFields:
			( WARequestFields new
				addAll: aDictionary;
				yourself );
		yourself.

	ajaxRequestContext := WARequestContext
		request: ajaxRequest
		response: self createResponse
		codec: self createCodec.

	[ aCanvas callbacks handle: ajaxRequestContext ]
		on: WAResponseNotification
		do: [ :notification | self assert: ajaxRequestContext response status equals: 200 ]
]

{ #category : #utility }
BWRenderingTest >> executeAjaxCallbacksOn: aCanvas [

	| numberOfCallbacks callbackKeys |

	numberOfCallbacks := aCanvas context callbacks nextKey asInteger - 1.
	callbackKeys := Dictionary new.
	1 to: numberOfCallbacks do: [ :index | "The value for the key is not used" callbackKeys at: index asString put: index ].
	self executeAjaxCallbackUsing: callbackKeys on: aCanvas
]

{ #category : #utility }
BWRenderingTest >> fullDocumentRendering: aWARootComponent [

	^ self builder
		fullDocument: true;
		rootBlock: [ :root | aWARootComponent updateRoot: root ];
		render: aWARootComponent
]

{ #category : #utility }
BWRenderingTest >> render: aRenderable [

	^ self renderUsing: [ :canvas | canvas render: aRenderable ]
]

{ #category : #utility }
BWRenderingTest >> renderUsing: aMonadycBlock [

	^ self builder render: [ :canvas | aMonadycBlock cull: canvas ]
]

{ #category : #utility }
BWRenderingTest >> useFileTestingPlatformDuring: aBlock [

	| installedPlatform |

	installedPlatform := GRPlatform current.
	[ GRPlatform current: ( WAFileTestingPlatform wrapping: installedPlatform ).
	aBlock value
	]
		ensure: [ GRPlatform current: installedPlatform ]
]
