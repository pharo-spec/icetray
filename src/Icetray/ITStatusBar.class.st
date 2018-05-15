Class {
	#name : #ITStatusBar,
	#superclass : #ITItemBar,
	#category : #'Icetray-Core'
}

{ #category : #accessing }
ITStatusBar class >> defaultItemSeparation [
	^ 0
]

{ #category : #specs }
ITStatusBar class >> defaultSpec [
	<spec: #default>

	^ SpecLayout composed
		newRow: #panel
]

{ #category : #'private dispatch' }
ITStatusBar >> addItemLeft: aMorph [
	self leftPanel addMorphBack: (self prepareItemToAdd: aMorph)
]

{ #category : #'private dispatch' }
ITStatusBar >> addItemRight: aMorph [
	self rightPanel addMorphBack: (self prepareItemToAdd: aMorph)
]

{ #category : #private }
ITStatusBar >> prepareItemToAdd: aMorph [
	^ aMorph
		vResizing: #spaceFill;
		yourself
]

{ #category : #accessing }
ITStatusBar >> refresh [
	leftPanel removeAllMorphs.
	rightPanel removeAllMorphs.
	items do: [ :each |
		each position 
			addItem: (each newStatusBarItemOn: self) 
			into: self ]
]
