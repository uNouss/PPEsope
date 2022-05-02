Class {
	#name : #PPEsopeRewriterTest,
	#superclass : #PP2CompositeNodeTest,
	#category : #'PPEsope-Tests'
}

{ #category : #accessing }
PPEsopeRewriterTest >> parserClass [
	^ PPEsopeRewriter 
]

{ #category : #running }
PPEsopeRewriterTest >> setUp [
	super setUp.
	parser initStream.
]

{ #category : #accessing }
PPEsopeRewriterTest >> testPointer [
	| sourcecode |
	sourcecode := 'pointeur splist.list
'.
	self parse: '      ' , sourcecode rule: #pointer.
	self assert: parser output equals: 'cESO  ' , sourcecode
]

{ #category : #accessing }
PPEsopeRewriterTest >> testSegact [
	| sourcecode |
	sourcecode := 'segact,splist
'.
	self parse: '      ' , sourcecode rule: #segact.
	self assert: parser output equals: 'cESO  ' , sourcecode
]

{ #category : #accessing }
PPEsopeRewriterTest >> testSegadj [
	| sourcecode |
	sourcecode := 'segadj,aplist
'.
	self parse: '      ' , sourcecode rule: #segadj.
	self assert: parser output equals: 'cESO  ' , sourcecode
]

{ #category : #accessing }
PPEsopeRewriterTest >> testSegdef [
	| finalcode sourcecode |
	sourcecode := '      segment,values
        character*8        valtyp
        real               valf(valnf)
        integer            vale(valne)
      endsegment
'.
	finalcode := 'cESO  segment,values
cESO    character*8        valtyp
cESO    real               valf(valnf)
cESO    integer            vale(valne)
cESO  endsegment
'.
	self parse: sourcecode rule: #segdef.
	self assert: parser output equals: finalcode.
]

{ #category : #accessing }
PPEsopeRewriterTest >> testSegdes [
	| sourcecode |
	sourcecode := 'segdes,alist
'.
	self parse: '      ' , sourcecode rule: #segdes.
	self assert: parser output equals: 'cESO  ' , sourcecode
]

{ #category : #accessing }
PPEsopeRewriterTest >> testSegini [
	| sourcecode |
	sourcecode := 'segini,rlist
'.
	self parse: '      ' , sourcecode rule: #segini.
	self assert: parser output equals: 'cESO  ' , sourcecode
]

{ #category : #accessing }
PPEsopeRewriterTest >> testSegsup [
	| sourcecode |
	sourcecode := 'segsup,rlist
'.
	self parse: '      ' , sourcecode rule: #segsup.
	self assert: parser output equals: 'cESO  ' , sourcecode
]

{ #category : #accessing }
PPEsopeRewriterTest >> testUnknownLine [
	| sourcecode |
	sourcecode := '      subroutine test(brr)
'.
	self parse: sourcecode rule: #unknownLine.

	self assert: parser output equals: sourcecode
]
