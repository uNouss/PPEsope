Class {
	#name : #PPEsopeGrammarTest,
	#superclass : #TestCase,
	#category : #'PPEsope-Tests'
}

{ #category : #tests }
PPEsopeGrammarTest >> testSegAct [

	| string parsing |
	string := '      segact,splist'.
	parsing := PPEsopeGrammar parse: string startingAt: #segact.
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
PPEsopeGrammarTest >> testSegIni [

	| segini parsing |
	segini := '      segini,rlist'.
	parsing := PPEsopeGrammar parse: segini startingAt: #segini.
	self assert: parsing isPetit2Success
]
