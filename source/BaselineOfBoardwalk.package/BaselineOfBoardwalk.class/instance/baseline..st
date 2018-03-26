baselines
baseline: spec

	<baseline>
	spec
		for: #common
		do: [ self setUpDependencies: spec.
			spec
				package: 'Boardwalk' with: [ spec requires: #('Seaside3') ];
				package: 'Boardwalk-Tests' with: [ spec requires: #('Seaside3-Tests' 'Boardwalk') ].
			spec
				group: 'Deployment' with: #('Boardwalk');
				group: 'Development' with: #('Deployment' 'Boardwalk-Tests');
				group: 'default' with: #('Deployment') ]