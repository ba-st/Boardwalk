tests-accessing
testLibraryFor

	self
		assert: (WAApplicationDeployed new libraryFor: WATestingFileMetadataLibrary)
		equals: WATestingFileMetadataDeploymentLibrary