"
Abstract superclass for Icetray visual items like buttons, labels or other
"
Class {
	#name : #ITItem,
	#superclass : #Object,
	#category : #'Icetray-Items'
}

{ #category : #factory }
ITItem >> buildMorphOnToolbar: aToolbar [

	self subclassResponsibility
]
