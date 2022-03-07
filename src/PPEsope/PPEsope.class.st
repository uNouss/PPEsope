Class {
	#name : #PPEsope,
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
		'spaces'
	],
	#category : #'PPEsope-Parser'
}

{ #category : #accessing }
PPEsope >> attributes [
	^ variable
]

{ #category : #accessing }
PPEsope >> declaration [
	^ type, spaces, variable, ($( asPParser, attributes, $) asPParser) optional
]

{ #category : #accessing }
PPEsope >> extension [
	^ $. asPParser, ('seg' asPParser / 'h' asPParser)
]

{ #category : #accessing }
PPEsope >> identifier [
 ^ (#letter asPParser , #word asPParser star, extension) flatten.
]

{ #category : #accessing }
PPEsope >> include [
	self flag: #fixme. "#include <[^>]+>.
	^\s*\#include\s+[""<]([^"">]+)*["">]
	pour tester: https://regex101.com/
	"
	^ '#include' asPParser , self spaces , includeName
]

{ #category : #accessing }
PPEsope >> includeName [
	^ ($" asPParser / $< asPParser), identifier, ($" asPParser  / $>  asPParser)
]

{ #category : #accessing }
PPEsope >> line [
	^ spaces, declaration
]

{ #category : #accessing }
PPEsope >> lines [
	^ line star
]

{ #category : #accessing }
PPEsope >> lpar [
	^ $( asPParser 
]

{ #category : #accessing }
PPEsope >> rpar [
	^ $) asPParser 
]

{ #category : #accessing }
PPEsope >> segdef [

	^ spaces, 'segment' asPParser, spaces, $, asPParser
	  , #letter asPParser plus token, spaces, lines, spaces, 'end' asPParser
	  , spaces, 'segment'
]

{ #category : #accessing }
PPEsope >> segini [
	^ spaces , 'segini' asPParser , spaces , $, asPParser
	  , #letter asPParser plus token
]

{ #category : #accessing }
PPEsope >> spaces [
	^ #space asPParser star
]

{ #category : #accessing }
PPEsope >> start [
	^ include end
]

{ #category : #accessing }
PPEsope >> type [
	^ 'integer' asPParser / 'logical' asPParser / 'real' asPParser
]

{ #category : #accessing }
PPEsope >> variable [
	self flag: #fixme. "fixer la taille par exemple [a-zA-Z]{,7}"
	^ #letter asPParser plus token
]
