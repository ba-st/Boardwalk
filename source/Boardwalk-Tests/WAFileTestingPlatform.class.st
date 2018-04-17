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

{ #category : #comet }
WAFileTestingPlatform >> cometWait [
	
	^platform cometWait 
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
WAFileTestingPlatform >> ensureExistenceOfFolder: aString [

	createdFolders add: aString.
	^ true
]

{ #category : #initialization }
WAFileTestingPlatform >> initializeWrapping: aGRPlatform [

	platform := aGRPlatform.
	createdFolders := GRSmallOrderedSet new.
	createdFiles := SortedCollection new
]

{ #category : #'file library' }
WAFileTestingPlatform >> localNameOf: aString [

	^ platform localNameOf: aString
]

{ #category : #'file library' }
WAFileTestingPlatform >> pathSeparator [

	^ platform pathSeparator
]

{ #category : #factory }
WAFileTestingPlatform >> semaphoreClass [

	^ platform semaphoreClass
]

{ #category : #'file library' }
WAFileTestingPlatform >> write: aStringOrByteArray toFile: aFileNameString inFolder: aFolderString [

	createdFiles add: ('<1s>/<2s>' expandMacrosWith: aFolderString with: aFileNameString)
]
