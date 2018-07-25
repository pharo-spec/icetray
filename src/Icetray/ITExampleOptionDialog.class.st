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

{ #category : #initialization }
ITExampleOptionDialog >> initialize [	
	panels := {(ITExampleOptionPanel basicNew
		title: 'First' translated;
		icon: (self iconNamed: #thumbsUp);
		initialize).
	(ITExampleOptionPanel basicNew
		title: 'Second' translated;
		icon: (self iconNamed: #thumbsDown);
		initialize)}.
		
	acceptCallback := [ :selectedType | self inform: 'You selected ', selectedType title ].
	super initialize
]
