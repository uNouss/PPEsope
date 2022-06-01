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
		'segsup',
		'spaces',
		'notEndLine',
		'lines',
		'identifier',
		'comma',
		'endOfLine',
		'beginOfLine',
		'segIdentifier',
		'fortranLine',
		'emptyLine'
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
PPEsopeGrammar >> emptyLine [

	^ spaces , endOfLine
]

{ #category : #accessing }
PPEsopeGrammar >> endOfLine [
	^ (Character cr asPParser / Character lf asPParser)  plus
]

{ #category : #accessing }
PPEsopeGrammar >> file [

	^ (segact / segadj / segdef / segdes / segini / segsup / pointer
	   / include / fortranLine / emptyLine) plus
]

{ #category : #accessing }
PPEsopeGrammar >> fortranLine [
	^ (endOfLine negate plus) token optional, endOfLine
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
	^ identifier, $. asPParser, identifier
]

{ #category : #accessing }
PPEsopeGrammar >> rpar [
	^ $) asPParser 
]

{ #category : #accessing }
PPEsopeGrammar >> segIdentifier [
	^ endOfLine negate plus
]

{ #category : #accessing }
PPEsopeGrammar >> segact [
	^ beginOfLine, spaces, 'segact' asPParser, segIdentifier, endOfLine
]

{ #category : #accessing }
PPEsopeGrammar >> segadj [
	^ beginOfLine, spaces, 'segadj' asPParser, segIdentifier, endOfLine
]

{ #category : #accessing }
PPEsopeGrammar >> segdef [

	^ beginOfLine, spaces, 'segment' asPParser, segIdentifier, endOfLine,
	lines,
	beginOfLine, spaces, 'end' asPParser , spaces, 'segment' asPParser, endOfLine
]

{ #category : #accessing }
PPEsopeGrammar >> segdes [
	^ beginOfLine, spaces, 'segdes' asPParser, segIdentifier, endOfLine
]

{ #category : #accessing }
PPEsopeGrammar >> segini [
	^ beginOfLine, spaces, 'segini' asPParser, segIdentifier, endOfLine
]

{ #category : #accessing }
PPEsopeGrammar >> segsup [
	^ beginOfLine , spaces, 'segsup' asPParser, segIdentifier, endOfLine
]

{ #category : #accessing }
PPEsopeGrammar >> spaces [
	^ #space asPParser star
]

{ #category : #accessing }
PPEsopeGrammar >> start [
	^ file end
]
