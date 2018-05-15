Extension { #name : #CmdRootMenuGroup }

{ #category : #'*Icetray' }
CmdRootMenuGroup >> buildToolbarOn: aToolbar [
	(contents sorted: [ :a :b | a order < b order ])
		select: [ :each | each activator canExecuteCommand ]
		thenDo: [ :each | aToolbar addItem: each buildToolbarItem ]
]
