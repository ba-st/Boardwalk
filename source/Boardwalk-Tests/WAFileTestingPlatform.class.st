"
I'm a platform wrapping the installed one but providing facilities to test stuff related to the file system
"
Class {
	#name : #WAFileTestingPlatform,
	#superclass : #GRPlatform,
	#instVars : [
		'platform',
		'createdFolders',
		'createdFiles'
	],
	#category : 'Boardwalk-Tests-WebApplication'
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
	createdFiles := SortedCollection new
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

	^ platform openDebuggerOn: anError
]

{ #category : #'file library' }
WAFileTestingPlatform >> pathSeparator [

	<ignoreForCoverage>
	^ platform pathSeparator
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

	^ platform stackDepth
]

{ #category : #processes }
WAFileTestingPlatform >> terminateProcess: aProcess [

	<ignoreForCoverage>
	^ platform terminateProcess: aProcess
]

{ #category : #factory }
WAFileTestingPlatform >> weakDictionaryOfSize: aNumber [

	<ignoreForCoverage>
	^ platform weakDictionaryOfSize: aNumber
]

{ #category : #'file library' }
WAFileTestingPlatform >> write: aStringOrByteArray toFile: aFileNameString inFolder: aFolderString [

	createdFiles add: ('<1s>/<2s>' expandMacrosWith: aFolderString with: aFileNameString)
]
