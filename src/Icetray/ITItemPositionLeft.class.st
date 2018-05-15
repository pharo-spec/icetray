Class {
	#name : #ITItemPositionLeft,
	#superclass : #ITItemPosition,
	#category : #'Icetray-Core'
}

{ #category : #accessing }
ITItemPositionLeft >> addItem: anObject into: aToolbar [
	aToolbar addItemLeft: anObject
]
