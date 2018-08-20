Class {
	#name : #DivagerFullInspectorTransition,
	#superclass : #Object,
	#category : #Divager
}

{ #category : #transition }
DivagerFullInspectorTransition >> transitionTo: anObject in: aPresenter [
	
	^ aPresenter instantiate: DivagerFullInspectorPresenter on: anObject
]
