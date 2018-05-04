Class {
	#name : #ITURLLabelMorph,
	#superclass : #LabelMorph,
	#instVars : [
		'onClickBlock'
	],
	#category : #Icetray
}

{ #category : #initialization }
ITURLLabelMorph >> execute [
	onClickBlock ifNotNil: [ onClickBlock cull: self ]
]

{ #category : #initialization }
ITURLLabelMorph >> initWithContents: aString font: aFont emphasis: textEmphasis [
	super initWithContents: aString font: aFont emphasis: textEmphasis.
	self
		addEmphasis: TextEmphasis underlined;
		on: #click send: #execute to: self;
		on: #mouseEnter send: #mouseEnter: to: self;
		on: #mouseLeave send: #mouseLeave: to: self.
	
]

{ #category : #'event handling' }
ITURLLabelMorph >> mouseEnter: evt [
	self currentHand showTemporaryCursor: Cursor webLink.

]

{ #category : #'event handling' }
ITURLLabelMorph >> mouseLeave: evt [
	self currentHand showTemporaryCursor: nil

]

{ #category : #initialization }
ITURLLabelMorph >> onClick: aBlock [
	onClickBlock := aBlock
]
