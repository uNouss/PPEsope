Class {
	#name : #BaselineOfPPEsope,
	#superclass : #BaselineOf,
	#category : #BaselineOfPPEsope
}

{ #category : #baselines }
BaselineOfPPEsope >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			spec blessing: #baseline.
			spec description: 'Esope Rewriter'.
			self defineDependencies: spec.
			self definePackages: spec.
			self defineGroups: spec ]

]

{ #category : #baselines }
BaselineOfPPEsope >> defineDependencies: spec [
	spec
		baseline: 'PetitParser2'
		with: [ spec repository: 'github://kursjan/petitparser2' ]
]

{ #category : #baselines }
BaselineOfPPEsope >> defineGroups: spec [
	spec 
		group: 'core'
		with: #( 'PPEsope' 'PPEsope-Tests' )

]

{ #category : #baselines }
BaselineOfPPEsope >> definePackages: spec [
	spec
		repository: 'https://github.com/uNouss/PPEsope';
		package: 'PPEsope' with: [ spec requires: #(PetitParser2) ];
		package: 'PPEsope-Tests'

]
