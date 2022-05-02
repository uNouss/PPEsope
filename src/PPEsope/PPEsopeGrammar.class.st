Class {
	#name : #PPEsopeGrammar,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'file',
		'include',
		'includeName',
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
		'notEndLine',
		'lines',
		'identifier',
		'comma',
		'endOfLine',
		'beginOfLine'
	],
	#category : #'PPEsope-Parser'
}

{ #category : #'as yet unclassified' }
PPEsopeGrammar class >> getSourceFromFile: filename [
	^ filename asFileReference contents asText
]

{ #category : #accessing }
PPEsopeGrammar >> beginOfLine [
	^ '      ' asPParser token
]

{ #category : #accessing }
PPEsopeGrammar >> comma [
	^ $, asPParser
]

{ #category : #accessing }
PPEsopeGrammar >> endOfLine [
	^ (Character cr asPParser / Character lf asPParser)  plus
]

{ #category : #accessing }
PPEsopeGrammar >> file [
	^ (segact / segadj / segdef / segdes / segini /  segsup / pointer / unknownLine) plus
]

{ #category : #accessing }
PPEsopeGrammar >> identifier [
	^ #letter asPParser , #word asPParser star.
]

{ #category : #accessing }
PPEsopeGrammar >> include [
	^ '#include' asPParser, spaces, includeName, endOfLine
]

{ #category : #accessing }
PPEsopeGrammar >> includeName [
	^ ($" asPParser / $< asPParser), (identifier, $. asPParser, identifier) token, ($" asPParser  / $>  asPParser)
]

{ #category : #accessing }
PPEsopeGrammar >> lines [
	^ notEndLine star 
]

{ #category : #accessing }
PPEsopeGrammar >> notEndLine [
	^ beginOfLine, 'end' asPParser not, endOfLine negate plus, endOfLine
]

{ #category : #accessing }
PPEsopeGrammar >> pointer [
	^ beginOfLine, 'pointeur' asPParser, spaces, pointerName, endOfLine
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
	^ beginOfLine, 'segact' asPParser, spaces , comma, spaces, segname, endOfLine
]

{ #category : #accessing }
PPEsopeGrammar >> segadj [
	^ beginOfLine, 'segadj' asPParser, spaces , comma, spaces, segname, endOfLine
]

{ #category : #accessing }
PPEsopeGrammar >> segdef [

	^ beginOfLine, ('segment' asPParser, spaces, comma, segname) token, endOfLine,
	lines,
	beginOfLine, ('end' asPParser , spaces, 'segment' asPParser) token, endOfLine
]

{ #category : #accessing }
PPEsopeGrammar >> segdes [
	^ beginOfLine, 'segdes' asPParser token, spaces , comma, spaces, segname, endOfLine
]

{ #category : #accessing }
PPEsopeGrammar >> segini [
	^ beginOfLine, 'segini' asPParser, spaces , comma, spaces, segname, endOfLine
]

{ #category : #accessing }
PPEsopeGrammar >> segname [
	^ #letter asPParser plus token
]

{ #category : #accessing }
PPEsopeGrammar >> segsup [
	^ beginOfLine , 'segsup' asPParser, spaces , comma, spaces, segname, endOfLine
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
	^ (endOfLine negate plus) token optional, endOfLine
]
