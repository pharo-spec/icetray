Class {
	#name : #ITItemPositionRight,
	#superclass : #ITItemPosition,
	#category : #'Icetray-Layouting'
}

{ #category : #accessing }
ITItemPositionRight >> addItem: anObject into: aToolbar [
	aToolbar addItemRight: anObject
]
