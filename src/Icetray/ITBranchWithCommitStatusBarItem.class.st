Class {
	#name : #ITBranchWithCommitStatusBarItem,
	#superclass : #ITStatusBarItem,
	#instVars : [
		'model'
	],
	#category : #'Icetray-Core'
}

{ #category : #factory }
ITBranchWithCommitStatusBarItem >> branchNameMorph [
	^ ('{1} at ' format: {model branchName}) asMorph
]

{ #category : #accessing }
ITBranchWithCommitStatusBarItem >> model [
	^ model
]

{ #category : #accessing }
ITBranchWithCommitStatusBarItem >> model: anObject [
	model := anObject
]

{ #category : #factory }
ITBranchWithCommitStatusBarItem >> newStatusBarItemOn: aStatusBar [
	self model shortCommitId ifNil: [ ^ self model branchName asMorph ].

	^ PanelMorph new
		addMorph: self branchNameMorph;
		addMorph: self shortIdMorph;
		changeTableLayout;
		listDirection: #rightToLeft;
		hResizing: #shrinkWrap;
		vResizing: #spaceFill;
		yourself
]

{ #category : #factory }
ITBranchWithCommitStatusBarItem >> shortIdMorph [
	^ (ITURLLabelMorph contents: model shortCommitId)
		setBalloonText: 'Copy the commit ID to the clipboard';
		onClick: [ self model copyCommitIDToClipboard ];
		yourself
	
]
