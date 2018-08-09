Class {
	#name : #ITForm,
	#superclass : #DynamicComposablePresenter,
	#instVars : [
		'fields',
		'validateOnChange',
		'hasValidation',
		'isReadOnly'
	],
	#category : #'Icetray-Forms'
}

{ #category : #'API - fields' }
ITForm >> addTextField: fieldName label: labelString [ 

	^ self addTextField: fieldName label: labelString ghost: ''
]

{ #category : #'API - fields' }
ITForm >> addTextField: fieldName label: labelString ghost: ghostString [

	^ self addTextField: fieldName label: labelString ghost: ghostString initialValue: ''
]

{ #category : #'API - fields' }
ITForm >> addTextField: fieldName label: labelString ghost: ghostString initialValue: aText [

	^ self addTextField: fieldName label: labelString ghost: ghostString initialValue: aText with: [ ]
]

{ #category : #'API - fields' }
ITForm >> addTextField: fieldName label: labelString ghost: ghostString initialValue: aText with: aBlock [

	| field |

	field := self instantiate: ITTextField.
	field 
		name: fieldName;
		label: labelString;
		ghostText: ghostString;
		text: aText.

	aBlock cull: field.
		
	self widgetAt: fieldName put: field.
	fields add: field.
	
	field whenChanged: [ self fieldChanged: field ].
	isReadOnly ifTrue: [ field beReadOnly ].
	
	self rebuildLayout.
	
	^ field
]

{ #category : #'API - fields' }
ITForm >> addTextField: fieldName label: labelString ghost: ghostString with: aBlock [

	^ self addTextField: fieldName label: labelString ghost: ghostString initialValue: '' with: aBlock
]

{ #category : #'API - fields' }
ITForm >> addTextField: fieldName label: labelString with: aBlock [

	^ self addTextField: fieldName label: labelString ghost: '' initialValue: '' with: aBlock
]

{ #category : #'API - configuration' }
ITForm >> beReadOnly [

	isReadOnly := true.
	fields do: [ :f | f beReadOnly ]
]

{ #category : #private }
ITForm >> fieldChanged: aField [

	validateOnChange ifTrue: [ self validate ].
	self valueChanged
]

{ #category : #initialization }
ITForm >> initialize [
	super initialize.
	fields := OrderedCollection new.
	validateOnChange := false.
	hasValidation := true.
	isReadOnly := false.
]

{ #category : #initialization }
ITForm >> initializeWidgets [
]

{ #category : #'API - validations' }
ITForm >> isValid [
	
	^ fields allSatisfy: [ :each | each isValid ]
]

{ #category : #private }
ITForm >> rebuildFocusOrder [

	self focusOrder: (fields collect: [ :aField | aField fieldWidget ] ).
]

{ #category : #private }
ITForm >> rebuildLayout [

	self rebuildFocusOrder.
	
	spec := SpecLayout composed.

	spec newColumn: [ :column | 
		fields do: [ :aField | column newRow: [:row | row add: aField name] height: self class inputTextHeight].
		column newRow: [ :r |  ]
	].

	self layout: spec.
]

{ #category : #'API - validations' }
ITForm >> validate [
	
	hasValidation ifFalse: [ ^ true ].
	
	fields do: [:each | each validate ].	
	^ self isValid
]

{ #category : #'API - validations' }
ITForm >> validateOnChange [
	
	validateOnChange := true
]

{ #category : #'API - fields' }
ITForm >> valueNamed: aFieldName [

	fields
		detect: [ :aField | aField name = aFieldName ]
		ifFound: [ :aField | ^ aField fieldValue ]
]

{ #category : #'API - fields' }
ITForm >> valueNamed: aName set: aValue [
	fields detect: [ :each | each name = aName ] ifFound: [ :aField | aField fieldValue: aValue ]
]

{ #category : #'accessing-widgets' }
ITForm >> widgetAt: aName put: aWidget [ 

	^ widgets at: aName put: aWidget 
]
