"
A Javascript variable declaration
"
Class {
	#name : #JSDeclareGlobalNamespace,
	#superclass : #JSMember,
	#category : #'Boardwalk-Javascript'
}

{ #category : #printing }
JSDeclareGlobalNamespace >> javascriptContentOn: aStream [

	aStream
		nextPutAll: 'var';
		space;
		javascript: name
]

{ #category : #printing }
JSDeclareGlobalNamespace >> javascriptOn: aStream [

	self javascriptContentOn: aStream
]
