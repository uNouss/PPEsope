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

{ #category : #regex }
PPEsopeRewriter class >> regexForEsopeWithArray [
	^ '([a-zA-Z0-9]+\.[a-zA-Z0-9]+)\(([a-zA-Z0-9.]+)\)' asRegexIgnoringCase
]

{ #category : #regex }
PPEsopeRewriter class >> regexForEsopeWithDot [
	^ '[a-zA-Z0-9]+\.[a-zA-Z0-9]+' asRegexIgnoringCase
]

{ #category : #regex }
PPEsopeRewriter class >> regexForEsopeWithSlash [
	^ '[a-zA-Z0-9.]+\(/[0-9]+\)' asRegexIgnoringCase
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

{ #category : #rules }
PPEsopeRewriter >> fortranLine [
	"(lineEnd negate plus) token optional, lineEnd"

	^ super fortranLine
		==> [ :nodes | 
			| line |
			line := ''
				writeStreamDo: [ :str | 
					nodes do: [ :node | str << node value ].
					str contents ].
			(line asLowercase beginsWith: 'c')
				ifTrue: [ stream << line ]
				ifFalse: [ stream
						<<
							(self
								translateEsopeAt: (self translateEsopeArray: (self translateEsopeSlash: line))) ] ]
				
]

{ #category : #utilities }
PPEsopeRewriter >> fortranOperator: esopeAtIdentifier [ 
	| uppercaseIdentifier |
	uppercaseIdentifier := esopeAtIdentifier asUppercase.
	^ #('.EQ.' '.LT.' '.LE.' '.GT.' '.GE.' '.NE.' '.OR.' '.AND.' '.NOT.' '.TRUE.' '.FALSE.' '.EQV.' '.NEQV.')
		anySatisfy: [ :operator | 
			(uppercaseIdentifier beginsWith: operator)
				or: [ uppercaseIdentifier endsWith: operator ] ]
]

{ #category : #utilities }
PPEsopeRewriter >> fortranOperator: esopeAtIdentifier from: start to: end [
	| uppercaseIdentifier |
	start <= 1
		ifTrue: [ ^ false ].
	end >= esopeAtIdentifier size
		ifTrue: [ ^ false ].

	uppercaseIdentifier := (esopeAtIdentifier copyFrom: start -1 to: end + 1) asUppercase.
	^ #('.EQ.' '.LT.' '.LE.' '.GT.' '.GE.' '.NE.' '.OR.' '.AND.' '.NOT.' '.TRUE.' '.FALSE.' '.EQV.' '.NEQV.')
		anySatisfy: [ :operator | 
			(uppercaseIdentifier beginsWith: operator)
				or: [ uppercaseIdentifier endsWith: operator ] ]
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
	"beginOfLine, spaces, 'segact' asPParser, segIdentifier, endOfLine"

	^ super segact
		==> [ :nodes | stream << 'cESO  '.
				self copyLine: nodes from: 2 to: nodes size
			]
]

{ #category : #rules }
PPEsopeRewriter >> segadj [
	"beginOfLine, spaces, 'segadj' asPParser, segIdentifier, endOfLine"

	^ super segadj
		==> [ :nodes | stream << 'cESO  '.
				self copyLine: nodes from: 2 to: nodes size
			]
]

{ #category : #rules }
PPEsopeRewriter >> segdef [
	"beginOfLine, spaces, 'segment' asPParser, segIdentifier, endOfLine,
	lines,
	beginOfLine, spaces, 'end' asPParser , spaces, 'segment' asPParser, endOfLine"
	
	^ super segdef
	==> [ :nodes |
		stream << 'cESO  '.
		self copyLine: nodes from: 2 to: 5.
		self processLinesInsideSegment: (nodes at: 6).
		stream << 'cESO  '.
		self copyLine: nodes from: 8  to: 12
		]
]

{ #category : #rules }
PPEsopeRewriter >> segdes [
	" beginOfLine, spaces, 'segdes' asPParser, segIdentifier, endOfLine"

	^ super segdes
		==> [ :nodes | stream << 'cESO  '.
				self copyLine: nodes from: 2 to: nodes size
			]
]

{ #category : #rules }
PPEsopeRewriter >> segini [
	" beginOfLine, spaces, 'segini' asPParser, segIdentifier, endOfLine"

	^ super segini
		==> [ :nodes | stream << 'cESO  '.
				self copyLine: nodes from: 2 to: nodes size
			]
]

{ #category : #rules }
PPEsopeRewriter >> segsup [
	" beginOfLine , spaces, 'segsup' asPParser, segIdentifier, endOfLine"

	^ super segsup
		==> [ :nodes | stream << 'cESO  '.
				self copyLine: nodes from: 2 to: nodes size
			]
]

{ #category : #utilities }
PPEsopeRewriter >> translateEsopeArray: inputStream [
	| regex i |
	i := 1.
	''
		writeStreamDo: [ :outputStream | 
			regex := self class regexForEsopeWithArray.
			(regex matchingRangesIn: inputStream)
				do: [ :interval | 
					(self
						fortranOperator: inputStream
						from: interval first
						to: interval last)
						ifFalse:
							[ i to: interval first - 1 do: [ :idx | outputStream nextPut: (inputStream at: idx) ].
							outputStream << 'ESOar('.
							i := interval first.
							[ (inputStream at: i) == $( ]
								whileFalse: [ outputStream nextPut: (inputStream at: i).
									i := i + 1 ].
							outputStream nextPut: $,.
							[ (inputStream at: i) == $) ]
								whileFalse: [ outputStream nextPut: (inputStream at: i + 1).
									i := i + 1 ].
							i + 1 to: interval last do: [ :idx | outputStream nextPut: (inputStream at: idx) ].
							i := interval last + 1 ] ].
			i to: inputStream size do: [ :idx | outputStream nextPut: (inputStream at: idx) ].
			^ outputStream contents ]
]

{ #category : #utilities }
PPEsopeRewriter >> translateEsopeAt: inputStream [
	| regex i |
	i := 1.
	''
		writeStreamDo: [ :outputStream | 
			regex := self class regexForEsopeWithDot.
			(regex matchingRangesIn: inputStream)
				do: [ :interval | 
					(self
						fortranOperator: inputStream from: interval first to: interval last)
						ifFalse:
							[ i to: interval first - 1 do: [ :idx | outputStream nextPut: (inputStream at: idx) ].
							outputStream << 'ESOat('.
							i := interval first.
							[ (inputStream at: i) == $. ]
								whileFalse: [ outputStream nextPut: (inputStream at: i).
									i := i + 1 ].
							outputStream nextPut: $,.
							i + 1 to: interval last do: [ :idx | outputStream nextPut: (inputStream at: idx) ].
							outputStream nextPut: $).
							i := interval last + 1 ] ].
			i to: inputStream size do: [ :idx | outputStream nextPut: (inputStream at: idx) ].
			^ outputStream contents ]
]

{ #category : #utilities }
PPEsopeRewriter >> translateEsopeSlash: inputStream [
	| regex i |
	i := 1.
	''
		writeStreamDo: [ :outputStream | 
			regex := self class regexForEsopeWithSlash.
			(regex matchingRangesIn: inputStream)
				do: [ :interval | 
					i to: interval first - 1 do: [ :idx | outputStream nextPut: (inputStream at: idx) ].
					outputStream << 'ESOsl('.
					i := interval first.
					[ (inputStream at: i) == $( ]
						whileFalse: [ outputStream nextPut: (inputStream at: i).
							i := i + 1 ].
					outputStream nextPut: $,.
					i + 2 to: interval last do: [ :idx | outputStream nextPut: (inputStream at: idx) ].
					i := interval last + 1 ].
			i to: inputStream size do: [ :idx | outputStream nextPut: (inputStream at: idx) ].
			^ outputStream contents]
]
