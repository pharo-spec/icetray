"
A sort strategy for a table column either in ascending or descending sort order
"
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

{ #category : #reordering }
ITColumnSortStrategy >> beAscending [
	
	direction := #ascending
]

{ #category : #reordering }
ITColumnSortStrategy >> beDescending [
	
	direction := #descending
]

{ #category : #accessing }
ITColumnSortStrategy >> direction: aString [ 
	direction := aString
]

{ #category : #accessing }
ITColumnSortStrategy >> directionArrowCharacter [

	^ self isAscending
		ifTrue: [ '^' ]
		ifFalse: [ 'v' ]
]

{ #category : #testing }
ITColumnSortStrategy >> isAscending [
	
	^ direction = #ascending
]

{ #category : #testing }
ITColumnSortStrategy >> isDescending [
	
	^ direction = #descending
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
