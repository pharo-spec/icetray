Class {
	#name : #DivagerInspectorTransition,
	#superclass : #Object,
	#category : #Divager
}

{ #category : #transition }
DivagerInspectorTransition >> transitionTo: anObject in: aPresenter [
	
	^ aPresenter instantiate: DivagerRawInspector on: anObject
]
