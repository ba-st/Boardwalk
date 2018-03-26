utility
fullDocumentRendering: aWARootComponent

	| builder html |

	builder := WAHtmlCanvas builder
		fullDocument: true;
		rootBlock: [ :root | aWARootComponent updateRoot: root ];
		codec: self codec.
	html := WACurrentRequestContext
		use: self
		during: [ builder render: aWARootComponent ].
	^ html