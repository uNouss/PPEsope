Class {
	#name : #PPEsopeRewriterTest,
	#superclass : #PP2CompositeNodeTest,
	#category : #'PPEsope-Tests'
}

{ #category : #tests }
PPEsopeRewriterTest class >> esopeBigFile [
	^ PPEsopeGrammarTest esopeBigFile
]

{ #category : #tests }
PPEsopeRewriterTest class >> esopeBigFileProcessed [
	^ ''
]

{ #category : #tests }
PPEsopeRewriterTest class >> esopeSmallFile [
	^ PPEsopeGrammarTest esopeSmallFile
]

{ #category : #tests }
PPEsopeRewriterTest class >> esopeSmallFileProcessed [
	^ ''
]

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
PPEsopeRewriterTest >> testFortranLine [
	| sourcecode |
	sourcecode := '      subroutine test(brr)
'.
	self parse: sourcecode rule: #fortranLine.

	self assert: parser output equals: sourcecode
]

{ #category : #accessing }
PPEsopeRewriterTest >> testFortranLineEsoAt [
	self parse: '      rlist.ilist=0
' rule: #fortranLine.
	self assert: parser output equals: '      ESOat(rlist,ilist)=0
'
]

{ #category : #accessing }
PPEsopeRewriterTest >> testFortranLineEsoSlash [
	self
		parse:
			'        lxs=xs.cstg(/1)
'
		rule: #fortranLine.
	self
		assert: parser output
		equals:
			'        lxs=ESOsl(ESOat(xs,cstg),1)
'
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
PPEsopeRewriterTest >> testSegactWithSpaces [
	| sourcecode |
	
	sourcecode := '  segact,xs
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
PPEsopeRewriterTest >> testSmallFile [
	self parse: self class esopeSmallFile rule: #file.
	self assert: parser output equals: self class esopeSmallFileProcessed
]

{ #category : #accessing }
PPEsopeRewriterTest >> testTranslateEsopeArray [
	self
		assert:
			(parser translateEsopeAt: (parser translateEsopeArray: 'ab.cd(ef)'))
		equals: 'ESOar(ESOat(ab,cd),ef)'
]

{ #category : #accessing }
PPEsopeRewriterTest >> testTranslateEsopeArrayDotInsidePar [
	self
		assert: (parser translateEsopeAt: (parser translateEsopeArray: 'rlist.elist(rlist.ilist)=ms'))
		equals: 'ESOar(ESOat(rlist,elist),ESOat(rlist,ilist))=ms'
]

{ #category : #accessing }
PPEsopeRewriterTest >> testTranslateEsopeAtBinaryOperator [
	self
		assert: (parser translateEsopeAt: '         if(lxs.eq.0)then')
		equals: '         if(lxs.eq.0)then'.
	self
		assert:
			(parser
				translateEsopeAt: '              if((rlist.ilist).gt.nlist)then')
		equals: '              if((ESOat(rlist,ilist)).gt.nlist)then'
]

{ #category : #accessing }
PPEsopeRewriterTest >> testTranslateEsopeAtEqOperator [
	self assert: (parser translateEsopeAt: '         if(lxs.eq.0)then') equals: '         if(lxs.eq.0)then'
]

{ #category : #accessing }
PPEsopeRewriterTest >> testTranslateEsopeAtNoDot [
	self assert: (parser translateEsopeAt: 'abc') equals: 'abc'
]

{ #category : #accessing }
PPEsopeRewriterTest >> testTranslateEsopeAtOneDot [
	self
		assert: (parser translateEsopeAt: 'abc.def')
		equals: 'ESOat(abc,def)'
]

{ #category : #accessing }
PPEsopeRewriterTest >> testTranslateEsopeAtTwoDots [
	self
		assert: (parser translateEsopeAt: 'abc.def=opq.xyz')
		equals: 'ESOat(abc,def)=ESOat(opq,xyz)'
]

{ #category : #accessing }
PPEsopeRewriterTest >> testTranslateEsopeSlashEsopeAt [
	self
		assert:
			(parser
				translateEsopeAt: (parser translateEsopeSlash: 'abc.def(/1)'))
	
		equals: 'ESOsl(ESOat(abc,def),1)'
]

{ #category : #accessing }
PPEsopeRewriterTest >> testTranslateEsopeSlashNone [
	self
		assert: (parser translateEsopeSlash: 'abc.def')
		equals: 'abc.def'
]

{ #category : #accessing }
PPEsopeRewriterTest >> testTranslateEsopeSlashOne [
	self
		assert: (parser translateEsopeSlash: 'abc.def(/1)')
		equals: 'ESOsl(abc.def,1)'
]

{ #category : #accessing }
PPEsopeRewriterTest >> testTranslateEsopeSlashSlash [
	self
		assert: (parser translateEsopeAt: 'C     //fin repeter "decouper chaque chaine"')
		equals: 'C     //fin repeter "decouper chaque chaine"'
]
