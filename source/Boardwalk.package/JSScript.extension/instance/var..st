*Boardwalk
var: aVariableName

	^ JSDeclareGlobalNamespace
		named:
			(aVariableName isString
				ifTrue: [ JSStream on: aVariableName ]
				ifFalse: [ aVariableName ])