"
A component decorator used to decorate a decoree with a toolbar and a status bar
"
Class {
	#name : #ITComponentDecorator,
	#superclass : #ComposablePresenter,
	#instVars : [
		'toolbar',
		'statusbar',
		'decoree'
	],
	#category : #'Icetray-Core'
}

{ #category : #specs }
ITComponentDecorator class >> defaultSpec [
	<spec: #default>
	
	^ SpecLayout composed 
		newColumn: [ :column |
			column 
				newRow: #toolbar height: ITToolBar defaultHeight;
				newRow: #decoree;
				newRow: #statusbar height: ITToolBar statusBarHeight ]
]

{ #category : #accessing }
ITComponentDecorator >> decoree [
	^ decoree
]

{ #category : #accessing }
ITComponentDecorator >> decoree: aPresenter [
	
	decoree := aPresenter
]

{ #category : #initialization }
ITComponentDecorator >> initialExtent [

	^ decoree initialExtent
]

{ #category : #initialization }
ITComponentDecorator >> initializeWidgets [
	
	toolbar := self instantiate: ITToolBar.
	statusbar := self instantiate: ITToolBar.
]

{ #category : #accessing }
ITComponentDecorator >> statusbar [
	^ statusbar
]

{ #category : #accessing }
ITComponentDecorator >> statusbar: anObject [
	statusbar := anObject
]

{ #category : #accessing }
ITComponentDecorator >> title [

	^ decoree title
]

{ #category : #accessing }
ITComponentDecorator >> toolbar [
	^ toolbar
]

{ #category : #accessing }
ITComponentDecorator >> toolbar: anObject [
	toolbar := anObject
]
