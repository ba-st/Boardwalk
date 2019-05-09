"
A WAOnlineLibraryTest is a test class for testing the behavior of WAOnlineLibrary
"
Class {
	#name : #WAOnlineLibraryTest,
	#superclass : #BWRenderingTest,
	#category : #'Boardwalk-Tests-WebApplication'
}

{ #category : #tests }
WAOnlineLibraryTest >> testUpdateRoot [

	self
		assert:
			(self builder
				rootBlock: [ :root | WATestingOnlineLibrary default updateRoot: root ];
				fullDocument: true;
				render: '')
		equals: '<html><head><title></title><link rel="stylesheet" type="text/css" href="https://cdn.example.com/main1.0.1.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"/></head><body onload="onLoad()"><script type="text/javascript">function onLoad(){};</script></body></html>'
]
