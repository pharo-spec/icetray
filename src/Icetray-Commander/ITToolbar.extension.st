Extension { #name : #ITToolbar }

{ #category : #'*Icetray-Commander' }
ITToolbar >> addItemsFromContext: aContext [
	| menu |
	
	menu := CmdMenu activatedBy: ITToolbarActivation.
	menu buildInContext: aContext.
	menu buildToolbarOn: self

]
