"
I represent an anonymous JavaScript function using the arrow (->) syntax
"
Class {
	#name : 'JSArrowFunction',
	#superclass : 'JSFunction',
	#category : 'Boardwalk-Javascript',
	#package : 'Boardwalk',
	#tag : 'Javascript'
}

{ #category : 'converting' }
JSArrowFunction >> asArrowFunction [

	^ self
]

{ #category : 'converting' }
JSArrowFunction >> asArrowFunction: aCollection [

	self arguments: aCollection
]

{ #category : 'converting' }
JSArrowFunction >> asFunction [

	| function |

	function := JSFunction context: self renderContext.
	function arguments: arguments.
	statements do: [ :statement | function add: statement ].
	function return: return.
	^ function
]

{ #category : 'converting' }
JSArrowFunction >> asFunction: aCollection [

	^ self asFunction asFunction: aCollection
]

{ #category : 'printing' }
JSArrowFunction >> javascriptContentOn: aRenderer [

	aRenderer arguments: [
			arguments
				do: [ :argument | aRenderer document identifier: argument ]
				separatedBy: [ aRenderer document identifier: ',' ]
		].
	aRenderer document identifier: ' => '.
	aRenderer object: [
			statements isEmpty ifFalse: [
					self return
						ifTrue: [
								1 to: statements size - 1 do: [ :index |
										aRenderer render: ( statements at: index ).
										aRenderer document separator
									].
								aRenderer return: statements last
							]
						ifFalse: [
							statements
								do: [ :each | aRenderer render: each ]
								separatedBy: [ aRenderer document separator ] ]
				]
		]
]
