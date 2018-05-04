Class {
	#name : #ITItemBar,
	#superclass : #ComposablePresenter,
	#instVars : [
		'panel',
		'leftPanel',
		'rightPanel',
		'items',
		'color'
	],
	#category : #Icetray
}

{ #category : #accessing }
ITItemBar >> addItem: aToolbarItem [
	items add: aToolbarItem.
	self refresh
]

{ #category : #'private dispatch' }
ITItemBar >> addItemLeft: aButton [
	self leftPanel addMorphBack: aButton
]

{ #category : #'private dispatch' }
ITItemBar >> addItemRight: aButton [
	self rightPanel addMorphBack: aButton
]

{ #category : #accessing }
ITItemBar >> color [
	^ color ifNil: [ Color transparent ]
]

{ #category : #accessing }
ITItemBar >> color: aColor [
	color := aColor
]

{ #category : #initialization }
ITItemBar >> initialize [
	super initialize.
	items := OrderedCollection new
]

{ #category : #initialization }
ITItemBar >> initializeWidgets [
	leftPanel := self newPanelMorph.
	rightPanel := self newPanelMorph
		listDirection: #rightToLeft;
		hResizing: #spaceFill.

	panel := PanelMorph new 
		changeTableLayout;
		listDirection: #leftToRight;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		color: self color;
		asSpecAdapter.
		
	panel widget 
		addMorphBack: leftPanel;
		addMorphBack: rightPanel

]

{ #category : #accessing }
ITItemBar >> items: aCollection [
	"We expect a collection to be made of specs"
	items := aCollection asOrderedCollection.
	self refresh
]

{ #category : #'private accessing' }
ITItemBar >> leftPanel [
	^ leftPanel
]

{ #category : #'private accessing' }
ITItemBar >> leftPanel: anObject [
	leftPanel := anObject
]

{ #category : #'private factory' }
ITItemBar >> newPanelMorph [
	^ PanelMorph new 
		changeTableLayout;
		listDirection: #leftToRight;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		cellInset: self class defaultItemSeparation@0;
		color: self color;
		yourself
]

{ #category : #'accessing ui' }
ITItemBar >> panel [
	^ panel
]

{ #category : #'accessing ui' }
ITItemBar >> panel: anObject [
	panel := anObject
]

{ #category : #'private accessing' }
ITItemBar >> rightPanel [
	^ rightPanel
]

{ #category : #'private accessing' }
ITItemBar >> rightPanel: anObject [
	rightPanel := anObject
]
