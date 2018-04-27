"
I'm a library for testing purposes
"
Class {
	#name : #WATestingOnlineLibrary,
	#superclass : #WAOnlineLibrary,
	#category : #'Boardwalk-Tests-WebApplication'
}

{ #category : #Updating }
WATestingOnlineLibrary >> updateRoot: aRoot [

	aRoot stylesheet
		url: ('https://cdn.example.com/main<1s>.css' expandMacrosWith: self version);
		anonymousSubResourceIntegrity: 'sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u'
]

{ #category : #Updating }
WATestingOnlineLibrary >> version [ 

	^'1.0.1'
]
