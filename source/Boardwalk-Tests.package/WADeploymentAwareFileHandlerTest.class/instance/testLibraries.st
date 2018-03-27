tests-accessing
testLibraries

	| libraries handler |

	libraries := Array with: WATestingFileMetadataDeploymentLibrary.
	handler := WADeploymentAwareFileHandler providing: libraries.

	self assert: handler libraries equals: libraries