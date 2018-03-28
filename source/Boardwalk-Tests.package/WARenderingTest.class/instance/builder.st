utility
builder

	^ WAHtmlCanvas builder
		fullDocument: false;
		codec: self createCodec;
		yourself