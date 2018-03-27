tests-accessing
testInstallAsFileHandlerAccordingToServedAt

	self
		changeRegisteredFileHandlerDuring: [ | handler |

			handler := WADeploymentAwareFileHandler installAsFileHandlerAccordingTo: WAApplicationInDevelopment new servedAt: 'https://cdn.example.com' seasideUrl.
			self
				assert: (handler libraries includes: WATestingFileMetadataDevelopmentLibrary);
				assert: WAFileHandler default equals: handler;
				assert: (WATestingFileMetadataDevelopmentLibrary default urlOf: #'' using: handler) greaseString equals: 'https://cdn.example.com/testing-0.0.0' ]