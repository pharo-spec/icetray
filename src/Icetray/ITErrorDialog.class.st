"
I'm an error dialog that is used to show generic errors to users.
This is to enhance the user experience, since exceptions can be sometimes intrusive or aggresive.
My model is an exception that I'll freeze for further debugging.

(ITErrorDialog on: anError) openDialogWithSpec

My debug button will open a debugger on the freezed exception.

See my class side for examples.
"
Class {
	#name : #ITErrorDialog,
	#superclass : #ITDialog,
	#instVars : [
		'exception',
		'errorLabel',
		'iconPanel'
	],
	#category : #'Icetray-Dialog'
}

{ #category : #specs }
ITErrorDialog class >> defaultSpec [
	<spec: #default>
	
	^ SpecLayout composed 
		newRow: [ :row |
			row 
				newColumn: #iconPanel width: 40;
				newColumn: #errorLabel ]
]

{ #category : #specs }
ITErrorDialog class >> exampleError [

	[ self error: String loremIpsum ]
		on: Error
		do: [ :error | (ITErrorDialog on: error) openDialogWithSpec ]
]

{ #category : #specs }
ITErrorDialog class >> title [
	^ 'Error'
]

{ #category : #initialization }
ITErrorDialog >> accept [
	
	self window delete.
	exception debug.
]

{ #category : #accessing }
ITErrorDialog >> errorLabel [
	^ errorLabel
]

{ #category : #accessing }
ITErrorDialog >> errorLabel: anObject [
	errorLabel := anObject
]

{ #category : #accessing }
ITErrorDialog >> exception [
	^ exception
]

{ #category : #initialization }
ITErrorDialog >> exception: anException [

	exception := anException freeze
]

{ #category : #accessing }
ITErrorDialog >> iconPanel [
	^ iconPanel
]

{ #category : #accessing }
ITErrorDialog >> iconPanel: anObject [
	iconPanel := anObject
]

{ #category : #initialization }
ITErrorDialog >> initialExtent [
	^ (500@(
		self class inputTextHeight * 2
		+ self class buttonHeight 
		+ 50 "Yes, a magic number"
		))
]

{ #category : #initialization }
ITErrorDialog >> initializeDialogWindow: aWindow [

	super initializeDialogWindow: aWindow.
	acceptButton label: 'Debug'.
	cancelButton label: 'Ignore'.
]

{ #category : #initialization }
ITErrorDialog >> initializeWidgets [
	iconPanel := self newPanel.
	iconPanel widget addMorph: ((self iconNamed: #error) scaledToSize: 32@32) asMorph.
	
	errorLabel := self newReadOnlyText.
	errorLabel widget contentsWrapped: exception messageText.
	errorLabel widget
		hResizing: #spaceFill;
		vResizing: #spaceFill.
]

{ #category : #initialization }
ITErrorDialog >> setModelBeforeInitialization: aDomainObject [

	self exception: aDomainObject
]
