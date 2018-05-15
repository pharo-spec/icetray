Class {
	#name : #ITItem,
	#superclass : #Object,
	#instVars : [
		'position'
	],
	#category : #'Icetray-items'
}

{ #category : #accessing }
ITItem >> bePositionLeft [
	self position: ITItemPosition left
]

{ #category : #accessing }
ITItem >> bePositionRight [
	self position: ITItemPosition right
]

{ #category : #factory }
ITItem >> buildMorphOnToolbar: aToolbar [

	self subclassResponsibility
]

{ #category : #accessing }
ITItem >> position [
	^ position ifNil: [ ITItemPosition default ]
]

{ #category : #accessing }
ITItem >> position: aPosition [
	position := aPosition
]
