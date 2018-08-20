Class {
	#name : #DivagerPaginatedPanePresenter,
	#superclass : #ComposablePresenter,
	#instVars : [
		'panesPresenter',
		'quantityPresenter',
		'object'
	],
	#category : #Divager
}

{ #category : #specs }
DivagerPaginatedPanePresenter class >> defaultSpec [
<spec>

	^SpecLayout composed
		newColumn: [:column |
			column 
				add: #panesPresenter;
				newRow: [ :row |
					row
						newColumn: [ :empty ];
						add: #quantityPresenter width: 150;
						newColumn: [ :empty ] ]
				height: 30 ]
]

{ #category : #initialization }
DivagerPaginatedPanePresenter >> initializeWidgets [
	
	panesPresenter := self instantiate: DivagerPresenter.
	panesPresenter addPane: (self instantiate: DivagerRawInspector on: object).
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

{ #category : #initialization }
DivagerPaginatedPanePresenter >> setModelBeforeInitialization: anObject [

	object := anObject
]
