utility
renderUsing: aMonadycBlock

	^ self builder render: [ :canvas | aMonadycBlock cull: canvas ]