Class {
	#name : #ITFormTextField,
	#superclass : #ComposablePresenter,
	#instVars : [
		'label',
		'field',
		'errorIcon',
		'validations',
		'name',
		'validationErrors'
	],
	#category : #'Icetray-Forms'
}

{ #category : #specs }
ITFormTextField class >> defaultSpec [
	
	^ self horizontal
]

{ #category : #specs }
ITFormTextField class >> example [
	<example>
	
	self new
		label: 'A label';
		text: '';
		ghostText: 'A ghost.... buuu';
		openWithSpec
]

{ #category : #specs }
ITFormTextField class >> exampleVertical [
	<example>
	
	self new
		label: 'A label';
		text: '';
		ghostText: 'A ghost.... buuu';
		openWithSpec: #vertical
]

{ #category : #specs }
ITFormTextField class >> horizontal [
	<spec: #horizontal>
	
	^ SpecLayout composed
		newRow: [ :row | 
			row
				add: #labelWidget width: self iceLabelWidth;
				add: #field;
				add: #errorIcon width: 15]
]

{ #category : #specs }
ITFormTextField class >> vertical [
	<spec: #vertical>
	
	^ SpecLayout composed
		newColumn: [ :column | 
			column
				add: #labelWidget height: self inputTextHeight;
				add: #field height: self inputTextHeight;
				add: #errorIcon height: self inputTextHeight]
]

{ #category : #'API - validations' }
ITFormTextField >> addValidationError: aValidation [ 

	validationErrors add: aValidation
]

{ #category : #'API - validations' }
ITFormTextField >> beRequired [
	validations add: ITRequiredFieldValidation new
]

{ #category : #accessing }
ITFormTextField >> errorIcon [
	^ errorIcon
]

{ #category : #updating }
ITFormTextField >> errorIconMessage [

	^ String streamContents: [ :stream |
			validationErrors 
				do: [ :anError | stream nextPutAll: (anError messageFor: self) ] 
				separatedBy: [ stream cr ]]
]

{ #category : #accessing }
ITFormTextField >> field [
	^ field
]

{ #category : #accessing }
ITFormTextField >> fieldValue [
	
	^ self text
]

{ #category : #accessing }
ITFormTextField >> fieldValue: aString [ 
	
	self text: aString
]

{ #category : #accessing }
ITFormTextField >> ghostText: aString [ 
	field ghostText: aString
]

{ #category : #initialization }
ITFormTextField >> initialize [
	super initialize.
	
	validations := OrderedCollection new.
	validationErrors := OrderedCollection new
]

{ #category : #initialization }
ITFormTextField >> initializeWidgets [
	
	label := self newLabel.
	field := self newTextInput autoAccept: true.
	errorIcon := self newPanel.

]

{ #category : #'API - validations' }
ITFormTextField >> isValid [

	^ validationErrors isEmpty
]

{ #category : #accessing }
ITFormTextField >> label [
	^ label label
]

{ #category : #accessing }
ITFormTextField >> label: aString [ 
	label label: aString
]

{ #category : #accessing }
ITFormTextField >> labelWidget [
	^ label
]

{ #category : #accessing }
ITFormTextField >> name [
	^ name
]

{ #category : #accessing }
ITFormTextField >> name: aString [ 
	
	name := aString
]

{ #category : #accessing }
ITFormTextField >> text [
	^ field text
]

{ #category : #accessing }
ITFormTextField >> text: aString [ 
	field text: aString.

]

{ #category : #updating }
ITFormTextField >> updateErrorIcon [
	
	| icon |
	
	errorIcon widget removeAllMorphs.
	
	self isValid ifTrue: [ ^ self ].
	
	icon := (self iconNamed: #error) asMorph.
	icon setBalloonText: self errorIconMessage.
	errorIcon widget addMorph: icon
]

{ #category : #'API - validations' }
ITFormTextField >> validate [
	
	validationErrors := OrderedCollection new.
	validations do: [ :each | each validate: self ].
	
	self updateErrorIcon.
	
	^ self isValid
]

{ #category : #'API - events' }
ITFormTextField >> whenChanged: aValuable [

	field whenTextChanged: aValuable
]
