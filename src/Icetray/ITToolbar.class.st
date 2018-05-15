Class {
	#name : #ITToolBar,
	#superclass : #ComposablePresenter,
	#instVars : [
		'panel',
		'leftPanel',
		'rightPanel',
		'items',
		'color',
		'leftItems',
		'rightItems',
		'displayMode',
		'toolbarItemFont'
	],
	#category : #'Icetray-Core'
}

{ #category : #accessing }
ITToolBar class >> defaultHeight [
	^ self defaultMode height
]

{ #category : #accessing }
ITToolBar class >> defaultItemSeparation [
	^ 0
]

{ #category : #accessing }
ITToolBar class >> defaultItemSize [
	^ 50
]

{ #category : #accessing }
ITToolBar class >> defaultMode [
	^ ITToolbarDisplayMode default
]

{ #category : #specs }
ITToolBar class >> defaultSpec [
	<spec: #default>

	^ SpecLayout composed
		newRow: #panel height: self defaultHeight
]

{ #category : #accessing }
ITToolBar >> addItem: aToolbarItem [
	
	self addItem: aToolbarItem position: ITItemPosition left
]

{ #category : #accessing }
ITToolBar >> addItem: aToolbarItem position: aPosition [

	aPosition addItem: aToolbarItem into: self.
	self refresh.
]

{ #category : #'private dispatch' }
ITToolBar >> addItemLeft: anItem [
	
	leftItems add: anItem
]

{ #category : #'private dispatch' }
ITToolBar >> addItemRight: anItem [
	
	rightItems add: anItem
]

{ #category : #accessing }
ITToolBar >> color [
	^ color ifNil: [ Color transparent ]
]

{ #category : #accessing }
ITToolBar >> color: aColor [
	color := aColor
]

{ #category : #accessing }
ITToolBar >> displayMode [
	^ displayMode ifNil: [ displayMode := ITToolbarDisplayMode default ]
]

{ #category : #accessing }
ITToolBar >> displayMode: anObject [
	displayMode := anObject
]

{ #category : #initialization }
ITToolBar >> initialize [
	super initialize.
	leftItems := OrderedCollection new.
	rightItems := OrderedCollection new.
]

{ #category : #initialization }
ITToolBar >> initializeWidgets [
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
ITToolBar >> items: aCollection [
	"We expect a collection to be made of specs"
	items := aCollection asOrderedCollection.
	self refresh
]

{ #category : #'private accessing' }
ITToolBar >> leftPanel [
	^ leftPanel
]

{ #category : #'private accessing' }
ITToolBar >> leftPanel: anObject [
	leftPanel := anObject
]

{ #category : #'private factory' }
ITToolBar >> newPanelMorph [
	^ PanelMorph new 
		changeTableLayout;
		listDirection: #leftToRight;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		cellInset: self class defaultItemSeparation@0;
		color: self color;
		yourself
]

{ #category : #'private factory' }
ITToolBar >> newToolbarItemFont [
	| buttonFont |
	buttonFont := Smalltalk ui theme buttonFont.
	^ LogicalFont 
		familyName: buttonFont familyName 
		pointSize: buttonFont pointSize - 3
]

{ #category : #'accessing ui' }
ITToolBar >> panel [
	^ panel
]

{ #category : #'accessing ui' }
ITToolBar >> panel: anObject [
	panel := anObject
]

{ #category : #accessing }
ITToolBar >> rebuildLeftPanel [
	
	self leftPanel removeAllMorphs.
	leftItems do: [ :each | 
		leftPanel addMorphBack: ((each buildMorphOnToolbar: self)
			vResizing: #spaceFill;
			yourself) ]
]

{ #category : #accessing }
ITToolBar >> rebuildRightPanel [
	
	self rightPanel removeAllMorphs.
	rightItems do: [ :each | 
		rightPanel addMorphBack: ((each buildMorphOnToolbar: self)
			vResizing: #spaceFill;
			yourself) ]
]

{ #category : #accessing }
ITToolBar >> refresh [

	self rebuildLeftPanel.
	self rebuildRightPanel.
]

{ #category : #'private accessing' }
ITToolBar >> rightPanel [
	^ rightPanel
]

{ #category : #'private accessing' }
ITToolBar >> rightPanel: anObject [
	rightPanel := anObject
]

{ #category : #accessing }
ITToolBar >> toolbarItemFont [
	^ toolbarItemFont ifNil: [ toolbarItemFont := self newToolbarItemFont ]
]

{ #category : #accessing }
ITToolBar >> toolbarItemFont: anObject [
	toolbarItemFont := anObject
]

{ #category : #accessing }
ITToolBar >> toolbarItemSize [
	^ self class defaultItemSize
]
