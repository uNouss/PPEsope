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

{ #category : #accessing }
PPEsopeRewriter >> endOfLine [
	"(Character cr asPParser / Character lf asPParser)  plus"
	
	^ super endOfLine
	==> [ :nodes | String streamContents: [ :str | nodes do: [ :c | str nextPut: c ] ] ]
]

{ #category : #utilities }
PPEsopeRewriter >> esopeLine: nodes [
	2 to: nodes size do: [ :i | stream << (nodes at: i) value ]
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

{ #category : #utilities }
PPEsopeRewriter >> insideSegment: anOrderedCollection [
	anOrderedCollection do: [ :line |
			stream << 'cESO  ';
					 << line second;
					 << line third;
					 << line fourth.
		 ]
]

{ #category : #accessing }
PPEsopeRewriter >> output [
	^ stream contents.
]

{ #category : #rules }
PPEsopeRewriter >> pointer [
	" beginOfLine, 'pointeur' asPParser, spaces, pointerName, endOfLine"

	^ super pointer
		==> [ :nodes | stream << 'cESO  '.
				self esopeLine: nodes
			]
]

{ #category : #rules }
PPEsopeRewriter >> segact [
	" beginOfLine, 'segact' asPParser, spaces , comma, spaces, segname, endOfLine"

	^ super segact
		==> [ :nodes | stream << 'cESO  '.
				self esopeLine: nodes
			]
]

{ #category : #rules }
PPEsopeRewriter >> segadj [
	" beginOfLine, 'segadj' asPParser, spaces , comma, spaces, segname, endOfLine"

	^ super segadj
		==> [ :nodes | stream << 'cESO  '.
				self esopeLine: nodes
			]
]

{ #category : #rules }
PPEsopeRewriter >> segdef [
	" beginOfLine, ('segment' asPParser, spaces, comma, segname) token, endOfLine,
	lines,
	beginOfLine, ('end' asPParser , spaces, 'segment' asPParser) token, endOfLine"
	
	^ super segdef
	==> [ :nodes | 1halt.
		stream << 'cESO  ';
				 << nodes second value;
				 << nodes third value.
		self insideSegment: nodes fourth.
		stream << 'cESO  ';
				 << nodes fifth value;
				 << nodes sixth value;
			    << nodes seventh value.
		]
]

{ #category : #rules }
PPEsopeRewriter >> segdes [
	" beginOfLine, 'segact' asPParser, spaces , comma, spaces, segname, endOfLine"

	^ super segdes
		==> [ :nodes | stream << 'cESO  '.
				self esopeLine: nodes
			]
]

{ #category : #rules }
PPEsopeRewriter >> segini [
	" beginOfLine , 'segsup' asPParser, spaces , comma, spaces, segname, endOfLine"

	^ super segini
		==> [ :nodes | stream << 'cESO  '.
				self esopeLine: nodes
			]
]

{ #category : #rules }
PPEsopeRewriter >> segsup [
	" beginOfLine, 'pointeur' asPParser, spaces, pointerName, endOfLine"

	^ super segsup
		==> [ :nodes | stream << 'cESO  '.
				self esopeLine: nodes
			]
]

{ #category : #rules }
PPEsopeRewriter >> unknownLine [
	"(lineEnd negate plus) token optional, lineEnd"
	
	^ super unknownLine
	==> [ :nodes |
			nodes do: [ :node | stream << node value ] ]
]
