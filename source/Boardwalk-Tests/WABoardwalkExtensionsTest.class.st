"
I'm a test of Seaside extensions
"
Class {
	#name : #WABoardwalkExtensionsTest,
	#superclass : #WARenderingTest,
	#category : 'Boardwalk-Tests-WebApplication'
}

{ #category : #tests }
WABoardwalkExtensionsTest >> testFormDoNotSubmit [

	| html |

	html := self
		render: [ :canvas | 
			| form |

			form := canvas form.
			form doNotSubmit ].

	self assert: html equals: '<form accept-charset="utf-8" method="post" action="/" onsubmit="return false;"></form>'
]

{ #category : #tests }
WABoardwalkExtensionsTest >> testTagBrushClasses [

	| html |

	html := self render: [ :canvas | canvas div classes: #('a' 'b') ].
	self assert: html equals: '<div class="a b"></div>'
]

{ #category : #tests }
WABoardwalkExtensionsTest >> testTagBrushIdentifier [

	self
		render: [ :canvas | 
			| div |

			div := canvas div.
			self should: [ div identifier ] raise: AssertionFailed.
			canvas ensureIdFor: div.
			self shouldnt: [ div identifier ] raise: AssertionFailed ]
]

{ #category : #tests }
WABoardwalkExtensionsTest >> testWAAbstractFileLibrary [

	self
		assert: WAAbstractFileLibrary isForDeployment;
		assert: WAAbstractFileLibrary isForDevelopment
]

{ #category : #tests }
WABoardwalkExtensionsTest >> testWAUrlSlash [

	| url |

	url := 'http://www.example.com' seasideUrl.
	self assert: url / 'api' equals: 'http://www.example.com/api' seasideUrl
]
