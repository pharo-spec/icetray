Class {
	#name : #ITToolbarItem,
	#superclass : #Object,
	#instVars : [
		'label',
		'icon',
		'action',
		'help',
		'position',
		'badge'
	],
	#category : #Icetray
}

{ #category : #accessing }
ITToolbarItem >> action [
	^ action
]

{ #category : #accessing }
ITToolbarItem >> action: anObject [
	action := anObject
]

{ #category : #accessing }
ITToolbarItem >> badge [
	^ badge
]

{ #category : #accessing }
ITToolbarItem >> badge: aString [
	badge := aString
]

{ #category : #accessing }
ITToolbarItem >> bePositionLeft [
	self position: ITItemPosition left
]

{ #category : #accessing }
ITToolbarItem >> bePositionRight [
	self position: ITItemPosition right
]

{ #category : #execution }
ITToolbarItem >> execute [
	self action cull: self
]

{ #category : #accessing }
ITToolbarItem >> help [
	^ help
]

{ #category : #accessing }
ITToolbarItem >> help: anObject [
	help := anObject
]

{ #category : #accessing }
ITToolbarItem >> icon [
	^ icon
]

{ #category : #accessing }
ITToolbarItem >> icon: anObject [
	icon := anObject
]

{ #category : #accessing }
ITToolbarItem >> label [
	^ label
]

{ #category : #accessing }
ITToolbarItem >> label: anObject [
	label := anObject
]

{ #category : #factory }
ITToolbarItem >> newToolbarButtonOn: aToolbar [
	| button |
	
	button := (ITToolbarItemButtonMorph
		on: self 
			getState: nil 
			action:  #execute)
		helpText: self help;
		font: aToolbar toolbarItemFont;
		beIconTop;
		hResizing: #rigid;
		vResizing: #spaceFill;
		borderWidth: 0;
		borderColor: Color transparent;		
		cellPositioning: #center;
		width: aToolbar toolbarItemSize;
		yourself.
		
	aToolbar displayMode 
		configureButton: button 
		item: self.

	^ button
]

{ #category : #accessing }
ITToolbarItem >> position [
	^ position ifNil: [ ITItemPosition default ]
]

{ #category : #accessing }
ITToolbarItem >> position: aPosition [
	position := aPosition
]
