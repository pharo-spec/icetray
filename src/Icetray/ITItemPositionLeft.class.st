Class {
	#name : #ITItemPositionLeft,
	#superclass : #ITItemPosition,
	#category : #'Icetray-Layouting'
}

{ #category : #accessing }
ITItemPositionLeft >> addItem: anObject into: aToolbar [
	aToolbar addItemLeft: anObject
]
