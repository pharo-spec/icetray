Class {
	#name : #DivagerPane,
	#superclass : #Object,
	#instVars : [
		'presenter',
		'id'
	],
	#category : #Divager
}

{ #category : #testing }
DivagerPane >> hasPresenter: aPresenter [

	^ presenter = aPresenter
]

{ #category : #accessing }
DivagerPane >> id [
	^ id
]

{ #category : #accessing }
DivagerPane >> id: anObject [
	id := anObject
]

{ #category : #accessing }
DivagerPane >> presenter [
	^ presenter
]

{ #category : #accessing }
DivagerPane >> presenter: anObject [
	presenter := anObject
]
