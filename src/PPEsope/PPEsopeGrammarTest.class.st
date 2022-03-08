Class {
	#name : #PPEsopeGrammarTest,
	#superclass : #TestCase,
	#category : #'PPEsope-Tests'
}

{ #category : #tests }
PPEsopeGrammarTest >> testInclude [

	| string |
	string := '#include <implicit.h>'.
	self assert: (PPEsopeGrammar parse: string startingAt: #include) isPetit2Success.
	
	string := '#include "implicit.h"'.
	self assert: (PPEsopeGrammar parse: string startingAt: #include) isPetit2Success
]

{ #category : #tests }
PPEsopeGrammarTest >> testPointeur [

	| string parsing |
	string := '      pointeur splist.list'.
	parsing := PPEsopeGrammar parse: string startingAt: #pointeur.
	self assert: parsing isPetit2Success
]

{ #category : #tests }
PPEsopeGrammarTest >> testSegAct [

	| string parsing |
	string := '      segact,splist'.
	parsing := PPEsopeGrammar parse: string startingAt: #segact.
	self assert: parsing isPetit2Success
]

{ #category : #tests }
PPEsopeGrammarTest >> testSegAdj [

	| string parsing |
	string := '      segadj,alist'.
	parsing := PPEsopeGrammar parse: string startingAt: #segadj.
	self assert: parsing isPetit2Success
]

{ #category : #tests }
PPEsopeGrammarTest >> testSegDef [

	| segment parser |
	segment := '      segment,values
        character*8        valtyp
        real               valf(valnf)
        integer            vale(valne)
        logical            vall(valnl)
        character*(valsmx) valc(valnc)
        integer            vals(valnc)
      endsegment'.
	parser := PPEsopeGrammar parse: segment startingAt: #segdef.
	self assert: parser isPetit2Success
]

{ #category : #tests }
PPEsopeGrammarTest >> testSegDes [

	| string parsing |
	string := '      segdes,alist'.
	parsing := PPEsopeGrammar parse: string startingAt: #segdes.
	self assert: parsing isPetit2Success
]

{ #category : #tests }
PPEsopeGrammarTest >> testSegIni [

	| segini parsing |
	segini := '      segini,rlist'.
	parsing := PPEsopeGrammar parse: segini startingAt: #segini.
	self assert: parsing isPetit2Success
]

{ #category : #tests }
PPEsopeGrammarTest >> testSegSup [

	| string parsing |
	string := '      segsup,rlist'.
	parsing := PPEsopeGrammar parse: string startingAt: #segsup.
	self assert: parsing isPetit2Success
]
