"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestIcetray,
	#superclass : #PackageManifest,
	#category : #'Icetray-Manifest'
}

{ #category : #'meta-data - dependency analyser' }
ManifestIcetray class >> manuallyResolvedDependencies [
	^ #(#'Spec-MorphicAdapters' #'Random-Core' #'Polymorph-Widgets' #'Collections-Abstract' #'Graphics-Canvas' #'Morphic-Widgets-Pluggable')
]
