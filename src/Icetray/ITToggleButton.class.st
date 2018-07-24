"
A toggle button which is either selected or unselected
"
Class {
	#name : #ITToggleButton,
	#superclass : #ITButton,
	#instVars : [
		'selected'
	],
	#category : #'Icetray-Items'
}

{ #category : #selection }
ITToggleButton >> beSelected [
	
	self setSelection: true
]

{ #category : #selection }
ITToggleButton >> beUnselected [
	
	self setSelection: false
]

{ #category : #factory }
ITToggleButton >> buildMorphOnToolbar: aToolbar [
	| button |

	button := (ITToggleButtonMorph
			on: self 
			getState: #isSelected
			action: #execute:)
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
ITToggleButton >> execute: state [

	self setSelection: state.
	self action cull: state cull: self
]

{ #category : #initialization }
ITToggleButton >> initialize [

	super initialize.
	selected := false
]

{ #category : #execution }
ITToggleButton >> isSelected [

	^ selected
]

{ #category : #selection }
ITToggleButton >> setSelection: aBoolean [

	selected := aBoolean.
	self changed: #isSelected
]
