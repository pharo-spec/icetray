"
I show how to implement a dialog with several options.
"
Class {
	#name : #ITExampleOptionDialog,
	#superclass : #ITOptionDialog,
	#category : #'Icetray-Examples'
}

{ #category : #examples }
ITExampleOptionDialog class >> openExample [
	<example>
	self new openWithSpec
]

{ #category : #accessing }
ITExampleOptionDialog >> allTypes [
	^ {(ITExampleOptionPanel basicNew
		title: 'First';
		icon: Smalltalk ui icons icons atRandom;
		initialize).
	(ITExampleOptionPanel basicNew
		title: 'Second';
		icon: Smalltalk ui icons icons atRandom;
		initialize)}
]

{ #category : #actions }
ITExampleOptionDialog >> doAccept [
	
	self inform: 'You selected ', self selectedType title
]
