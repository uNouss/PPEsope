Class {
	#name : #PPEsopeGrammar,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'carriageReturn',
		'file',
		'include',
		'includeName',
		'lineStart',
		'lines',
		'notEndLine',
		'pointeur',
		'pointeurName',
		'segact',
		'segadj',
		'segdef',
		'segdes',
		'segini',
		'segname',
		'segsup',
		'spaces',
		'unknownLine',
		'virgule',
		'lineEnd'
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
PPEsopeGrammar >> file [
	^ (segdef / segini / segact / segadj / segdes / segsup / pointeur / include / unknownLine) plus
]

{ #category : #accessing }
PPEsopeGrammar >> include [
	self flag: #fixme. "#include <[^>]+>.
	^\s*\#include\s+[""<]([^"">]+)*["">]
	pour tester: https://regex101.com/
	"
	^ '#include' asPParser, spaces, includeName, lineEnd
]

{ #category : #accessing }
PPEsopeGrammar >> includeName [
	^ ($" asPParser / $< asPParser), pointeurName, ($" asPParser  / $>  asPParser)
]

{ #category : #accessing }
PPEsopeGrammar >> lineEmpty [
	^ spaces /
	 spaces lineEnd optional
]

{ #category : #accessing }
PPEsopeGrammar >> lineEnd [
	^ carriageReturn star
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
PPEsopeGrammar >> lpar [
	^ $( asPParser 
]

{ #category : #accessing }
PPEsopeGrammar >> notEndLine [
	^ (lineStart, 'end' asPParser not, carriageReturn negate plus) token, carriageReturn
]

{ #category : #accessing }
PPEsopeGrammar >> pointeur [
	"^\s*pointeur\s*\w+\.\w+"
	^ lineStart, 'pointeur' asPParser, spaces, pointeurName, lineEnd
]

{ #category : #accessing }
PPEsopeGrammar >> pointeurName [
	^ (segname, $. asPParser, segname) token
]

{ #category : #accessing }
PPEsopeGrammar >> rpar [
	^ $) asPParser 
]

{ #category : #accessing }
PPEsopeGrammar >> segact [
	^ lineStart, 'segact' asPParser, spaces , $, asPParser, spaces, segname, lineEnd
]

{ #category : #accessing }
PPEsopeGrammar >> segadj [
	^ lineStart, 'segadj' asPParser, spaces , $, asPParser, spaces, segname, lineEnd
]

{ #category : #accessing }
PPEsopeGrammar >> segdef [

	^ lineStart, 'segment' asPParser, spaces, virgule, segname, carriageReturn,
	lines,
	lineStart, 'end' asPParser , spaces, 'segment' asPParser
]

{ #category : #accessing }
PPEsopeGrammar >> segdes [
	^ lineStart, 'segdes' asPParser, spaces , $, asPParser, spaces, segname, lineEnd
]

{ #category : #accessing }
PPEsopeGrammar >> segini [
	^ lineStart, 'segini' asPParser, spaces , $, asPParser, spaces, segname, lineEnd
]

{ #category : #accessing }
PPEsopeGrammar >> segname [
	^ #letter asPParser plus token
]

{ #category : #accessing }
PPEsopeGrammar >> segsup [
	^ lineStart , 'segsup' asPParser, spaces , $, asPParser, spaces, segname, lineEnd
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

{ #category : #accessing }
PPEsopeGrammar >> virgule [
	^ $, asPParser
]
