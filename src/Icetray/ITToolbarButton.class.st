Class {
	#name : #ITToolbarButton,
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
ITToolbarButton >> action [
	^ action
]

{ #category : #accessing }
ITToolbarButton >> action: anObject [
	action := anObject
]

{ #category : #accessing }
ITToolbarButton >> badge [
	^ badge
]

{ #category : #accessing }
ITToolbarButton >> badge: aString [
	badge := aString
]

{ #category : #accessing }
ITToolbarButton >> bePositionLeft [
	self position: ITItemPosition left
]

{ #category : #accessing }
ITToolbarButton >> bePositionRight [
	self position: ITItemPosition right
]

{ #category : #factory }
ITToolbarButton >> buildMorphOnToolbar: aToolbar [
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

{ #category : #execution }
ITToolbarButton >> execute [
	self action cull: self
]

{ #category : #accessing }
ITToolbarButton >> help [
	^ help
]

{ #category : #accessing }
ITToolbarButton >> help: anObject [
	help := anObject
]

{ #category : #accessing }
ITToolbarButton >> icon [
	^ icon
]

{ #category : #accessing }
ITToolbarButton >> icon: anObject [
	icon := anObject
]

{ #category : #accessing }
ITToolbarButton >> label [
	^ label
]

{ #category : #accessing }
ITToolbarButton >> label: anObject [
	label := anObject
]

{ #category : #accessing }
ITToolbarButton >> position [
	^ position ifNil: [ ITItemPosition default ]
]

{ #category : #accessing }
ITToolbarButton >> position: aPosition [
	position := aPosition
]
