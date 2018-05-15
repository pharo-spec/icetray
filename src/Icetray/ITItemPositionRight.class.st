Class {
	#name : #ITItemPositionRight,
	#superclass : #ITItemPosition,
	#category : #'Icetray-Core'
}

{ #category : #accessing }
ITItemPositionRight >> addItem: anObject into: aToolbar [
	aToolbar addItemRight: anObject
]
