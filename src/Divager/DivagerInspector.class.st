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
				add: #quantityPresenter height: 40 ]
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
