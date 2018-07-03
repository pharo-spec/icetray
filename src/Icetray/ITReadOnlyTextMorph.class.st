"
I'm a read only morph that allows selection and copy-paste.
I catch key events and forbid them to happen. 

This is useful to use in components where I do not want to allow edition, but I want to allow coping anyway.
"
Class {
	#name : #ITReadOnlyTextMorph,
	#superclass : #TextMorph,
	#category : #'Icetray-Morphs'
}

{ #category : #'event handling' }
ITReadOnlyTextMorph >> handleKeystroke: anEvent [
	anEvent wasHandled
		ifTrue: [^ self].
	self allowsKeymapping
		ifTrue: [ self dispatchKeystrokeForEvent: anEvent ]
]

{ #category : #initialization }
ITReadOnlyTextMorph >> initialize [
	super initialize.
	self 
		bindKeyCombination: PharoShortcuts current copySelectionShortcut 
		toAction: [ :target | target editor copySelection ].
	self 
		bindKeyCombination: PharoShortcuts current selectAllShortcut
		toAction: [ :target | target handleEdit: [ target selectAll ] ]
]
