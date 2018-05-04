Class {
	#name : #ITItemPositionLeft,
	#superclass : #ITItemPosition,
	#category : #Icetray
}

{ #category : #accessing }
ITItemPositionLeft >> addItem: anObject into: aToolbar [
	aToolbar addItemLeft: anObject
]
