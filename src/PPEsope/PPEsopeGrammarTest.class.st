Class {
	#name : #PPEsopeGrammarTest,
	#superclass : #PP2CompositeNodeTest,
	#category : #'PPEsope-Tests'
}

{ #category : #accessing }
PPEsopeGrammarTest >> parserClass [
	^ PPEsopeGrammar
]

{ #category : #tests }
PPEsopeGrammarTest >> testCommentLine [
	self parse: 'c#include <implicit.h>' rule: #commentLine.
	self parse: 'cxxxxxxxxxxxxxxxxxxxxxxx' rule: #commentLine.
	
	self fail: ' cxxxxxxxxxxxxxxxxxxxxxxx' rule: #commentLine.
	self fail: '!#include <implicit.h>' rule: #commentLine.
]

{ #category : #tests }
PPEsopeGrammarTest >> testInclude [
	self parse: '#include <implicit.h>' rule: #include.
	self parse: '#include "string.seg"' rule: #include
]

{ #category : #tests }
PPEsopeGrammarTest >> testPointeur [
	self parse: '      pointeur splist.list' rule: #pointeur.
	self fail: 'pointeur splist.list' rule: #pointeur.
]

{ #category : #tests }
PPEsopeGrammarTest >> testSegAct [
	self parse: '      segact,splist' rule: #segact.
	self fail: 'segact,splist' rule: #segact.
]

{ #category : #tests }
PPEsopeGrammarTest >> testSegAdj [
	self parse: '      segadj,alist' rule: #segadj.
	self fail: 'segadj,alist' rule: #segadj.
]

{ #category : #tests }
PPEsopeGrammarTest >> testSegDef [

	| segment |
	segment := '      segment,values
        character*8        valtyp
        real               valf(valnf)
        integer            vale(valne)
        logical            vall(valnl)
        character*(valsmx) valc(valnc)
        integer            vals(valnc)
      endsegment'.
	self parse: segment rule: #segdef.
	self fail: '      segment,values' rule: #segdef
]

{ #category : #tests }
PPEsopeGrammarTest >> testSegDes [
	self parse: '      segdes,alist' rule: #segdes.
	self fail: 'segdes,alist' rule: #segdes.
]

{ #category : #tests }
PPEsopeGrammarTest >> testSegIni [
	self parse: '      segini,rlist' rule: #segini.
	self fail: 'segini,rlist' rule: #segini.
]

{ #category : #tests }
PPEsopeGrammarTest >> testSegSup [
	self parse: '      segsup,rlist' rule: #segsup.
	self fail: 'segsup,rlist' rule: #segsup.
]

{ #category : #tests }
PPEsopeGrammarTest >> testUnknownLine [
	self parse: '      subroutine test(brr)' rule: #unknownLine.
]
