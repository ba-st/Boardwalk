"
I'm a component used for testing purposes
"
Class {
	#name : #WATestingRootComponent,
	#superclass : #WAPainter,
	#category : #'Boardwalk-Tests-WebApplication'
}

{ #category : #rendering }
WATestingRootComponent >> renderContentOn: html [

	html text: 'Hello world!'
]

{ #category : #updating }
WATestingRootComponent >> updateRoot: aRoot [

	super updateRoot: aRoot.
	aRoot title: 'Hello'
]
