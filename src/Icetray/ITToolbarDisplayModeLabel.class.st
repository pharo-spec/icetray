Class {
	#name : #ITToolbarDisplayModeLabel,
	#superclass : #ITToolbarDisplayMode,
	#category : #'Icetray-Core'
}

{ #category : #configuring }
ITToolbarDisplayModeLabel >> configureButton: aButton item: aToolbarItem [
	"ask for label (no icon)"
	aButton 
		on: aToolbarItem 
		getState: nil
		action: #execute
		label: #label 
		icon: nil		
		menu: nil

]

{ #category : #accessing }
ITToolbarDisplayModeLabel >> extent [
	^ 45@25
]
