"
Display the toolbar with icons and label only
"
Class {
	#name : #ITToolbarDisplayModeIconAndLabel,
	#superclass : #ITToolbarDisplayMode,
	#category : #'Icetray-Layouting'
}

{ #category : #configuring }
ITToolbarDisplayModeIconAndLabel >> configureButton: aButton item: aToolbarItem [
	"ask for icon and label"
	aButton getLabelSelector: #label.
	aButton getIconSelector: #icon.
	aButton badgeSelector: #badge.
]

{ #category : #accessing }
ITToolbarDisplayModeIconAndLabel >> extent [
	^ 45@40
]
