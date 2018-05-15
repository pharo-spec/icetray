Class {
	#name : #ITItemPosition,
	#superclass : #Object,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Icetray-Core'
}

{ #category : #accessing }
ITItemPosition class >> default [
	^ self left	
]

{ #category : #accessing }
ITItemPosition class >> left [
	^ ITItemPositionLeft uniqueInstance
	
]

{ #category : #'instance creation' }
ITItemPosition class >> new [
	self error: 'Use uniqueInstance'
]

{ #category : #accessing }
ITItemPosition class >> right [
	^ ITItemPositionRight uniqueInstance
	
]

{ #category : #'instance creation' }
ITItemPosition class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := self basicNew initialize ]
]

{ #category : #accessing }
ITItemPosition >> addItem: anObject into: aToolbar [
	self subclassResponsibility
]
