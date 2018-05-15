Class {
	#name : #ITToolbarDisplayModeIcon,
	#superclass : #ITToolbarDisplayMode,
	#category : #'Icetray-Core'
}

{ #category : #configuring }
ITToolbarDisplayModeIcon >> configureButton: aButton item: aToolbarItem [
	"ask for icon (no label)"
	aButton 
		on: aToolbarItem 
		getState: nil
		action: #execute
		label: nil
		icon: #icon 
		menu: nil.
		
	aButton badgeSelector: #badge.
]

{ #category : #accessing }
ITToolbarDisplayModeIcon >> extent [
	^ 25@25
]
