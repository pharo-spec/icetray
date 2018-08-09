Class {
	#name : #ITRequiredFieldValidation,
	#superclass : #ITAbstractValidation,
	#category : #'Icetray-Forms'
}

{ #category : #accessing }
ITRequiredFieldValidation >> isValid: aField [

	^ aField text isNotNil and: [ aField text trim isNotEmpty ]
]

{ #category : #accessing }
ITRequiredFieldValidation >> message [

	^ '{1} is required'
]
