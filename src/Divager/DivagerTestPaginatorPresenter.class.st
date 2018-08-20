Class {
	#name : #DivagerTestPaginatorPresenter,
	#superclass : #ComposablePresenter,
	#instVars : [
		'firstPageTextInput',
		'pageSeparatorLabel',
		'pageCountLabel',
		'pageCountSeparatorLabel',
		'pageCountTextInput',
		'presenterToPaginate'
	],
	#category : #Divager
}

{ #category : #specs }
DivagerTestPaginatorPresenter class >> defaultSpec [
<spec>

	^SpecLayout composed
		newRow: [:row |
			#(firstPageTextInput pageSeparatorLabel pageCountLabel pageCountSeparatorLabel pageCountTextInput)
				do: [ :each | row add: each ] ]
]

{ #category : #accessing }
DivagerTestPaginatorPresenter >> firstPageTextInput [
	^ firstPageTextInput
]

{ #category : #accessing }
DivagerTestPaginatorPresenter >> firstPageTextInput: anObject [
	firstPageTextInput := anObject
]

{ #category : #initialization }
DivagerTestPaginatorPresenter >> initializeWidgets [
	
	firstPageTextInput := self newTextInput.
	firstPageTextInput autoAccept: true.
	firstPageTextInput whenTextChanged: [ :newText :oldText |
		presenterToPaginate firstPage: (firstPageTextInput text asInteger ifNil: [ 1 ]) ].
	
	pageSeparatorLabel := self newLabel label: '/'.
	pageCountLabel := self newLabel.
	pageCountSeparatorLabel := self newLabel label: '|'.
	
	pageCountTextInput := self newTextInput.
	pageCountTextInput autoAccept: true.
	pageCountTextInput whenTextChanged: [ :newText :oldText |
		presenterToPaginate maxPanesToShow: (pageCountTextInput text asInteger ifNil: [ 1 ]) ].
	
	self refreshValues.
	presenterToPaginate whenChangedDo: [
		self refreshValues ]
]

{ #category : #accessing }
DivagerTestPaginatorPresenter >> pageCountLabel [
	^ pageCountLabel
]

{ #category : #accessing }
DivagerTestPaginatorPresenter >> pageCountLabel: anObject [
	pageCountLabel := anObject
]

{ #category : #accessing }
DivagerTestPaginatorPresenter >> pageCountSeparatorLabel [
	^ pageCountSeparatorLabel
]

{ #category : #accessing }
DivagerTestPaginatorPresenter >> pageCountSeparatorLabel: anObject [
	pageCountSeparatorLabel := anObject
]

{ #category : #accessing }
DivagerTestPaginatorPresenter >> pageCountTextInput [
	^ pageCountTextInput
]

{ #category : #accessing }
DivagerTestPaginatorPresenter >> pageCountTextInput: anObject [
	pageCountTextInput := anObject
]

{ #category : #accessing }
DivagerTestPaginatorPresenter >> pageSeparatorLabel [
	^ pageSeparatorLabel
]

{ #category : #accessing }
DivagerTestPaginatorPresenter >> pageSeparatorLabel: anObject [
	pageSeparatorLabel := anObject
]

{ #category : #initialization }
DivagerTestPaginatorPresenter >> refreshValues [

	firstPageTextInput text: presenterToPaginate firstPage asString.
	pageCountLabel label: presenterToPaginate pageCount asString.
	pageCountTextInput text: presenterToPaginate maxPanesToShow asString.
]

{ #category : #initialization }
DivagerTestPaginatorPresenter >> setModelBeforeInitialization: aPaginatedPresenter [

	presenterToPaginate := aPaginatedPresenter.
]
