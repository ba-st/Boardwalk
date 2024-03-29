"
I'm a platform wrapping the installed one but providing facilities to test stuff related to the file system
"
Class {
	#name : #WAFileTestingPlatform,
	#superclass : #GRPlatform,
	#instVars : [
		'platform',
		'createdFolders',
		'createdFiles',
		'hashByFile',
		'contentsByFileOptional'
	],
	#category : #'Boardwalk-SUnit'
}

{ #category : #Configuring }
WAFileTestingPlatform class >> wrapping: aGRPlatform [

	^ self new initializeWrapping: aGRPlatform
]

{ #category : #startup }
WAFileTestingPlatform >> addToShutDownList: anObject [

	<ignoreForCoverage>
	^ platform addToShutDownList: anObject
]

{ #category : #startup }
WAFileTestingPlatform >> addToStartUpList: anObject [

	<ignoreForCoverage>
	^ platform addToStartUpList: anObject
]

{ #category : #'file library' }
WAFileTestingPlatform >> asMethodReturningByteArray: aByteArrayOrString named: aSymbol [

	<ignoreForCoverage>
	^ platform asMethodReturningByteArray: aByteArrayOrString named: aSymbol
]

{ #category : #encoding }
WAFileTestingPlatform >> base64Decode: aString [

	<ignoreForCoverage>
	^ platform base64Decode: aString
]

{ #category : #'file library' }
WAFileTestingPlatform >> compile: aString into: aClass classified: aSymbol [

	<ignoreForCoverage>
	^ platform compile: aString into: aClass classified: aSymbol
]

{ #category : #'file library' }
WAFileTestingPlatform >> contentsOfFile: aString binary: aBoolean [

	<ignoreForCoverage>
	^ platform contentsOfFile: aString binary: aBoolean
]

{ #category : #accessing }
WAFileTestingPlatform >> createdFiles [

	^ createdFiles asArray
]

{ #category : #accessing }
WAFileTestingPlatform >> createdFolders [

	^ (SortedCollection withAll: createdFolders) asArray
]

{ #category : #'file library' }
WAFileTestingPlatform >> directoriesIn: aPathString [

	<ignoreForCoverage>
	^ platform directoriesIn: aPathString
]

{ #category : #'file library' }
WAFileTestingPlatform >> ensureExistenceOfFolder: aString [

	createdFolders add: aString.
	^ true
]

{ #category : #'file library' }
WAFileTestingPlatform >> fileExists: aString [

	<ignoreForCoverage>
	^ platform fileExists: aString
]

{ #category : #'file library' }
WAFileTestingPlatform >> fileStreamOn: aString do: aBlock binary: aBoolean [

	<ignoreForCoverage>
	^ platform fileStreamOn: aString do: aBlock binary: aBoolean
]

{ #category : #'file library' }
WAFileTestingPlatform >> filesIn: aPathString [

	<ignoreForCoverage>
	^ platform filesIn: aPathString
]

{ #category : #initialization }
WAFileTestingPlatform >> initializeWrapping: aGRPlatform [

	platform := aGRPlatform.
	createdFolders := GRSmallOrderedSet new.
	createdFiles := SortedCollection new.
	hashByFile := GRSmallDictionary new.
	contentsByFileOptional := Optional unused
]

{ #category : #processes }
WAFileTestingPlatform >> isProcessTerminated: aProcess [

	<ignoreForCoverage>
	^ platform isProcessTerminated: aProcess
]

{ #category : #'version info' }
WAFileTestingPlatform >> label [

	^ 'File Testing Wrapper'
]

{ #category : #'file library' }
WAFileTestingPlatform >> localNameOf: aString [

	<ignoreForCoverage>
	^ platform localNameOf: aString
]

{ #category : #factory }
WAFileTestingPlatform >> newRandom [

	<ignoreForCoverage>
	^ platform newRandom
]

{ #category : #'file library' }
WAFileTestingPlatform >> newline [

	<ignoreForCoverage>
	^ platform newline
]

{ #category : #exceptions }
WAFileTestingPlatform >> openDebuggerOn: anError [

	<ignoreForCoverage>
	^ platform openDebuggerOn: anError
]

{ #category : #'file library' }
WAFileTestingPlatform >> pathSeparator [

	<ignoreForCoverage>
	^ platform pathSeparator
]

{ #category : #'file library' }
WAFileTestingPlatform >> readFileStreamOn: aString do: aBlock binary: aBoolean [

	<ignoreForCoverage>
	^ platform readFileStreamOn: aString do: aBlock binary: aBoolean
]

{ #category : #factory }
WAFileTestingPlatform >> readWriteByteStream [

	<ignoreForCoverage>
	^ platform readWriteByteStream
]

{ #category : #factory }
WAFileTestingPlatform >> readWriteCharacterStream [

	<ignoreForCoverage>
	^ platform readWriteCharacterStream
]

{ #category : #initialization }
WAFileTestingPlatform >> recordFileContents [

	contentsByFileOptional := Optional containing: Dictionary new
]

{ #category : #startup }
WAFileTestingPlatform >> removeFromShutDownList: anObject [

	<ignoreForCoverage>
	^ platform removeFromShutDownList: anObject
]

{ #category : #startup }
WAFileTestingPlatform >> removeFromStartUpList: anObject [

	<ignoreForCoverage>
	^ platform removeFromStartUpList: anObject
]

{ #category : #'file library' }
WAFileTestingPlatform >> removeSelector: aSymbol from: aClass [

	<ignoreForCoverage>
	^ platform removeSelector: aSymbol from: aClass
]

{ #category : #accessing }
WAFileTestingPlatform >> savedContentsFor: aFilePath [

	^ contentsByFileOptional
		withContentDo: [ :contentsByFile | 
			contentsByFile
				at: aFilePath
				ifAbsent: [ TestResult resumableFailure
						signal:
							( 'File not found for <1s>. Please review the changes in the metadata library under test'
								expandMacrosWith: aFilePath )
					]
			]
		ifUnused: [ TestResult failure signal: 'File content recording was not activated. Send #recordFileContents' ]
]

{ #category : #accessing }
WAFileTestingPlatform >> savedHashFor: aFilePath [

	^ hashByFile at: aFilePath ifAbsent: [ TestResult resumableFailure signal: ('Hash not found for <1s>. Please review the changes in the metadata library under test' expandMacrosWith: aFilePath) ]
]

{ #category : #cryptography }
WAFileTestingPlatform >> secureHashFor: aString [

	<ignoreForCoverage>
	^ platform secureHashFor: aString
]

{ #category : #factory }
WAFileTestingPlatform >> semaphoreClass [

	<ignoreForCoverage>
	^ platform semaphoreClass
]

{ #category : #exceptions }
WAFileTestingPlatform >> stackDepth [

	<ignoreForCoverage>
	^ platform stackDepth
]

{ #category : #processes }
WAFileTestingPlatform >> terminateProcess: aProcess [

	<ignoreForCoverage>
	^ platform terminateProcess: aProcess
]

{ #category : #processes }
WAFileTestingPlatform >> thisContext [

	<ignoreForCoverage>
	^ platform thisContext
]

{ #category : #factory }
WAFileTestingPlatform >> weakDictionaryOfSize: aNumber [

	<ignoreForCoverage>
	^ platform weakDictionaryOfSize: aNumber
]

{ #category : #'file library' }
WAFileTestingPlatform >> write: aStringOrByteArray toFile: aFileNameString inFolder: aFolderString [

	| filePathString |

	filePathString := '<1s>/<2s>' expandMacrosWith: aFolderString with: aFileNameString.
	createdFiles add: filePathString.
	hashByFile at: filePathString put: ( self secureHashFor: aStringOrByteArray ) hex.
	contentsByFileOptional
		withContentDo: [ :contentsByFile | contentsByFile at: filePathString put: aStringOrByteArray ]
]

{ #category : #'file library' }
WAFileTestingPlatform >> writeFileStreamOn: aString do: aBlock binary: aBoolean [

	<ignoreForCoverage>
	^ platform writeFileStreamOn: aString do: aBlock binary: aBoolean
]
