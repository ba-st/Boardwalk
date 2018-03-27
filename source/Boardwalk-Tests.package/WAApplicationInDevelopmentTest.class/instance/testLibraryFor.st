tests-accessing
testLibraryFor

	self
		assert: (WAApplicationInDevelopment new libraryFor: WATestingFileMetadataLibrary)
		equals: WATestingFileMetadataDevelopmentLibrary