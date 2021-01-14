Extension { #name : #WAFormTag }

{ #category : #'*Boardwalk' }
WAFormTag >> doNotSubmit [

	self onSubmit: 'return false;'
]
