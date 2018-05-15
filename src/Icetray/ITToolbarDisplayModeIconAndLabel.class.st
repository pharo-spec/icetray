Class {
	#name : #ITToolbarDisplayModeIconAndLabel,
	#superclass : #ITToolbarDisplayMode,
	#category : #Icetray
}

{ #category : #configuring }
ITToolbarDisplayModeIconAndLabel >> configureButton: aButton item: aToolbarItem [
	"ask for icon and label"
	aButton 
		on: aToolbarItem 
		getState: nil
		action: aButton actionSelector
		label: #label 
		icon: #icon 
		menu: nil.
		
	aButton badgeSelector: #badge
]

{ #category : #accessing }
ITToolbarDisplayModeIconAndLabel >> extent [
	^ 45@40
]
