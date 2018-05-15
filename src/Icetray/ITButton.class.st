Class {
	#name : #ITButton,
	#superclass : #Object,
	#instVars : [
		'label',
		'icon',
		'action',
		'help',
		'position',
		'badge'
	],
	#category : #'Icetray-items'
}

{ #category : #accessing }
ITButton >> action [
	^ action
]

{ #category : #accessing }
ITButton >> action: anObject [
	action := anObject
]

{ #category : #accessing }
ITButton >> badge [
	^ badge
]

{ #category : #accessing }
ITButton >> badge: aString [
	badge := aString
]

{ #category : #accessing }
ITButton >> bePositionLeft [
	self position: ITItemPosition left
]

{ #category : #accessing }
ITButton >> bePositionRight [
	self position: ITItemPosition right
]

{ #category : #factory }
ITButton >> buildMorphOnToolbar: aToolbar [
	| button |
	
	button := (ITButtonMorph
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
ITButton >> execute [
	self action cull: self
]

{ #category : #accessing }
ITButton >> help [
	^ help
]

{ #category : #accessing }
ITButton >> help: anObject [
	help := anObject
]

{ #category : #accessing }
ITButton >> icon [
	^ icon
]

{ #category : #accessing }
ITButton >> icon: anObject [
	icon := anObject
]

{ #category : #accessing }
ITButton >> label [
	^ label
]

{ #category : #accessing }
ITButton >> label: anObject [
	label := anObject
]

{ #category : #accessing }
ITButton >> position [
	^ position ifNil: [ ITItemPosition default ]
]

{ #category : #accessing }
ITButton >> position: aPosition [
	position := aPosition
]
