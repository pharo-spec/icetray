"
A group of option buttons
"
Class {
	#name : #ITOptionButtonGroup,
	#superclass : #ITItem,
	#instVars : [
		'options'
	],
	#category : #'Icetray-Items'
}

{ #category : #accessing }
ITOptionButtonGroup >> addOption: anOption [

	(anOption isSelected not and: [ options isEmpty ])
		ifTrue: [ anOption beSelected ].
		
	(anOption isSelected and: [ options notEmpty ])
		ifTrue: [ options do: #beUnselected ].	

	options add: anOption.
	anOption buttonGroup: self.
]

{ #category : #factory }
ITOptionButtonGroup >> buildMorphOnToolbar: aToolbar [

	| groupbox |
	groupbox := PanelMorph new 
		changeTableLayout;
		listDirection: #leftToRight;
		hResizing: #spaceFill;
		vResizing: #spaceFill.
	options doWithIndex: [ :each :index | | optionMorph |
		optionMorph := each buildMorphOnToolbar: aToolbar.
		groupbox addMorphBack: optionMorph
	].
	groupbox
		hResizing: #rigid;
		vResizing: #spaceFill;
		"borderWidth: 1;"
		borderStyle: (Smalltalk ui theme buttonNormalBorderStyleFor: groupbox);
		cellPositioning: #center;
		width: aToolbar toolbarItemSize * options size.
	^ groupbox
]

{ #category : #initialization }
ITOptionButtonGroup >> initialize [
	super initialize.
	options := OrderedCollection new
]

{ #category : #accessing }
ITOptionButtonGroup >> options [
	^ options
]

{ #category : #accessing }
ITOptionButtonGroup >> options: anObject [
	options := anObject
]

{ #category : #refreshing }
ITOptionButtonGroup >> refresh [
	self shouldBeImplemented.
]

{ #category : #selection }
ITOptionButtonGroup >> unselectAll [
	
	options do: #beUnselected
]
