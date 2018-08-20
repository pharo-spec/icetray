Extension { #name : #ComposablePresenter }

{ #category : #'*Icetray' }
ComposablePresenter class >> formLabelWidth [
	^ 100
]

{ #category : #'*Icetray' }
ComposablePresenter >> newFastTable [

	^ ITFastTableAdapter new
]

{ #category : #'*Icetray' }
ComposablePresenter >> newFastTreeTable [
	"For the moment, this is the same as a table, but it will receive a tree datasource.
	 But this needs to be a spec component"
	self flag: #todo. "This should be a spec component (but we don't have it for the moment)"
	^ FTTableMorph new
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		asSpecAdapter
]

{ #category : #'*Icetray' }
ComposablePresenter >> newPanel [
	^ PanelMorph new 
		changeTableLayout;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		asSpecAdapter
]

{ #category : #'*Icetray' }
ComposablePresenter >> newReadOnlyText [ 
	^ ITReadOnlyTextMorph new
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		asSpecAdapter
]
