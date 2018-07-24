"
A button morph typically used on a toolbar. The button can have a badge.
"
Class {
	#name : #ITButtonMorph,
	#superclass : #PluggableButtonMorph,
	#instVars : [
		'badgeFont',
		'badgeSelector'
	],
	#category : #'Icetray-Morphs'
}

{ #category : #accessing }
ITButtonMorph >> badge [
	badgeSelector ifNil: [ ^ nil ].
	^ self model perform: badgeSelector
]

{ #category : #accessing }
ITButtonMorph >> badgeColor [
	^ Smalltalk ui theme badgeColor
]

{ #category : #accessing }
ITButtonMorph >> badgeFont [
	^ badgeFont ifNil: [ badgeFont := self newBadgeFont ]
]

{ #category : #accessing }
ITButtonMorph >> badgeSelector: aSymbol [
	badgeSelector := aSymbol
]

{ #category : #accessing }
ITButtonMorph >> badgeTextColor [
	^ Smalltalk ui theme badgeTextColor
]

{ #category : #accessing }
ITButtonMorph >> drawBadgeOn: aCanvas [
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

{ #category : #accessing }
ITButtonMorph >> drawOn: aCanvas [
	super drawOn: aCanvas.
	self hasBadge
		ifTrue: [ self drawBadgeOn: aCanvas ]
]

{ #category : #accessing }
ITButtonMorph >> hasBadge [
	^ self badge notNil
]

{ #category : #accessing }
ITButtonMorph >> newBadgeFont [
	| baseBadgeFont |
	baseBadgeFont := StandardFonts codeFont.
 	^ (LogicalFont 
		familyName: baseBadgeFont familyName 
		pointSize: baseBadgeFont pointSize - 3)
			weightValue: 700
]

{ #category : #accessing }
ITButtonMorph >> normalBorderStyle [
	^ BorderStyle simple
		width: 0;
		baseColor: Color transparent
]

{ #category : #accessing }
ITButtonMorph >> normalFillStyle [
	^ Color transparent
]
