Class {
	#name : #PPEsopeGrammar,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'carriageReturn',
		'file',
		'include',
		'includeName',
		'lineStart',
		'pointer',
		'pointerName',
		'segact',
		'segadj',
		'segdef',
		'segdes',
		'segini',
		'segname',
		'segsup',
		'spaces',
		'unknownLine',
		'lineEnd',
		'notEndLine',
		'lines',
		'identifier',
		'comma'
	],
	#category : #'PPEsope-Parser'
}

{ #category : #'as yet unclassified' }
PPEsopeGrammar class >> getSourceFromFile: filename [
	^ filename asFileReference contents asText
]

{ #category : #accessing }
PPEsopeGrammar >> carriageReturn [
	^ Character cr asPParser
]

{ #category : #accessing }
PPEsopeGrammar >> comma [
	^ $, asPParser
]

{ #category : #accessing }
PPEsopeGrammar >> file [
	^ (segdef / segini / segact / segadj / segdes / segsup / pointer / unknownLine) plus
]

{ #category : #accessing }
PPEsopeGrammar >> identifier [
	^ #letter asPParser , #word asPParser star.
]

{ #category : #accessing }
PPEsopeGrammar >> include [
	^ '#include' asPParser, spaces, includeName, lineEnd
]

{ #category : #accessing }
PPEsopeGrammar >> includeName [
	^ ($" asPParser / $< asPParser), (identifier, $. asPParser, identifier) token, ($" asPParser  / $>  asPParser)
]

{ #category : #accessing }
PPEsopeGrammar >> lineEnd [
	^ carriageReturn plus
]

{ #category : #accessing }
PPEsopeGrammar >> lineStart [
	^ '      ' asPParser token
]

{ #category : #accessing }
PPEsopeGrammar >> lines [
	^ notEndLine star 
]

{ #category : #accessing }
PPEsopeGrammar >> notEndLine [
	^ (lineStart, 'end' asPParser not, carriageReturn negate plus) token, carriageReturn
]

{ #category : #accessing }
PPEsopeGrammar >> pointer [
	^ lineStart, 'pointeur' asPParser, spaces, pointerName, lineEnd
]

{ #category : #accessing }
PPEsopeGrammar >> pointerName [
	^ (identifier, $. asPParser, identifier) token
]

{ #category : #accessing }
PPEsopeGrammar >> rpar [
	^ $) asPParser 
]

{ #category : #accessing }
PPEsopeGrammar >> segact [
	^ lineStart, 'segact' asPParser, spaces , comma, spaces, segname, lineEnd
]

{ #category : #accessing }
PPEsopeGrammar >> segadj [
	^ lineStart, 'segadj' asPParser, spaces , comma, spaces, segname, lineEnd
]

{ #category : #accessing }
PPEsopeGrammar >> segdef [

	^ lineStart, 'segment' asPParser, spaces, comma, segname, lineEnd,
	lines,
	lineStart, 'end' asPParser , spaces, 'segment' asPParser, lineEnd
]

{ #category : #accessing }
PPEsopeGrammar >> segdes [
	^ lineStart, 'segdes' asPParser token, spaces , comma, spaces, segname, lineEnd
]

{ #category : #accessing }
PPEsopeGrammar >> segini [
	^ lineStart, 'segini' asPParser, spaces , comma, spaces, segname, lineEnd
]

{ #category : #accessing }
PPEsopeGrammar >> segname [
	^ #letter asPParser plus token
]

{ #category : #accessing }
PPEsopeGrammar >> segsup [
	^ lineStart , 'segsup' asPParser, spaces , comma, spaces, segname, lineEnd
]

{ #category : #accessing }
PPEsopeGrammar >> spaces [
	^ #space asPParser star
]

{ #category : #accessing }
PPEsopeGrammar >> start [
	^ file end
]

{ #category : #accessing }
PPEsopeGrammar >> unknownLine [
	^ (carriageReturn negate plus) token, carriageReturn
]
