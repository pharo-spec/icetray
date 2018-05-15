"
ITToolbar new
	addItem: (ITButton new
		label: 'Button';
		icon: #edit asIcon;
		position: ITItemPosition left;
		help: 'Activate me!';
		badge: '1';
		action: [ self inform: 'test' ];
		yourself);
	addItem: (ITToggleButton new
		label: 'Toggle';
		icon: #edit asIcon;
		position: ITItemPosition left;
		help: 'Toggle me!';
		badge: '1';
		action: [ :activated | self inform: activated asString ];
		yourself);
	addItem: (ITOptionButtonGroup new
		position: ITItemPosition left;
		addOption: (ITOptionButton new
			label: 'Left';
			icon: #add asIcon;
			help: 'Add me!';
			badge: '1';
			action: [ self inform: 'Added' ];
			yourself);
		addOption: (ITOptionButton new
			label: 'Middle';
			icon: #changeUpdate asIcon;
			help: 'Update me!';
			badge: '2';
			action: [ self inform: 'Removed' ];
			yourself);
		addOption: (ITOptionButton new
			label: 'Right';
			icon: #changeRemove asIcon;
			help: 'Remove me!';
			badge: '3';
			action: [ self inform: 'Removed' ];
			yourself);
		yourself);
	openWithSpec.
"
Class {
	#name : #ITToolbar,
	#superclass : #ITItemBar,
	#instVars : [
		'toolbarItemFont',
		'displayMode'
	],
	#category : #'Icetray-Core'
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

{ #category : #'as yet unclassified' }
ITToolbar >> addItemsFromContext: aContext [
	| menu |
	
	menu := CmdMenu activatedBy: ITToolbarActivation.
	menu buildInContext: aContext.
	menu buildToolbarOn: self

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
