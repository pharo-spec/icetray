Extension { #name : #PluggableButtonMorph }

{ #category : #'*Icetray' }
PluggableButtonMorph >> getIconSelector [

	^ getIconSelector
]

{ #category : #'*Icetray' }
PluggableButtonMorph >> getIconSelector: aSelector [

	getIconSelector := aSelector.
	self update: getIconSelector.
]

{ #category : #'*Icetray' }
PluggableButtonMorph >> getLabelSelector [

	^ getLabelSelector
]

{ #category : #'*Icetray' }
PluggableButtonMorph >> getLabelSelector: aSelector [

	getLabelSelector := aSelector.
	self update: getLabelSelector.
]
