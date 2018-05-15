Class {
	#name : #ITToolbarDisplayModeLabel,
	#superclass : #ITToolbarDisplayMode,
	#category : #'Icetray-Layouting'
}

{ #category : #configuring }
ITToolbarDisplayModeLabel >> configureButton: aButton item: aToolbarItem [
	"ask for label (no icon)"
	aButton getLabelSelector: #label.
	aButton badgeSelector: #badge.
]

{ #category : #accessing }
ITToolbarDisplayModeLabel >> extent [
	^ 45@25
]
