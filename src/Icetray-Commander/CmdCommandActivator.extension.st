Extension { #name : #CmdCommandActivator }

{ #category : #'*Icetray-Commander' }
CmdCommandActivator >> buildToolbarItem [
	| item |

	item := (ITButton new
		label: self activationStrategy toolbarName;
		icon: self menuItemIcon;
		position: self activationStrategy position;
		help: self activationStrategy help;
		badge: self command badge;
		action: [ self executeCommand ];
		yourself).
	
	^ item
]
