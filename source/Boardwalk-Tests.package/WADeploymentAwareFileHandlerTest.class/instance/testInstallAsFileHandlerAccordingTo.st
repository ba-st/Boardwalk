tests-accessing
testInstallAsFileHandlerAccordingTo

	self
		changeRegisteredFileHandlerDuring: [ | handler |

			handler := WADeploymentAwareFileHandler installAsFileHandlerAccordingTo: WAApplicationInDevelopment new.
			self
				assert: (handler libraries includes: WATestingFileMetadataDevelopmentLibrary);
				assert: WAFileHandler default equals: handler;
				assert: (WATestingFileMetadataDevelopmentLibrary default urlOf: #'' using: handler) greaseString equals: '/files/testing-0.0.0' ]