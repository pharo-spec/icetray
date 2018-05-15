Extension { #name : #ITToolBar }

{ #category : #'*Icetray-Commander' }
ITToolBar >> addItemsFromContext: aContext [
	| menu |
	
	menu := CmdMenu activatedBy: ITToolbarActivation.
	menu buildInContext: aContext.
	menu buildToolbarOn: self

]
