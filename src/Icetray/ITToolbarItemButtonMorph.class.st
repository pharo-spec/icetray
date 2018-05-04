Class {
	#name : #ITToolbarItemButtonMorph,
	#superclass : #PluggableButtonMorph,
	#instVars : [
		'badgeFont',
		'badgeSelector'
	],
	#category : #Icetray
}

{ #category : #accessing }
ITToolbarItemButtonMorph >> badge [
	badgeSelector ifNil: [ ^ nil ].
	^ self model perform: badgeSelector
]

{ #category : #accessing }
ITToolbarItemButtonMorph >> badgeColor [
	^ Smalltalk ui theme badgeColor
]

{ #category : #accessing }
ITToolbarItemButtonMorph >> badgeFont [
	^ badgeFont ifNil: [ badgeFont := self newBadgeFont ]
]

{ #category : #accessing }
ITToolbarItemButtonMorph >> badgeSelector: aSymbol [
	badgeSelector := aSymbol
]

{ #category : #accessing }
ITToolbarItemButtonMorph >> badgeTextColor [
	^ Smalltalk ui theme badgeTextColor
]

{ #category : #drawing }
ITToolbarItemButtonMorph >> drawBadgeOn: aCanvas [
	| badgeString badgeBounds textBounds textWidth textHeight width |
	
	badgeString := self badge asString.
	textWidth := self badgeFont widthOfString: badgeString.
	textHeight := self badgeFont height.
	width := 14 max: textWidth + 2. 
	badgeBounds := ((bounds right - width - 2)@(bounds top + 2) extent: width@14).
	aCanvas 
		fillOval: badgeBounds
		fillStyle: self badgeColor.
		
	textBounds := 
		(badgeBounds center - ((textWidth@textHeight) / 2.0)) + (1@0) 
		extent: textWidth@textHeight. 
	aCanvas 
		drawString: badgeString
		in: textBounds
		font: self badgeFont 
		color: self badgeTextColor
]

{ #category : #drawing }
ITToolbarItemButtonMorph >> drawOn: aCanvas [
	super drawOn: aCanvas.
	self hasBadge
		ifTrue: [ self drawBadgeOn: aCanvas ]
]

{ #category : #testing }
ITToolbarItemButtonMorph >> hasBadge [
	^ self badge notNil
]

{ #category : #drawing }
ITToolbarItemButtonMorph >> newBadgeFont [
	| baseBadgeFont |
	baseBadgeFont := StandardFonts codeFont.
 	^ (LogicalFont 
		familyName: baseBadgeFont familyName 
		pointSize: baseBadgeFont pointSize - 3)
			weightValue: 700
]

{ #category : #style }
ITToolbarItemButtonMorph >> normalBorderStyle [
	^ BorderStyle simple
		width: 0;
		baseColor: Color transparent
]

{ #category : #style }
ITToolbarItemButtonMorph >> normalFillStyle [
	^ Color transparent
]
