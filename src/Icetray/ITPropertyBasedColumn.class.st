Class {
	#name : #ITPropertyBasedColumn,
	#superclass : #FTColumn,
	#instVars : [
		'action',
		'icon',
		'alignment'
	],
	#category : #'Icetray-FastTable'
}

{ #category : #'instance creation' }
ITPropertyBasedColumn class >> newAction: aSymbol [
	^ self new action: aSymbol
]

{ #category : #'instance creation' }
ITPropertyBasedColumn class >> newAction: aSymbolOrBlock icon: iconSymbolOrBlock [
	^ self new 
		action: aSymbolOrBlock;
		icon: iconSymbolOrBlock;
		yourself
]

{ #category : #accessing }
ITPropertyBasedColumn >> action [
	^ action
]

{ #category : #accessing }
ITPropertyBasedColumn >> action: aSymbolOrBlock [
	action := aSymbolOrBlock
]

{ #category : #accessing }
ITPropertyBasedColumn >> alignment [
	^ alignment
]

{ #category : #accessing }
ITPropertyBasedColumn >> alignment: aSymbol [
	"One of #center, #left or #right"
	
	alignment := aSymbol
]

{ #category : #accessing }
ITPropertyBasedColumn >> execute [

	1halt.
]

{ #category : #accessing }
ITPropertyBasedColumn >> icon [
	^ icon
]

{ #category : #accessing }
ITPropertyBasedColumn >> icon: aSymbolOrBlock [
	icon := aSymbolOrBlock
]

{ #category : #accessing }
ITPropertyBasedColumn >> initialize [

	super initialize.
	alignment := #left
]

{ #category : #factory }
ITPropertyBasedColumn >> newHeader [
	^ SimpleButtonMorph new
		layoutPolicy: RowLayout new; 
		listDirection: #leftToRight; 
		wrapCentering: #center;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		cellInset: 5@0;
		layoutInset: 5@0;
		label: self id;
		yourself
]

{ #category : #accessing }
ITPropertyBasedColumn >> read: anObject [
	^ self action value: anObject
]

{ #category : #accessing }
ITPropertyBasedColumn >> readIcon: anObject [
	^ self icon 
		ifNotNil: [ self icon value: anObject ]
]
