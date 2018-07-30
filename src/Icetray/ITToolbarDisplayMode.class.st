"
Abstract superclass for different display modes for a toolbar
"
Class {
	#name : #ITToolbarDisplayMode,
	#superclass : #Object,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Icetray-Layouting'
}

{ #category : #accessing }
ITToolbarDisplayMode class >> default [
	^ self modeIconAndLabel
]

{ #category : #accessing }
ITToolbarDisplayMode class >> modeIcon [
	^ ITToolbarDisplayModeIcon uniqueInstance
]

{ #category : #accessing }
ITToolbarDisplayMode class >> modeIconAndLabel [
	^ ITToolbarDisplayModeIconAndLabel uniqueInstance
]

{ #category : #accessing }
ITToolbarDisplayMode class >> modeLabel [
	^ ITToolbarDisplayModeLabel uniqueInstance
]

{ #category : #'instance creation' }
ITToolbarDisplayMode class >> new [
	self error: 'Use #uniqueInstance'
]

{ #category : #'instance creation' }
ITToolbarDisplayMode class >> uniqueInstance [
	self = ITToolbarDisplayMode 
		ifTrue: [ self error: 'I''m abstract. Use one of my children' ].
	^ uniqueInstance ifNil: [ uniqueInstance := self basicNew initialize ]
]

{ #category : #configuring }
ITToolbarDisplayMode >> configureButton: aButton item: aToolbarItem [
	self subclassResponsibility
]

{ #category : #accessing }
ITToolbarDisplayMode >> extent [
	^ self subclassResponsibility
]

{ #category : #accessing }
ITToolbarDisplayMode >> height [
	^ self extent y
]
