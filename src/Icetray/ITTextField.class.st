Class {
	#name : #ITTextField,
	#superclass : #ComposablePresenter,
	#instVars : [
		'errorIcon',
		'validations',
		'name',
		'validationErrors',
		'fieldWidget',
		'labelWidget'
	],
	#category : #'Icetray-Forms'
}

{ #category : #specs }
ITTextField class >> defaultSpec [
	
	^ self horizontal
]

{ #category : #specs }
ITTextField class >> example [
	<example>
	
	self new
		label: 'A label';
		text: '';
		ghostText: 'A ghost.... buuu';
		openWithSpec
]

{ #category : #specs }
ITTextField class >> exampleVertical [
	<example>
	
	self new
		label: 'A label';
		text: '';
		ghostText: 'A ghost.... buuu';
		openWithSpec: #vertical
]

{ #category : #specs }
ITTextField class >> horizontal [
	<spec: #horizontal>
	
	^ SpecLayout composed
		newRow: [ :row | 
			row
				add: #labelWidget width: self iceLabelWidth;
				add: #fieldWidget;
				add: #errorIcon width: 15]
]

{ #category : #specs }
ITTextField class >> vertical [
	<spec: #vertical>
	
	^ SpecLayout composed
		newColumn: [ :column | 
			column
				add: #labelWidget height: self inputTextHeight;
				add: #fieldWidget height: self inputTextHeight;
				add: #errorIcon height: self inputTextHeight]
]

{ #category : #'API - validations' }
ITTextField >> addValidationError: aValidation [ 

	validationErrors add: aValidation
]

{ #category : #'API - configuration' }
ITTextField >> beReadOnly [

	fieldWidget enabled: false
]

{ #category : #'API - validations' }
ITTextField >> beRequired [
	validations add: ITRequiredFieldValidation new
]

{ #category : #accessing }
ITTextField >> errorIcon [
	^ errorIcon
]

{ #category : #updating }
ITTextField >> errorIconMessage [

	^ String streamContents: [ :stream |
			validationErrors 
				do: [ :anError | stream nextPutAll: (anError messageFor: self) ] 
				separatedBy: [ stream cr ]]
]

{ #category : #accessing }
ITTextField >> fieldValue [
	
	^ self text
]

{ #category : #accessing }
ITTextField >> fieldValue: aString [ 
	
	self text: aString
]

{ #category : #accessing }
ITTextField >> fieldWidget [
	^ fieldWidget
]

{ #category : #accessing }
ITTextField >> ghostText: aString [ 
	fieldWidget ghostText: aString
]

{ #category : #initialization }
ITTextField >> initialize [
	super initialize.
	
	validations := OrderedCollection new.
	validationErrors := OrderedCollection new
]

{ #category : #initialization }
ITTextField >> initializeWidgets [
	
	labelWidget := self newLabel.
	fieldWidget := self newTextInput autoAccept: true.
	errorIcon := self newPanel.

	fieldWidget whenBuiltDo: [ self validate ]
]

{ #category : #'API - validations' }
ITTextField >> isValid [

	^ validationErrors isEmpty
]

{ #category : #accessing }
ITTextField >> label [
	^ labelWidget label
]

{ #category : #accessing }
ITTextField >> label: aString [ 
	labelWidget label: aString
]

{ #category : #accessing }
ITTextField >> labelWidget [
	^ labelWidget
]

{ #category : #accessing }
ITTextField >> name [
	^ name
]

{ #category : #accessing }
ITTextField >> name: aString [ 
	
	name := aString
]

{ #category : #accessing }
ITTextField >> text [
	^ fieldWidget text
]

{ #category : #accessing }
ITTextField >> text: aString [ 
	fieldWidget text: aString.

]

{ #category : #updating }
ITTextField >> updateShowingError [
	
	| icon |
	
	errorIcon widget removeAllMorphs.
	fieldWidget borderColor: nil.
	
	self isValid ifTrue: [ ^ self ].
	
	icon := (self iconNamed: #error) asMorph.
	icon setBalloonText: self errorIconMessage.
	errorIcon widget addMorph: icon.
		
	fieldWidget borderColor: Color red.

]

{ #category : #'API - validations' }
ITTextField >> validate [
	
	validationErrors := OrderedCollection new.
	validations do: [ :each | each validate: self ].
	
	self updateShowingError.
	
	^ self isValid
]

{ #category : #'API - events' }
ITTextField >> whenChanged: aValuable [

	fieldWidget whenTextChanged: aValuable
]
