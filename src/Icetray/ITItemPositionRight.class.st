Class {
	#name : #ITItemPositionRight,
	#superclass : #ITItemPosition,
	#category : #Icetray
}

{ #category : #accessing }
ITItemPositionRight >> addItem: anObject into: aToolbar [
	aToolbar addItemRight: anObject
]
