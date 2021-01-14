"
A Javascript const variable declaration
"
Class {
	#name : #JSDeclareConstVariable,
	#superclass : #JSMember,
	#category : #'Boardwalk-Javascript'
}

{ #category : #printing }
JSDeclareConstVariable >> javascriptContentOn: aStream [

	aStream
		nextPutAll: 'const';
		space;
		javascript: name
]

{ #category : #printing }
JSDeclareConstVariable >> javascriptOn: aStream [

	self javascriptContentOn: aStream
]
