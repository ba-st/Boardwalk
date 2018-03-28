Testing
handlesFolder: aSymbol

	^ self ~~ WADeploymentAwareFileMetadataLibrary and: [ self subclasses isEmpty and: [ self folderName = aSymbol greaseString ] ]