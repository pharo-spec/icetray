"
A label
"
Class {
	#name : #ITLabel,
	#superclass : #ITItem,
	#instVars : [
		'help',
		'contents'
	],
	#category : #'Icetray-Items'
}

{ #category : #factory }
ITLabel >> buildMorphOnToolbar: aToolbar [

	^ (LabelMorph contents: contents)
		setBalloonText: help;
		yourself
]

{ #category : #accessing }
ITLabel >> contents [
	^ contents
]

{ #category : #accessing }
ITLabel >> contents: anObject [
	contents := anObject
]

{ #category : #accessing }
ITLabel >> help [
	^ help
]

{ #category : #accessing }
ITLabel >> help: anObject [
	help := anObject
]
