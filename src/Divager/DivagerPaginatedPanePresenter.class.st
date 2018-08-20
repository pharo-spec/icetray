Class {
	#name : #DivagerPaginatedPanePresenter,
	#superclass : #ComposablePresenter,
	#instVars : [
		'panesPresenter',
		'quantityPresenter',
		'transition',
		'initialObject'
	],
	#category : #Divager
}

{ #category : #specs }
DivagerPaginatedPanePresenter class >> defaultSpec [
	<spec>
	^ SpecLayout composed
		newColumn: [ :column | 
			column
				add: #panesPresenter;
				newRow: [ :row | 
					row
						newColumn: [ :empty |  ];
						add: #quantityPresenter width: 150;
						newColumn: [ :empty |  ] ]
					height: 30 ]
]

{ #category : #specs }
DivagerPaginatedPanePresenter class >> transition: aTransition on: anInitialObject [

	^ self basicNew
		initializeTransition: aTransition initialObject: anInitialObject;
		initialize;
		yourself
]

{ #category : #initialization }
DivagerPaginatedPanePresenter >> firstPane [

	^ transition transitionTo: initialObject in: self
]

{ #category : #initialization }
DivagerPaginatedPanePresenter >> initializeTransition: aTransition initialObject: anObject [

	initialObject := anObject.
	transition := aTransition.
]

{ #category : #initialization }
DivagerPaginatedPanePresenter >> initializeWidgets [
	
	panesPresenter := self instantiate: DivagerPresenter on: transition.
	panesPresenter addPane: self firstPane.
	quantityPresenter := self instantiate: DivagerTestPaginatorPresenter on: panesPresenter.
]

{ #category : #accessing }
DivagerPaginatedPanePresenter >> panesPresenter [
	^ panesPresenter
]

{ #category : #accessing }
DivagerPaginatedPanePresenter >> panesPresenter: anObject [
	panesPresenter := anObject
]

{ #category : #accessing }
DivagerPaginatedPanePresenter >> quantityPresenter [
	^ quantityPresenter
]

{ #category : #accessing }
DivagerPaginatedPanePresenter >> quantityPresenter: anObject [
	quantityPresenter := anObject
]
