Class {
	#name : #ITToolbarActivation,
	#superclass : #CmdMenuCommandActivationStrategy,
	#instVars : [
		'position'
	],
	#category : #'Icetray-Commander'
}

{ #category : #'instance creation' }
ITToolbarActivation class >> byRootGroupItemFor: aToolContextClass order: aNumber [
	^ (self byRootGroupItemFor: aToolContextClass)	
		menuItemOrder: aNumber;
		yourself
]

{ #category : #accessing }
ITToolbarActivation >> help [
	^ self commandClass defaultHelp
]

{ #category : #accessing }
ITToolbarActivation >> position [
	^ position ifNil: [ ITItemPosition perform: self commandClass defaultPosition ]
]

{ #category : #accessing }
ITToolbarActivation >> position: aPosition [
	"one of IceTipToolbarItemPosition" 
	position := aPosition
]

{ #category : #accessing }
ITToolbarActivation >> toolbarName [
	^ self commandClass defaultToolbarItemName
]
