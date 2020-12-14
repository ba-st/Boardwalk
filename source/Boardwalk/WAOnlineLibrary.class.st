"
I'm a library serving files for an online location. Just redefine updateRoot: and update the header as requested.
"
Class {
	#name : #WAOnlineLibrary,
	#superclass : #WAObject,
	#category : 'Boardwalk-WebApplication'
}

{ #category : #accessing }
WAOnlineLibrary class >> default [

	^ self new
]

{ #category : #Updating }
WAOnlineLibrary >> updateRoot: aRoot [

	self subclassResponsibility 
]

{ #category : #Accessing }
WAOnlineLibrary >> version [

	^ self subclassResponsibility
]
