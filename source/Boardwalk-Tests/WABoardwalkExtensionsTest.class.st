"
I'm a test of Seaside extensions
"
Class {
	#name : #WABoardwalkExtensionsTest,
	#superclass : #BWRenderingTest,
	#category : #'Boardwalk-Tests-WebApplication'
}

{ #category : #tests }
WABoardwalkExtensionsTest >> testExecuteAjaxCallbackUsingOn [

	self
		renderUsing: [ :canvas | 
			| valuesReceived |

			canvas jQuery ajax script: [ :subScript | valuesReceived add: 3 ].
			canvas jQuery ajax script: [ :subScript | valuesReceived add: 7 ].

			valuesReceived := OrderedCollection new.
			self executeAjaxCallbackUsing: ( Array with: '1' -> self ) asDictionary on: canvas.
			self assertCollection: valuesReceived hasSameElements: #(3).

			valuesReceived := OrderedCollection new.
			self executeAjaxCallbackUsing: ( Array with: '2' -> self ) asDictionary on: canvas.
			self assertCollection: valuesReceived hasSameElements: #(7)
			]
]

{ #category : #tests }
WABoardwalkExtensionsTest >> testExecuteAjaxCallbacksOn [

	| valuesReceived |

	valuesReceived := OrderedCollection new.
	self
		renderUsing: [ :canvas | 
			canvas jQuery ajax script: [ :subScript | valuesReceived add: valuesReceived size + 1 ].
			self assert: valuesReceived isEmpty.

			self executeAjaxCallbacksOn: canvas.
			self assertCollection: valuesReceived hasSameElements: #(1).

			self executeAjaxCallbacksOn: canvas.
			self assertCollection: valuesReceived hasSameElements: #(1 2)
			]
]

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
WABoardwalkExtensionsTest >> testFullDocumentRendering [

	self
		assert: (self fullDocumentRendering: WATestingRootComponent new)
		equals:
			'<html><head><title>Hello</title></head><body onload="onLoad()">Hello world!<script type="text/javascript">function onLoad(){};</script></body></html>'
]

{ #category : #tests }
WABoardwalkExtensionsTest >> testTagBrushClasses [

	| html |

	html := self render: [ :canvas | canvas div classes: #('a' 'b') ].
	self assert: html equals: '<div class="a b"></div>'
]

{ #category : #tests }
WABoardwalkExtensionsTest >> testTagBrushIdentifierOn [

	self
		render: [ :canvas | self shouldnt: [ canvas div identifierOn: canvas ] raise: AssertionFailed ]
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
