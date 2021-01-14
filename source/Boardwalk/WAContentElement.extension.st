Extension { #name : #WAContentElement }

{ #category : #'*Boardwalk' }
WAContentElement >> anonymousSubResourceIntegrity: theIntegrityMetadata [

	self
		attributeAt: 'integrity' put: theIntegrityMetadata;
		attributeAt: 'crossorigin' put: 'anonymous'
]
