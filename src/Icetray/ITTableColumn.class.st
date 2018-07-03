Class {
	#name : #ITTableColumn,
	#superclass : #FTColumn,
	#instVars : [
		'action',
		'icon'
	],
	#category : #'Icetray-FastTable'
}

{ #category : #'instance creation' }
ITTableColumn class >> newAction: aSymbol [
	^ self new action: aSymbol
]

{ #category : #'instance creation' }
ITTableColumn class >> newAction: aSymbolOrBlock icon: iconSymbolOrBlock [
	^ self new 
		action: aSymbolOrBlock;
		icon: iconSymbolOrBlock;
		yourself
]

{ #category : #accessing }
ITTableColumn >> action [
	^ action
]

{ #category : #accessing }
ITTableColumn >> action: aSymbolOrBlock [
	action := aSymbolOrBlock
]

{ #category : #accessing }
ITTableColumn >> icon [
	^ icon
]

{ #category : #accessing }
ITTableColumn >> icon: aSymbolOrBlock [
	icon := aSymbolOrBlock
]

{ #category : #factory }
ITTableColumn >> newHeader [
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
ITTableColumn >> read: anObject [
	^ self action value: anObject
]

{ #category : #accessing }
ITTableColumn >> readIcon: anObject [
	^ self icon 
		ifNotNil: [ self icon value: anObject ]
]
