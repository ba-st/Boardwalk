tests-accessing
testFilter

	| filtered |

	filtered := WAApplicationDeployed new filter: WAAbstractFileLibrary libraries.

	self
		assert: (filtered includes: WATestingFileMetadataDeploymentLibrary);
		deny: (filtered includes: WATestingFileMetadataDevelopmentLibrary)