utility
fullDocumentRendering: aWARootComponent

	^ self builder
		fullDocument: true;
		rootBlock: [ :root | aWARootComponent updateRoot: root ];
		render: aWARootComponent