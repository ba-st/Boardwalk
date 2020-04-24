Extension { #name : #JSFunction }

{ #category : #'*Boardwalk' }
JSFunction >> asArrowFunction: aCollection [

	| function |

	function := JSArrowFunction context: self renderContext.
	statements do: [ :statement | function add: statement ].
	function return: return.
	^ function asArrowFunction: aCollection
]
