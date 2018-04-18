"
I'm an abstract test case providing facilities to test Seaside components
"
Class {
	#name : #WARenderingTest,
	#superclass : #WAContextTest,
	#category : 'Boardwalk-Tests-WebApplication'
}

{ #category : #testing }
WARenderingTest class >> isAbstract [
	"Override to true if a TestCase subclass is Abstract and should not have
	TestCase instances built from it"

	^self name = #WARenderingTest
]

{ #category : #utility }
WARenderingTest >> builder [

	^ WAHtmlCanvas builder
		fullDocument: false;
		codec: self createCodec;
		yourself
]

{ #category : #utility }
WARenderingTest >> createCodec [

	^ GRPharoUtf8Codec new
]

{ #category : #utility }
WARenderingTest >> fullDocumentRendering: aWARootComponent [

	^ self builder
		fullDocument: true;
		rootBlock: [ :root | aWARootComponent updateRoot: root ];
		render: aWARootComponent
]

{ #category : #utility }
WARenderingTest >> render: aRenderable [

	^ self renderUsing: [ :canvas | canvas render: aRenderable ]
]

{ #category : #utility }
WARenderingTest >> renderUsing: aMonadycBlock [

	^ self builder render: [ :canvas | aMonadycBlock cull: canvas ]
]
