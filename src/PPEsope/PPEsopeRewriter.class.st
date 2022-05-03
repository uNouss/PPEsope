Class {
	#name : #PPEsopeRewriter,
	#superclass : #PPEsopeGrammar,
	#instVars : [
		'stream'
	],
	#category : #'PPEsope-Parser'
}

{ #category : #accessing }
PPEsopeRewriter class >> ignoredNames [
	^ super ignoredNames , #(stream)
]

{ #category : #utilities }
PPEsopeRewriter >> copyLine: nodes from: start to: end [
	start to: end do: [ :i | stream << (nodes at: i) value ]
]

{ #category : #accessing }
PPEsopeRewriter >> endOfLine [
	"(Character cr asPParser / Character lf asPParser)  plus"
	
	^ super endOfLine
	==> [ :nodes | String streamContents: [ :str | nodes do: [ :c | str nextPut: c ] ] ]
]

{ #category : #initialization }
PPEsopeRewriter >> initStream [
	stream := '' writeStream
]

{ #category : #initialization }
PPEsopeRewriter >> initialize [
	super initialize.
	
	self initStream.
]

{ #category : #accessing }
PPEsopeRewriter >> output [
	^ stream contents.
]

{ #category : #rules }
PPEsopeRewriter >> pointer [
	" beginOfLine, spaces, 'pointeur' asPParser, spaces, pointerName, endOfLine"

	^ super pointer
		==> [ :nodes | stream << 'cESO  '.
				self copyLine: nodes from: 2 to: nodes size
			]
]

{ #category : #utilities }
PPEsopeRewriter >> processLinesInsideSegment: anOrderedCollection [
	"  (beginOfLine, 'end' asPParser not, endOfLine negate plus, endOfLine) star"
	anOrderedCollection do: [ :line |
			stream << 'cESO  '.
			self copyLine: line from: 3 to: 4
		 ]
]

{ #category : #rules }
PPEsopeRewriter >> segact [
	" beginOfLine, spaces, 'segact' asPParser, spaces , comma, spaces, segname, endOfLine"

	^ super segact
		==> [ :nodes | stream << 'cESO  '.
				self copyLine: nodes from: 2 to: nodes size
			]
]

{ #category : #rules }
PPEsopeRewriter >> segadj [
	" beginOfLine, spaces, 'segadj' asPParser, spaces , comma, spaces, segname, endOfLine"

	^ super segadj
		==> [ :nodes | stream << 'cESO  '.
				self copyLine: nodes from: 2 to: nodes size
			]
]

{ #category : #rules }
PPEsopeRewriter >> segdef [
	" beginOfLine, spaces, ('segment' asPParser, spaces, comma, segname) token, endOfLine,
	lines,
	beginOfLine, spaces, ('end' asPParser , spaces, 'segment' asPParser) token, endOfLine"
	
	^ super segdef
	==> [ :nodes |
		stream << 'cESO  '.
		self copyLine: nodes from: 2 to: 4.
		self processLinesInsideSegment: nodes fifth.
		stream << 'cESO  '.
		self copyLine: nodes from: 7  to: 9
		]
]

{ #category : #rules }
PPEsopeRewriter >> segdes [
	" beginOfLine, spaces, 'segact' asPParser, spaces , comma, spaces, segname, endOfLine"

	^ super segdes
		==> [ :nodes | stream << 'cESO  '.
				self copyLine: nodes from: 2 to: nodes size
			]
]

{ #category : #rules }
PPEsopeRewriter >> segini [
	" beginOfLine , spaces, 'segsup' asPParser, spaces , comma, spaces, segname, endOfLine"

	^ super segini
		==> [ :nodes | stream << 'cESO  '.
				self copyLine: nodes from: 2 to: nodes size
			]
]

{ #category : #rules }
PPEsopeRewriter >> segsup [
	" beginOfLine, spaces, 'pointeur' asPParser, spaces, pointerName, endOfLine"

	^ super segsup
		==> [ :nodes | stream << 'cESO  '.
				self copyLine: nodes from: 2 to: nodes size
			]
]

{ #category : #rules }
PPEsopeRewriter >> unknownLine [
	"(lineEnd negate plus) token optional, lineEnd"
	
	^ super unknownLine
	==> [ :nodes |
			self copyLine: nodes from: 1 to: nodes size ]
]
