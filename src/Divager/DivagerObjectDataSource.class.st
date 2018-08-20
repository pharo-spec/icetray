Class {
	#name : #DivagerObjectDataSource,
	#superclass : #FTDataSource,
	#instVars : [
		'object'
	],
	#category : #Divager
}

{ #category : #accessing }
DivagerObjectDataSource >> cellColumn: column row: anInteger [ 

	column id = 'name' ifTrue: [ ^ FTCellMorph new addMorph: (object class allSlots at: anInteger) name asMorph ].
	column id = 'value' ifTrue: [ ^ FTCellMorph new addMorph: ((object class allSlots at: anInteger) read: object) asString asMorph  ].
	1halt.
]

{ #category : #private }
DivagerObjectDataSource >> elementAt: anInteger [ 
	
	^ (object class allSlots at: anInteger) read: object
]

{ #category : #accessing }
DivagerObjectDataSource >> headerColumn: column [
	^ FTCellMorph new 
		addMorph: column id asMorph;
		yourself
]

{ #category : #accessing }
DivagerObjectDataSource >> numberOfRows [
	
	^ object class allSlots size
]

{ #category : #accessing }
DivagerObjectDataSource >> object: anObject [
	object := anObject
]
