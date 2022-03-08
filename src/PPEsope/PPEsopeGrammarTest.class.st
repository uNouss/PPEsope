Class {
	#name : #PPEsopeGrammarTest,
	#superclass : #TestCase,
	#category : #'PPEsope-Tests'
}

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
