"
Display the toolbar with icons only
"
Class {
	#name : #ITToolbarDisplayModeIcon,
	#superclass : #ITToolbarDisplayMode,
	#category : #'Icetray-Layouting'
}

{ #category : #configuring }
ITToolbarDisplayModeIcon >> configureButton: aButton item: aToolbarItem [
	"ask for icon (no label)"
	aButton getIconSelector: #icon.
	aButton badgeSelector: #badge.
]

{ #category : #accessing }
ITToolbarDisplayModeIcon >> extent [
	^ 25@25
]
