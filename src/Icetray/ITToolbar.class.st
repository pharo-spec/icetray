Class {
	#name : #ITToolbar,
	#superclass : #ITItemBar,
	#instVars : [
		'toolbarItemFont',
		'displayMode'
	],
	#category : #Icetray
}

{ #category : #accessing }
ITToolbar class >> defaultHeight [
	^ self defaultMode height
]

{ #category : #accessing }
ITToolbar class >> defaultItemSeparation [
	^ 0
]

{ #category : #accessing }
ITToolbar class >> defaultItemSize [
	^ 50
]

{ #category : #accessing }
ITToolbar class >> defaultMode [
	^ ITToolbarDisplayMode default
]

{ #category : #specs }
ITToolbar class >> defaultSpec [
	<spec: #default>

	^ SpecLayout composed
		newRow: #panel height: self defaultHeight
]

{ #category : #accessing }
ITToolbar >> displayMode [
	^ displayMode ifNil: [ displayMode := ITToolbarDisplayMode default ]
]

{ #category : #accessing }
ITToolbar >> displayMode: anObject [
	displayMode := anObject
]

{ #category : #'private factory' }
ITToolbar >> newToolbarItemFont [
	| buttonFont |
	buttonFont := Smalltalk ui theme buttonFont.
	^ LogicalFont 
		familyName: buttonFont familyName 
		pointSize: buttonFont pointSize - 3
]

{ #category : #accessing }
ITToolbar >> refresh [
	self leftPanel removeAllMorphs.
	self rightPanel removeAllMorphs.
	items do: [ :each |  
		each position 
			addItem: (each buildMorphOnToolbar: self) 
			into: self ]
]

{ #category : #accessing }
ITToolbar >> toolbarItemFont [
	^ toolbarItemFont ifNil: [ toolbarItemFont := self newToolbarItemFont ]
]

{ #category : #accessing }
ITToolbar >> toolbarItemFont: anObject [
	toolbarItemFont := anObject
]

{ #category : #accessing }
ITToolbar >> toolbarItemSize [
	^ self class defaultItemSize
]
