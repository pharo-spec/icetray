"
This class has a single instance representing a right item position.

Do not use the class directly, instead use:

	ITItemPosition right
"
Class {
	#name : #ITItemPositionRight,
	#superclass : #ITItemPosition,
	#category : #'Icetray-Layouting'
}

{ #category : #accessing }
ITItemPositionRight >> addItem: anObject into: aToolbar [
	aToolbar addItemRight: anObject
]
