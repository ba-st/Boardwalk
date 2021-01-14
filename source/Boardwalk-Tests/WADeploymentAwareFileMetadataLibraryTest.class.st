"
A WillowFileMetadataLibraryTest is a test class for testing the behavior of WillowFileMetadataLibrary
"
Class {
	#name : #WADeploymentAwareFileMetadataLibraryTest,
	#superclass : #BWRenderingTest,
	#category : #'Boardwalk-Tests-WebApplication'
}

{ #category : #tests }
WADeploymentAwareFileMetadataLibraryTest >> testDefaultCacheDuration [

	self assert: WATestingFileMetadataLibrary defaultCacheDuration equals: ( Duration days: 365 )
]

{ #category : #tests }
WADeploymentAwareFileMetadataLibraryTest >> testDeployFiles [

	self
		assertFileDeploymentOf: WATestingFileMetadataDeploymentLibrary default
		createsAsFolders: #('testing-0.0.0' 'testing-0.0.0/js')
		andFileContentsMatching: {('testing-0.0.0/js/undefined.js' -> 'd5d4cd07616a542891b7ec2d0257b3a24b69856e')}
]

{ #category : #tests }
WADeploymentAwareFileMetadataLibraryTest >> testDeployFilesWhenFileNotMatches [

	self
		should: [ self
				assertFileDeploymentOf: WATestingFileMetadataDeploymentLibrary default
				createsAsFolders: #('testing-0.0.0/js')
				andFileContentsMatching: {('testing-0.0.0/js/undefinedBad.js' -> 'd5d4cd07616a542891b7ec2d0257b3a24b69856e')} ]
		raise: self class classForTestResult failure
]

{ #category : #tests }
WADeploymentAwareFileMetadataLibraryTest >> testDeployFilesWhenFolderIsMissing [

	self
		should: [ self
				assertFileDeploymentOf: WATestingFileMetadataDeploymentLibrary default
				createsAsFolders: #('testing-0.0.0/js')
				andFileContentsMatching: {('testing-0.0.0/js/undefined.js' -> 'd5d4cd07616a542891b7ec2d0257b3a24b69856e')} ]
		raise: self class classForTestResult failure
]

{ #category : #tests }
WADeploymentAwareFileMetadataLibraryTest >> testDeployFilesWithInvalidHash [

	self
		should: [ self
				assertFileDeploymentOf: WATestingFileMetadataDeploymentLibrary default
				createsAsFolders: #('testing-0.0.0' 'testing-0.0.0/js')
				andFileContentsMatching: {('testing-0.0.0/js/undefined.js' -> '000000000000000000000')} ]
		raise: self class classForTestResult failure
]

{ #category : #tests }
WADeploymentAwareFileMetadataLibraryTest >> testForDeployment [

	self assert: WATestingFileMetadataLibrary forDeployment equals: WATestingFileMetadataDeploymentLibrary
]

{ #category : #tests }
WADeploymentAwareFileMetadataLibraryTest >> testForDevelopment [

	self assert: WATestingFileMetadataLibrary forDevelopment equals: WATestingFileMetadataDevelopmentLibrary
]

{ #category : #tests }
WADeploymentAwareFileMetadataLibraryTest >> testHandlesFolder [

	self deny: (WADeploymentAwareFileMetadataLibrary handlesFolder: #folder)
]

{ #category : #tests }
WADeploymentAwareFileMetadataLibraryTest >> testJavascriptGeneration [

	self assert: WATestingFileMetadataDeploymentLibrary default jsUndefinedJsContent equals: 'undefined'
]

{ #category : #tests }
WADeploymentAwareFileMetadataLibraryTest >> testLibraryName [

	self assert: WATestingFileMetadataLibrary libraryName equals: 'testing'
]

{ #category : #tests }
WADeploymentAwareFileMetadataLibraryTest >> testMetadataSourceCodeForFileNamedCompiledAtServingContentAt [

	self
		assert:
			( WATestingFileMetadataLibrary
				metadataSourceCodeForFileNamed: 'css/willow.css'
				compiledAt: #cssWillowCss
				servingContentAt: #cssWillowCssContent )
		equals:  'cssWillowCss

	^ WAFileLibraryResource
		filepath: ''css/willow.css''
		mimeType: WAMimeType textCss
		cacheDuration: self class defaultCacheDuration
		contents: (GRDelayedSend receiver: self selector: #cssWillowCssContent)'
]

{ #category : #tests }
WADeploymentAwareFileMetadataLibraryTest >> testMimeTypeInstantiationCodeFor [

	self
		assert: ( WATestingFileMetadataLibrary mimeTypeInstantiationCodeFor: WAMimeType textJavascript )
			equals: 'WAMimeType textJavascript';
		assert: ( WATestingFileMetadataLibrary mimeTypeInstantiationCodeFor: WAMimeType textCss )
			equals: 'WAMimeType textCss';
		assert: ( WATestingFileMetadataLibrary mimeTypeInstantiationCodeFor: WAMimeType applicationJavascript )
			equals: 'WAMimeType applicationJavascript';
		assert:
			( WATestingFileMetadataLibrary
				mimeTypeInstantiationCodeFor: ( WAMimeType main: 'application' sub: 'x-smalltalk' ) )
			equals: '(WAMimeType main: ''application'' sub: ''x-smalltalk'')'
]
