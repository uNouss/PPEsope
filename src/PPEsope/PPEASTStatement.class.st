Class {
	#name : #PPEASTStatement,
	#superclass : #Object,
	#instVars : [
		'startPosition',
		'stopPosition'
	],
	#category : #'PPEsope-Parser'
}

{ #category : #accessing }
PPEASTStatement >> startPosition [
	^ startPosition
]

{ #category : #accessing }
PPEASTStatement >> startPosition: anObject [
	startPosition := anObject
]

{ #category : #accessing }
PPEASTStatement >> stopPosition [
	^ stopPosition
]

{ #category : #accessing }
PPEASTStatement >> stopPosition: anObject [
	stopPosition := anObject
]
