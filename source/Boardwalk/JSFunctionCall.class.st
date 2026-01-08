"
Simple object to represent a call to a JS function.
"
Class {
	#name : 'JSFunctionCall',
	#superclass : 'JSObject',
	#instVars : [
		'functionName',
		'parameters'
	],
	#category : 'Boardwalk-Javascript',
	#package : 'Boardwalk',
	#tag : 'Javascript'
}

{ #category : 'instance creation' }
JSFunctionCall class >> for: aFunctionName [ 

	^ self for: aFunctionName withAll: #()
]

{ #category : 'instance creation' }
JSFunctionCall class >> for: aFunctionName with: anArgument [

	^ self for: aFunctionName withAll: {anArgument}
]

{ #category : 'instance creation' }
JSFunctionCall class >> for: aFunctionName withAll: aParameterCollection [

	^self new initializeFor: aFunctionName withAll: aParameterCollection
]

{ #category : 'initialize-release' }
JSFunctionCall >> initializeFor: aFunctionName withAll: aParameterCollection [

	functionName := aFunctionName.
	parameters := aParameterCollection
]

{ #category : 'printing' }
JSFunctionCall >> javascriptContentOn: aRenderer [

	( aRenderer function: functionName ) with: [
			parameters do: [ :parameter | aRenderer argument: parameter ] ]
]
