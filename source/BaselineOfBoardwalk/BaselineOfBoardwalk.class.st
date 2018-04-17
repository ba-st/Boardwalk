Class {
	#name : #BaselineOfBoardwalk,
	#superclass : #BaselineOf,
	#category : 'BaselineOfBoardwalk'
}

{ #category : #baselines }
BaselineOfBoardwalk >> baseline: spec [

	<baseline>
	spec
		for: #common
		do: [ self setUpDependencies: spec.
			spec
				package: 'Boardwalk' with: [ spec requires: #('Buoy' 'Seaside3') ];
				package: 'Boardwalk-Tests' with: [ spec requires: #('Seaside3-Tests' 'Boardwalk') ].
			spec
				group: 'Deployment' with: #('Boardwalk');
				group: 'Development' with: #('Deployment' 'Boardwalk-Tests');
				group: 'default' with: #('Deployment') ]
]

{ #category : #baselines }
BaselineOfBoardwalk >> setUpDependencies: spec [

	spec
		baseline: 'Buoy' with: [ spec repository: 'github://ba-st/Buoy:v3.1.0/source' ];
		import: 'Buoy'.
	spec
		baseline: 'Seaside3'
			with: [ spec
				repository: 'github://SeasideSt/Seaside:v3.2.4/repository';
				loads: #('Seaside-Environment' 'Javascript' 'Zinc') ];
		project: 'Seaside3-Tests' copyFrom: 'Seaside3' with: [ spec loads: #('Seaside-Tests-Core' 'Javascript-Tests-Core') ]
]
