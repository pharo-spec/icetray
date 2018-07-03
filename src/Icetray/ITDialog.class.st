"
I am a basic spec dialog with an ok/cancel button.
I'm an abstract class, check my subclasses.
"
Class {
	#name : #ITDialog,
	#superclass : #ComposablePresenter,
	#instVars : [
		'acceptButton',
		'cancelButton'
	],
	#category : #'Icetray-Dialog'
}

{ #category : #testing }
ITDialog class >> isAbstract [

	^ ITDialog == self
]

{ #category : #actions }
ITDialog >> accept [
	"override this if you want a dialog"
]

{ #category : #actions }
ITDialog >> basicOpenWithSpec [

	super openWithSpec
]

{ #category : #accessing }
ITDialog >> initializeDialogWindow: aWindow [
	
	acceptButton := aWindow toolbar okButton.
	cancelButton := aWindow toolbar cancelButton.
]

{ #category : #api }
ITDialog >> openDialogWithSpec [
	^ super openDialogWithSpec
		okAction: [ self accept ];
		yourself
]

{ #category : #api }
ITDialog >> openWithSpec [

	self openDialogWithSpec
]

{ #category : #private }
ITDialog >> withAssertHandlingDo: aBlock [
	^ aBlock 
		on: AssertionFailure 
		do: [ :e | 
			UIManager default 
				alert: e messageText
				title: 'Error: ', self title .
			^ false ]
]
