private
javascriptFunctionDeclarationOn: aStream

	aStream
		nextPutAll: 'function';
		space;
		nextPutAll: self name.
	aStream nextPut: $(.
	self arguments
		do: [ :each | aStream nextPutAll: each ]
		separatedBy: [ aStream nextPut: $, ].
	aStream nextPut: $)