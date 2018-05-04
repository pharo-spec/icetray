Class {
	#name : #ITStatusBarTargetItem,
	#superclass : #ITStatusBarItem,
	#instVars : [
		'target'
	],
	#category : #Icetray
}

{ #category : #accessing }
ITStatusBarTargetItem >> contents [
	"Contents will be a selector, here"
	^ self target perform: super contents
]

{ #category : #accessing }
ITStatusBarTargetItem >> help [
	"help here will be a selector, here"
	^ super help ifNotNil: [ :sel | self target perform: sel ]
]

{ #category : #accessing }
ITStatusBarTargetItem >> target [
	^ target
]

{ #category : #accessing }
ITStatusBarTargetItem >> target: anObject [
	target := anObject
]
