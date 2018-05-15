Class {
	#name : #ITStatusBarItem,
	#superclass : #Object,
	#instVars : [
		'contents',
		'help',
		'position'
	],
	#category : #'Icetray-Core'
}

{ #category : #accessing }
ITStatusBarItem >> bePositionLeft [
	self position: ITItemPosition left
]

{ #category : #accessing }
ITStatusBarItem >> bePositionRight [
	self position: ITItemPosition right
]

{ #category : #accessing }
ITStatusBarItem >> contents [
	^ contents
]

{ #category : #accessing }
ITStatusBarItem >> contents: anObject [
	contents := anObject
]

{ #category : #accessing }
ITStatusBarItem >> help [
	^ help
]

{ #category : #accessing }
ITStatusBarItem >> help: anObject [
	help := anObject
]

{ #category : #factory }
ITStatusBarItem >> newStatusBarItemOn: aStatusBar [
	^ self contents asMorph asReadOnlyMorph
]

{ #category : #accessing }
ITStatusBarItem >> position [
	^ position ifNil: [ ITItemPosition default ]
]

{ #category : #accessing }
ITStatusBarItem >> position: anObject [
	position := anObject
]
