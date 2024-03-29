Class {
	#name : #BaselineOfBoardwalk,
	#superclass : #BaselineOf,
	#category : #BaselineOfBoardwalk
}

{ #category : #baselines }
BaselineOfBoardwalk >> baseline: spec [

	<baseline>
	spec
		for: #pharo
		do: [ self
				setUpDependencies: spec;
				setUpPackages: spec.
			spec
				group: 'CI' with: 'Tests';
				group: 'Tools' with: 'Buoy-Tools';
				group: 'Development' with: #('Tests' 'Tools')
			]
]

{ #category : #accessing }
BaselineOfBoardwalk >> projectClass [

	^ MetacelloCypressBaselineProject
]

{ #category : #baselines }
BaselineOfBoardwalk >> setUpDependencies: spec [

	spec
		baseline: 'Buoy' with: [ spec repository: 'github://ba-st/Buoy:v6' ];
		project: 'Buoy-Deployment' copyFrom: 'Buoy' with: [ spec loads: 'Deployment' ];
		project: 'Buoy-SUnit' copyFrom: 'Buoy' with: [ spec loads: 'Dependent-SUnit-Extensions' ];
		project: 'Buoy-Tools' copyFrom: 'Buoy' with: [ spec loads: 'Tools' ].

	spec
		baseline: 'Seaside3' with: [ spec repository: 'github://SeasideSt/Seaside:v3.5.x/repository' ];
		project: 'Seaside3-Javascript'
			copyFrom: 'Seaside3'
			with: [ spec loads: #('Javascript' 'Zinc' 'JSON') ];
		project: 'Seaside3-JQuery' copyFrom: 'Seaside3' with: [ spec loads: 'JQuery-Core' ];
		project: 'Seaside3-Javascript-Tests'
			copyFrom: 'Seaside3'
			with: [ spec loads: 'Javascript Tests' ]
]

{ #category : #baselines }
BaselineOfBoardwalk >> setUpPackages: spec [

	spec
		package: 'Boardwalk' with: [ spec requires: #('Buoy-Deployment' 'Seaside3-Javascript') ];
		group: 'Deployment' with: 'Boardwalk';
		package: 'Boardwalk-SUnit'
			with: [ spec requires: #('Seaside3-Javascript-Tests' 'Boardwalk' 'Buoy-SUnit') ];
		group: 'Dependent-SUnit-Extensions' with: 'Boardwalk-SUnit';
		package: 'Boardwalk-Tests' with: [ spec requires: #('Boardwalk-SUnit' 'Seaside3-JQuery') ];
		group: 'Tests' with: 'Boardwalk-Tests'
]
