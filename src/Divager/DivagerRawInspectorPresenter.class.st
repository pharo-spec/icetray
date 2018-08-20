Class {
	#name : #DivagerRawInspectorPresenter,
	#superclass : #ComposablePresenter,
	#instVars : [
		'object',
		'fastTable'
	],
	#category : #Divager
}

{ #category : #specs }
DivagerRawInspectorPresenter class >> defaultSpec [
	<spec: #default>
	^ SpecLayout composed
		newColumn: [ :col | 
			col add: #fastTable ]
]

{ #category : #accessing }
DivagerRawInspectorPresenter >> fastTable [
	^ fastTable
]

{ #category : #initialization }
DivagerRawInspectorPresenter >> initializeWidgets [
	
	fastTable := self newFastTable.
	fastTable widget 
		addColumn: (FTColumn id: #name);
		addColumn: (FTColumn id: #value);
		dataSource: (DivagerObjectDataSource new object: object)
]

{ #category : #accessing }
DivagerRawInspectorPresenter >> selection [
	
	^ fastTable widget dataSource elementAt: (fastTable widget selectedRowIndex)
]

{ #category : #'model access' }
DivagerRawInspectorPresenter >> setModelBeforeInitialization: anObject [

	object := anObject
]

{ #category : #selection }
DivagerRawInspectorPresenter >> whenSelectionChanged: aBlockClosure [
	
	fastTable widget onAnnouncement: FTSelectionChanged send: #value to: aBlockClosure
]
