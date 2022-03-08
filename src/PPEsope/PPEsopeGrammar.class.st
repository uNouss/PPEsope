Class {
	#name : #PPEsopeGrammar,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'includeName',
		'extension',
		'include',
		'identifier',
		'lines',
		'line',
		'declaration',
		'type',
		'variable',
		'attributes',
		'spaces',
		'virgule',
		'segname',
		'carriageReturn',
		'lineStart'
	],
	#category : #'PPEsope-Parser'
}

{ #category : #'as yet unclassified' }
PPEsopeGrammar class >> getSourceFromFile: filename [
	^ filename asFileReference contents asText
]

{ #category : #accessing }
PPEsopeGrammar >> attributes [
	^ variable
]

{ #category : #accessing }
PPEsopeGrammar >> carriageReturn [
	^ Character cr asPParser
]

{ #category : #accessing }
PPEsopeGrammar >> declaration [
	^ type, spaces, variable, ($( asPParser, attributes, $) asPParser) optional
]

{ #category : #accessing }
PPEsopeGrammar >> extension [
	^ $. asPParser, ('seg' asPParser / 'h' asPParser)
]

{ #category : #accessing }
PPEsopeGrammar >> identifier [
 ^ (#letter asPParser , #word asPParser star, extension) flatten.
]

{ #category : #accessing }
PPEsopeGrammar >> include [
	self flag: #fixme. "#include <[^>]+>.
	^\s*\#include\s+[""<]([^"">]+)*["">]
	pour tester: https://regex101.com/
	"
	^ '#include' asPParser , self spaces , includeName
]

{ #category : #accessing }
PPEsopeGrammar >> includeName [
	^ ($" asPParser / $< asPParser), identifier, ($" asPParser  / $>  asPParser)
]

{ #category : #accessing }
PPEsopeGrammar >> line [
	^ lineStart, 'end' asPParser not, carriageReturn not plus, carriageReturn
]

{ #category : #accessing }
PPEsopeGrammar >> lineStart [
	^ '      ' asPParser
]

{ #category : #accessing }
PPEsopeGrammar >> lines [
	^ line star
]

{ #category : #accessing }
PPEsopeGrammar >> lpar [
	^ $( asPParser 
]

{ #category : #accessing }
PPEsopeGrammar >> pointeur [
	"^\s*pointeur\s*\w+\.\w+"
	^ variable
]

{ #category : #accessing }
PPEsopeGrammar >> rpar [
	^ $) asPParser 
]

{ #category : #accessing }
PPEsopeGrammar >> segdef [

	^ lineStart, 'segment' asPParser, spaces, virgule, segname, carriageReturn,
	lines,
	lineStart, 'end' asPParser , spaces, 'segment' asPParser 
]

{ #category : #accessing }
PPEsopeGrammar >> segini [
	^ spaces , 'segini' asPParser , spaces , $, asPParser
	  , #letter asPParser plus token
]

{ #category : #accessing }
PPEsopeGrammar >> segname [

	^ #letter asPParser plus token
]

{ #category : #accessing }
PPEsopeGrammar >> spaces [
	^ #space asPParser star
]

{ #category : #accessing }
PPEsopeGrammar >> start [
	^ include end
]

{ #category : #accessing }
PPEsopeGrammar >> type [
	^ 'integer' asPParser / 'logical' asPParser / 'real' asPParser
]

{ #category : #accessing }
PPEsopeGrammar >> variable [
	self flag: #fixme. "fixer la taille par exemple [a-zA-Z]{,7}"
	^ #letter asPParser plus token
]

{ #category : #accessing }
PPEsopeGrammar >> virgule [
	^ $, asPParser
]
