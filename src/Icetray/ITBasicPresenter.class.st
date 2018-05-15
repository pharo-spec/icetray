Class {
	#name : #ITBasicPresenter,
	#superclass : #ComposablePresenter,
	#category : #'Icetray-Core'
}

{ #category : #specs }
ITBasicPresenter class >> basicNewWithOwner: anOwningPresenter [

	| decorator decoree |
	decorator := ITComponentDecorator owner: anOwningPresenter.
	decoree := self basicNew
		owner: decorator;
		yourself.
	decorator decoree: decoree.
	^ decorator
]

{ #category : #testing }
ITBasicPresenter class >> isAbstract [

	^ self == ITBasicPresenter
]

{ #category : #specs }
ITBasicPresenter class >> owner: anOwningPresenter [

	| decorator |
	decorator := self basicNewWithOwner: anOwningPresenter.
	decorator decoree initialize.
	^ decorator
]

{ #category : #initialization }
ITBasicPresenter >> initializeWidgets [

	self toolbar
		addItem: (ITButton new
			label: 'Button';
			icon: #edit asIcon;
			help: 'Activate me!';
			badge: '1';
			action: [ self inform: 'test' ];
			yourself)
		position: ITItemPosition left;
		addItem: (ITToggleButton new
			label: 'Toggle';
			icon: #edit asIcon;
			help: 'Toggle me!';
			badge: '1';
			action: [ :activated | self inform: activated asString ];
			yourself)
		position: ITItemPosition left;
		addItem: (ITOptionButtonGroup new
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
			yourself)
		position: ITItemPosition right.
		
	self statusbar
		addItem: (ITLabel new
			help: 'I am a label that will help you';
			contents: 'Hover on me')
		position: ITItemPosition right
]

{ #category : #accessing }
ITBasicPresenter >> statusbar [
	
	^ self owner statusbar
]

{ #category : #initialization }
ITBasicPresenter >> toolbar [

	^ self owner toolbar
]
