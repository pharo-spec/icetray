Class {
	#name : #ITAbstractValidation,
	#superclass : #Object,
	#category : #'Icetray-Forms'
}

{ #category : #accessing }
ITAbstractValidation >> isValid: aField [
	self subclassResponsibility
]

{ #category : #accessing }
ITAbstractValidation >> message [
	"The subclasses should return a message to format and show to the user.
    The message can use the following indexes:

    1 - Field Label
    2 - Field value
    3 - Field name"
	^ self subclassResponsibility 
]

{ #category : #accessing }
ITAbstractValidation >> messageFor: field [

	^ self message format: { field label. field value. field name  }
]

{ #category : #accessing }
ITAbstractValidation >> validate: field [

	(self isValid: field)
		ifFalse: [ field addValidationError: self ]
]
