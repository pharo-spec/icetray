"
An option button
"
Class {
	#name : #ITOptionButton,
	#superclass : #ITToggleButton,
	#instVars : [
		'buttonGroup'
	],
	#category : #'Icetray-Items'
}

{ #category : #accessing }
ITOptionButton >> buttonGroup: anITOptionButtonGroup [ 
	
	buttonGroup := anITOptionButtonGroup
]

{ #category : #execution }
ITOptionButton >> execute: state [

	buttonGroup unselectAll.
	self beSelected.
	self action cull: state cull: self
]
