"
This class has a single instance representing a left item position.

Do not use the class directly, instead use:

	ITItemPosition left
"
Class {
	#name : #ITItemPositionLeft,
	#superclass : #ITItemPosition,
	#category : #'Icetray-Layouting'
}

{ #category : #accessing }
ITItemPositionLeft >> addItem: anObject into: aToolbar [
	aToolbar addItemLeft: anObject
]
