"
openExample
	<example>
	self new openWithSpec
"
Class {
	#name : #ITExampleOptionPanel,
	#superclass : #ITOptionPanel,
	#instVars : [
		'title',
		'icon',
		'label'
	],
	#category : #'Icetray-Examples'
}

{ #category : #specs }
ITExampleOptionPanel class >> defaultSpec [
	<spec: #default>
	^ SpecLayout composed newColumn: [ :col | col add: #label height: self toolbarHeight ]
]

{ #category : #accessing }
ITExampleOptionPanel >> icon [
	
	^ icon
]

{ #category : #accessing }
ITExampleOptionPanel >> icon: anIcon [
	
	icon := anIcon
]

{ #category : #initialization }
ITExampleOptionPanel >> initializeWidgets [
	
	label := self newLabel label: title
]

{ #category : #accessing }
ITExampleOptionPanel >> label [
	
	^ label
]

{ #category : #accessing }
ITExampleOptionPanel >> label: aLabel [
	
	label := aLabel
]

{ #category : #accessing }
ITExampleOptionPanel >> title [
	
	^ title
]

{ #category : #accessing }
ITExampleOptionPanel >> title: aTitle [
	
	title := aTitle
]
