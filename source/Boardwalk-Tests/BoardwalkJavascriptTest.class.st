"
I'm an unit test for Javascript extensions
"
Class {
	#name : #BoardwalkJavascriptTest,
	#superclass : #JSObjectTest,
	#category : #'Boardwalk-Tests-Javascript'
}

{ #category : #tests }
BoardwalkJavascriptTest >> testJSDeclareGlobalNamespace [

	self
		assert: (self javascript var: 'NS') equals: 'var NS';
		assert: (self javascript var: (JSStream on: 'NS')) equals: 'var NS'
]

{ #category : #tests }
BoardwalkJavascriptTest >> testJSObjectAsImmediatelyInvokedFunctionExpression [

	| jsObject |

	jsObject := (JSStream this equalTo: 0) asImmediatelyInvokedFunctionExpression.

	self assert: jsObject equals: '(function(){this==0}())'
]

{ #category : #tests }
BoardwalkJavascriptTest >> testJSObjectCollect [

	| jsObject |

	jsObject := JSStream this collect: [:currentValue | currentValue access: 'value' ].

	self assert: jsObject equals: 'this.map(function(currentValue){return currentValue.value})'
]

{ #category : #tests }
BoardwalkJavascriptTest >> testJSObjectEqualTo [

	| jsObject |

	jsObject := JSStream this equalTo: 0.

	self assert: jsObject equals: 'this==0'
]

{ #category : #tests }
BoardwalkJavascriptTest >> testJSObjectGreaterThan [

	| jsObject |

	jsObject := JSStream this greaterThan: 0.

	self assert: jsObject equals: 'this>0'
]

{ #category : #tests }
BoardwalkJavascriptTest >> testJSObjectIdenticalTo [

	| jsObject |

	jsObject := JSStream this identicalTo: 0.

	self assert: jsObject equals: 'this===0'
]

{ #category : #tests }
BoardwalkJavascriptTest >> testJSObjectIf [

	| jsObject |

	jsObject := self javascript if: (JSStream this equalTo: 0) then: true.

	self assert: jsObject equals: 'if(this==0){true}'
]

{ #category : #tests }
BoardwalkJavascriptTest >> testJSObjectIfThenElse [

	| jsObject |

	jsObject := self javascript
		if: (JSStream this equalTo: 0)
		then:
			(self javascript
				<< (self javascript var: 'a');
				<< true;
				yourself)
		else: false.

	self assert: jsObject equals: 'if(this==0){var a;true} else {false}'
]

{ #category : #tests }
BoardwalkJavascriptTest >> testJSObjectLGreaterThanOrEqualTo [

	| jsObject |

	jsObject := JSStream this greaterThanOrEqualTo: 0.

	self assert: jsObject equals: 'this>=0'
]

{ #category : #tests }
BoardwalkJavascriptTest >> testJSObjectLLessThanOrEqualTo [

	| jsObject |

	jsObject := JSStream this lessThanOrEqualTo: 0.

	self assert: jsObject equals: 'this<=0'
]

{ #category : #tests }
BoardwalkJavascriptTest >> testJSObjectLessThan [

	| jsObject |

	jsObject := JSStream this lessThan: 0.

	self assert: jsObject equals: 'this<0'
]

{ #category : #tests }
BoardwalkJavascriptTest >> testJSObjectMultiply [

	| jsObject |

	jsObject := JSStream this * 100.

	self assert: jsObject equals: 'this*100'
]

{ #category : #tests }
BoardwalkJavascriptTest >> testJSObjectNotEqualTo [

	| jsObject |

	jsObject := JSStream this notEqualTo: 0.

	self assert: jsObject equals: 'this!=0'
]

{ #category : #tests }
BoardwalkJavascriptTest >> testJSObjectNotIdenticalTo [

	| jsObject |

	jsObject := JSStream this notIdenticalTo: 0.

	self assert: jsObject equals: 'this!==0'
]

{ #category : #tests }
BoardwalkJavascriptTest >> testJSObjectSelect [

	| jsObject |

	jsObject := JSStream this
		select: [ :currentValue | (currentValue access: 'value') equalTo: JSStream undefined ].

	self
		assert: jsObject
		equals: 'this.filter(function(currentValue){return currentValue.value==undefined})'
]

{ #category : #tests }
BoardwalkJavascriptTest >> testJSObjectSessionStorage [

	self assert: JSStream this sessionStorage equals: 'sessionStorage'
]

{ #category : #tests }
BoardwalkJavascriptTest >> testJSObjectTypeOf [

	| jsObject |

	jsObject := JSStream undefined typeOf.

	self assert: jsObject equals: 'typeof undefined'
]
