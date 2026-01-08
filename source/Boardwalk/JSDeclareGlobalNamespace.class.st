"
A Javascript variable declaration
"
Class {
	#name : 'JSDeclareGlobalNamespace',
	#superclass : 'JSMember',
	#category : 'Boardwalk-Javascript',
	#package : 'Boardwalk',
	#tag : 'Javascript'
}

{ #category : 'printing' }
JSDeclareGlobalNamespace >> javascriptContentOn: aRenderer [

	aRenderer document identifier: 'var'.
	aRenderer document nextPut: Character space.
	aRenderer render: name
]

{ #category : 'printing' }
JSDeclareGlobalNamespace >> javascriptOn: aStream [

	self javascriptContentOn: aStream
]
