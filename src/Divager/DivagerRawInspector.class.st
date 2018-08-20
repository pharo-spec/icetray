Class {
	#name : #DivagerRawInspector,
	#superclass : #ComposablePresenter,
	#instVars : [
		'object',
		'fastTable'
	],
	#category : #Divager
}

{ #category : #specs }
DivagerRawInspector class >> defaultSpec [
	<spec: #default>
	^ SpecLayout composed
		newColumn: [ :col | 
			col add: #fastTable ]
]

{ #category : #accessing }
DivagerRawInspector >> fastTable [
	^ fastTable
]

{ #category : #initialization }
DivagerRawInspector >> initializeWidgets [
	
	fastTable := self newFastTable.
	fastTable widget 
		addColumn: (FTColumn id: #name);
		addColumn: (FTColumn id: #value);
		dataSource: (DivagerObjectDataSource new object: object)
]

{ #category : #accessing }
DivagerRawInspector >> selection [
	
	^ fastTable widget dataSource elementAt: (fastTable widget selectedRowIndex)
]

{ #category : #'model access' }
DivagerRawInspector >> setModelBeforeInitialization: anObject [

	object := anObject
]

{ #category : #selection }
DivagerRawInspector >> whenSelectionChanged: aBlockClosure [
	
	fastTable widget onAnnouncement: FTSelectionChanged send: #value to: aBlockClosure
]
