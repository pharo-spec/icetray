Class {
	#name : #DivagerBasicInspectorTransition,
	#superclass : #Object,
	#category : #Divager
}

{ #category : #transition }
DivagerBasicInspectorTransition >> transitionTo: anObject in: aPresenter [
	
	^ aPresenter instantiate: DivagerRawInspector on: anObject
]
