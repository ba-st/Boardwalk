Extension { #name : #String }

{ #category : #'*Boardwalk' }
String >> asArrowFunction: aCollection [

	^ ( JSStream on: self ) asArrowFunction: aCollection
]
