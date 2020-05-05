"
I'm an abstract metadata library, allowing my subclasses to declare what name to use instead of the class name for url resolution.
"
Class {
	#name : #WADeploymentAwareFileMetadataLibrary,
	#superclass : #WAFileMetadataLibrary,
	#category : #'Boardwalk-WebApplication'
}

{ #category : #'file addition' }
WADeploymentAwareFileMetadataLibrary class >> addFileNamed: filename contents: aByteArrayOrString [

	<ignoreForCoverage>
	| selector code contentSelector |

	selector := self asSelector: filename.
	contentSelector := selector , 'Content'.
	code := self
		metadataSourceCodeForFileNamed: filename
		compiledAt: selector
		servingContentAt: contentSelector.
	GRPlatform current compile: code into: self classified: self methodCategory , ' metadata'.
	( self isBinary: filename )
		ifTrue: [ self compileBinary: aByteArrayOrString selector: contentSelector ]
		ifFalse: [ self compileText: aByteArrayOrString selector: contentSelector ]
]

{ #category : #Accessing }
WADeploymentAwareFileMetadataLibrary class >> defaultCacheDuration [

	"Since this libraries are intended to be immutable including the version 
	in the path to serve we can cache the responses the maximum allowed time"

	^ Duration seconds: 31536000
]

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

{ #category : #'file addition' }
WADeploymentAwareFileMetadataLibrary class >> metadataSourceCodeForFileNamed: filename compiledAt: selector servingContentAt: contentSelector [

	| mimeType |

	mimeType := self mimetypeFor: ( filename copyAfterLast: $. ).
	^ String
		streamContents: [ :stream | 
			stream
				nextPutAll: selector; cr;
				cr;
				tab; nextPutAll: '^ WAFileLibraryResource'; cr;
				tab; tab; nextPutAll: 'filepath: '''; nextPutAll: filename; nextPutAll: ''''; cr;
				tab; tab; nextPutAll: 'mimeType: '; nextPutAll: ( self mimeTypeInstantiationCodeFor: mimeType ); cr;
				tab; tab; nextPutAll: 'cacheDuration: self class defaultCacheDuration'; cr;
				tab; tab; nextPutAll: 'contents: (GRDelayedSend receiver: self selector: #'; nextPutAll: contentSelector; nextPutAll: ')'
			]
]

{ #category : #'file addition' }
WADeploymentAwareFileMetadataLibrary class >> mimeTypeInstantiationCodeFor: mimeType [

	^ ( WAMimeType class allSelectorsInProtocol: #convenience ) , #(#applicationJavascript)
		detect: [ :selector | ( WAMimeType perform: selector ) = mimeType ]
		ifFound: [ :selector | 'WAMimeType <1s>' expandMacrosWith: selector greaseString ]
		ifNone: [ '(WAMimeType main: ''<1s>'' sub: ''<2s>'')' expandMacrosWith: mimeType main with: mimeType sub ]
]

{ #category : #Accessing }
WADeploymentAwareFileMetadataLibrary class >> version [

	^ self subclassResponsibility
]

{ #category : #'private - utility' }
WADeploymentAwareFileMetadataLibrary >> javascriptContentFrom: aMonadycBlock [

	WACurrentRequestContext
		use: ( WARequestContext request: WARequest new response: WABufferedResponse new )
		during: [ WAHtmlCanvas builder
				fullDocument: false;
				render: [ :canvas | 
					canvas requestContext
						push: WARequestHandler new
						during: [ | javascript |

							javascript := canvas javascript.
							aMonadycBlock cull: javascript.
							^ javascript greaseString
							]
					]
			]
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
