utility
render: aRenderable

	^ self renderUsing: [ :canvas | canvas render: aRenderable ]