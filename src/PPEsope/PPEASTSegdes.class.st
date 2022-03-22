Class {
	#name : #PPEASTSegdes,
	#superclass : #PPEASTStatement,
	#instVars : [
		'segname'
	],
	#category : #'PPEsope-Parser'
}

{ #category : #accessing }
PPEASTSegdes >> acceptVisitor: aVisitor [
	^ aVisitor visitPPEASTSegdes: self
]

{ #category : #accessing }
PPEASTSegdes >> segname [
	^ segname
]

{ #category : #accessing }
PPEASTSegdes >> segname: anObject [
	segname := anObject
]
