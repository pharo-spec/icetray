Class {
	#name : #DivagerFullInspectorPresenter,
	#superclass : #ComposablePresenter,
	#instVars : [
		'object',
		'tabManager',
		'selectionClosure'
	],
	#category : #Divager
}

{ #category : #specs }
DivagerFullInspectorPresenter class >> defaultSpec [
	<spec: #default>
	^ SpecLayout composed
		newColumn: [ :col | 
			col add: #tabManager ]
]

{ #category : #initialization }
DivagerFullInspectorPresenter >> initializeWidgets [
	
	| inspector |
	inspector := self instantiate: DivagerRawInspectorPresenter on: object.
	inspector whenSelectionChanged: [ selectionClosure value ].
	
	tabManager := self newTabManager.
	tabManager addTab: (self newTab 
		label: 'Raw';
		closeable: false;
		contents: inspector buildWithSpec
		yourself).
]

{ #category : #accessing }
DivagerFullInspectorPresenter >> selection [
	
	| fttable |
	fttable := tabManager selectedTab contents submorphs first submorphs first.
	fttable selectedRowIndex = 0 ifTrue: [ ^ nil ].
	^ fttable dataSource elementAt: fttable selectedRowIndex
]

{ #category : #'model access' }
DivagerFullInspectorPresenter >> setModelBeforeInitialization: anObject [

	object := anObject
]

{ #category : #accessing }
DivagerFullInspectorPresenter >> tabManager [
	^ tabManager
]

{ #category : #accessing }
DivagerFullInspectorPresenter >> tabManager: anObject [
	tabManager := anObject
]

{ #category : #selection }
DivagerFullInspectorPresenter >> whenSelectionChanged: aBlockClosure [
	
	selectionClosure := aBlockClosure
]
