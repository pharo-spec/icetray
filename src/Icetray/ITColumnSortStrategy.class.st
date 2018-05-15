Class {
	#name : #ITColumnSortStrategy,
	#superclass : #Object,
	#instVars : [
		'property',
		'direction'
	],
	#category : #'Icetray-FastTable'
}

{ #category : #'instance-creation' }
ITColumnSortStrategy class >> property: aString [ 
	
	^ self new
		property: aString;
		beAscending;
		yourself
]

{ #category : #accessing }
ITColumnSortStrategy >> beAscending [
	
	direction := #ascending
]

{ #category : #accessing }
ITColumnSortStrategy >> direction: aString [ 
	direction := aString
]

{ #category : #testing }
ITColumnSortStrategy >> isAscending [
	
	^ direction = #ascending
]

{ #category : #accessing }
ITColumnSortStrategy >> property [
	^ property
]

{ #category : #accessing }
ITColumnSortStrategy >> property: aString [ 
	property := aString
]

{ #category : #reading }
ITColumnSortStrategy >> read: anObject [
	
	^ anObject perform: property
]

{ #category : #sorting }
ITColumnSortStrategy >> reversed [
	
	| newDirection |
	newDirection := direction = #ascending
		ifTrue: [ #descending ]
		ifFalse: [ #ascending ].

	^ (ITColumnSortStrategy property: property)
		direction: newDirection
]

{ #category : #sorting }
ITColumnSortStrategy >> value: a value: b [

	| propertya propertyb |
	propertya := self read: a.
	propertyb := self read: b.
	
	^ self isAscending
		ifTrue: [ propertya > propertyb ]
		ifFalse: [ propertya < propertyb ]
]
