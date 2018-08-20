Class {
	#name : #DivagerInspector,
	#superclass : #ComposablePresenter,
	#instVars : [
		'panesPresenter',
		'quantityPresenter'
	],
	#category : #Divager
}

{ #category : #specs }
DivagerInspector class >> defaultSpec [
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
DivagerInspector >> initializeWidgets [
	
	panesPresenter := self instantiate: DivagerPresenter.
	quantityPresenter := self instantiate: DivagerTestPaginatorPresenter on: panesPresenter.
]

{ #category : #accessing }
DivagerInspector >> panesPresenter [
	^ panesPresenter
]

{ #category : #accessing }
DivagerInspector >> panesPresenter: anObject [
	panesPresenter := anObject
]

{ #category : #accessing }
DivagerInspector >> quantityPresenter [
	^ quantityPresenter
]

{ #category : #accessing }
DivagerInspector >> quantityPresenter: anObject [
	quantityPresenter := anObject
]
