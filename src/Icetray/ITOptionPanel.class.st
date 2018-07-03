"
I am an abstract class defining the basic methods required by a panel to be embedded into an option dialog. So far this is icon and title, which are used to be displayed in the option dialog.
"
Class {
	#name : #ITOptionPanel,
	#superclass : #ComposablePresenter,
	#category : #'Icetray-Dialog'
}

{ #category : #testing }
ITOptionPanel class >> isAbstract [

	^ self == ITOptionPanel
]

{ #category : #accessing }
ITOptionPanel >> icon [
	self subclassResponsibility
]

{ #category : #accessing }
ITOptionPanel >> title [
	self subclassResponsibility
]
