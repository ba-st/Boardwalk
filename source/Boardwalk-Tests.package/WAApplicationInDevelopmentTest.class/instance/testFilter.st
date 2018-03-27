tests-accessing
testFilter

	| filtered |

	filtered := WAApplicationInDevelopment new filter: WAAbstractFileLibrary libraries.

	self
		assert: (filtered includes: WATestingFileMetadataDevelopmentLibrary);
		deny: (filtered includes: WATestingFileMetadataDeploymentLibrary)