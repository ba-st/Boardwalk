"
A Javascript const variable declaration
"
Class {
	#name : 'JSDeclareConstVariable',
	#superclass : 'JSMember',
	#category : 'Boardwalk-Javascript',
	#package : 'Boardwalk',
	#tag : 'Javascript'
}

{ #category : 'printing' }
JSDeclareConstVariable >> javascriptContentOn: aRenderer [

	aRenderer document identifier: 'const'.
	aRenderer document nextPut: Character space.
	aRenderer render: name
]

{ #category : 'printing' }
JSDeclareConstVariable >> javascriptOn: aStream [

	self javascriptContentOn: aStream
]
