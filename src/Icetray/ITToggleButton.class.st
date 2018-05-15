Class {
	#name : #ITToggleButton,
	#superclass : #ITButton,
	#category : #'Icetray-items'
}

{ #category : #factory }
ITToggleButton >> buildMorphOnToolbar: aToolbar [
	| button |

	button := (ITToggleButtonMorph
		on: self 
			getState: nil 
			action:  #execute:)
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

	self action cull: state cull: self
]
