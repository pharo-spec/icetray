"
Abstract superclass for presenters with a toolbar and a status bar
"
Class {
	#name : #ITBasicPresenter,
	#superclass : #ComposablePresenter,
	#category : #'Icetray-Core'
}

{ #category : #specs }
ITBasicPresenter class >> basicNewWithOwner: anOwningPresenter [

	| decorator decoree |
	decorator := ITComponentDecorator owner: anOwningPresenter.
	decoree := self basicNew
		owner: decorator;
		yourself.
	decorator decoree: decoree.
	^ decorator
]

{ #category : #testing }
ITBasicPresenter class >> isAbstract [

	^ self == ITBasicPresenter
]

{ #category : #specs }
ITBasicPresenter class >> new [

	^ self owner: nil
]

{ #category : #'instance creation' }
ITBasicPresenter class >> on: aDomainObject [
	| decorator |
	decorator := self basicNewWithOwner: nil.
	decorator decoree
		setModelBeforeInitialization: aDomainObject;
		initialize.	
	^ decorator
]

{ #category : #specs }
ITBasicPresenter class >> owner: anOwningPresenter [

	| decorator |
	decorator := self basicNewWithOwner: anOwningPresenter.
	decorator decoree initialize.
	^ decorator
]

{ #category : #accessing }
ITBasicPresenter >> statusbar [
	
	^ self owner statusbar
]

{ #category : #initialization }
ITBasicPresenter >> toolbar [

	^ self owner toolbar
]
