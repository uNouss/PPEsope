Class {
	#name : #PPFortranGrammar,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'ident',
		'id',
		'commentOrNewLine',
		'comment',
		'newLine',
		'in6',
		'executableProgram',
		'ex6',
		'programUnit',
		'mainProgram',
		'functionSubProgram',
		'subroutineSubProgram',
		'blockDataSubProgram',
		'programStmt',
		'mainRange',
		'body',
		'endProgramStmt',
		'lblDef',
		'eos',
		'bodyConstruct',
		'specificationPartConstruct',
		'executableConstruct',
		'implicitStmt',
		'parameterStmt',
		'formatStmt',
		'entryStmt',
		'declarationConstruct',
		'includeStmt',
		'scon',
		'typeDeclarationStmt',
		'specificationStmt',
		'functionPrefix',
		'functionName',
		'functionRange',
		'functionParList',
		'endFunctionStmt',
		'subroutineName',
		'subroutineRange',
		'subroutineParList',
		'endSubroutineStmt',
		'blockDataStmt',
		'blockDataBody',
		'endBlockDataStmt',
		'blockDataBodyConstruct',
		'comonStmt',
		'dataStmt',
		'dimensionStmt',
		'equivalenceStmt',
		'externalStmt',
		'intrinsicStmt',
		'saveStmt',
		'actionStmt',
		'doConstruct',
		'ifConstruct',
		'arithmeticIfStmt',
		'assignmentStmt',
		'assignStmt',
		'backspaceStmt',
		'callStmt',
		'closeStmt',
		'continueStmt',
		'endfileStmt',
		'gotoStmt',
		'computedGotoStmt',
		'assignedGotoStmt',
		'ifStmt',
		'inquireStmt',
		'openStmt',
		'pauseStmt',
		'printStmt',
		'readStmt',
		'returnStmt',
		'rewindStmt',
		'stmtFunctionStmt',
		'stopStmt',
		'writeStmt',
		'programName',
		'typeSpec',
		'functionPars',
		'epsilon',
		'functionPar',
		'dummyArgName',
		'lpar',
		'subroutinePars',
		'rpar',
		'subroutinePar',
		'entryName',
		'name',
		'blockDataName'
	],
	#category : #'PPEsope-Parser'
}

{ #category : #accessing }
PPFortranGrammar >> BlockDataStmt [
	^ lblDef, 'blockdata' asPParser, blockDataName optional, eos
]

{ #category : #accessing }
PPFortranGrammar >> actionStmt [
	^ arithmeticIfStmt /
	assignmentStmt /
	assignStmt /
	backspaceStmt /
	callStmt /
	closeStmt /
	continueStmt /
	endfileStmt /
	gotoStmt /
	computedGotoStmt /
	assignedGotoStmt /
	ifStmt /
	inquireStmt /
	openStmt /
	pauseStmt /
	printStmt /
	readStmt /
	returnStmt /
	rewindStmt /
	stmtFunctionStmt /
	stopStmt /
	writeStmt
]

{ #category : #accessing }
PPFortranGrammar >> blockDataBody [
	^ blockDataBodyConstruct / (blockDataBody, blockDataBodyConstruct)
]

{ #category : #accessing }
PPFortranGrammar >> blockDataBodyConstruct [
	^ specificationPartConstruct
]

{ #category : #accessing }
PPFortranGrammar >> blockDataSubprogram [
	^ blockDataStmt, blockDataBody, endBlockDataStmt /
		blockDataStmt, endBlockDataStmt
]

{ #category : #accessing }
PPFortranGrammar >> body [
	^ bodyConstruct plus
]

{ #category : #accessing }
PPFortranGrammar >> bodyConstruct [
	^ specificationPartConstruct / executableConstruct
]

{ #category : #accessing }
PPFortranGrammar >> commentOrNewLine [
	^ comment / newLine
]

{ #category : #accessing }
PPFortranGrammar >> declarationConstruct [
	^ typeDeclarationStmt / specificationStmt
]

{ #category : #accessing }
PPFortranGrammar >> endBlockDataStmt [
	^ lblDef, 'end' asPParser, eos
]

{ #category : #accessing }
PPFortranGrammar >> endFunctionStmt [
	^ lblDef, 'end' asPParser, eos
]

{ #category : #accessing }
PPFortranGrammar >> endProgramStmt [
	^ lblDef, 'end', eos
]

{ #category : #accessing }
PPFortranGrammar >> endSubroutineStmt [
	^ lblDef, 'end' asPParser, eos
]

{ #category : #accessing }
PPFortranGrammar >> entryStmt [
	^ lblDef, 'entry' asPParser, entryName, subroutineParList, 'result' asPParser, lpar, name, rpar, eos
]

{ #category : #accessing }
PPFortranGrammar >> eos [
	^ commentOrNewLine, commentOrNewLine star
]

{ #category : #accessing }
PPFortranGrammar >> executableConstruct [
	^ actionStmt / doConstruct / ifConstruct
]

{ #category : #accessing }
PPFortranGrammar >> executableProgram [
	^ programUnit plus
]

{ #category : #accessing }
PPFortranGrammar >> executionPartConstruct [
	^ executableConstruct / formatStmt / dataStmt / entryStmt 
]

{ #category : #accessing }
PPFortranGrammar >> functionPar [
	^ dummyArgName
]

{ #category : #accessing }
PPFortranGrammar >> functionParList [
	^ (lpar, functionPars, rpar) /
	epsilon
]

{ #category : #accessing }
PPFortranGrammar >> functionPars [
	^ (functionPar, $, asPParser) star
]

{ #category : #accessing }
PPFortranGrammar >> functionPrefix [
	^ 'function' asPParser / 
	typeSpec,  'function' asPParser
]

{ #category : #accessing }
PPFortranGrammar >> functionRange [
	^ functionParList, eos, body optional, endFunctionStmt
]

{ #category : #accessing }
PPFortranGrammar >> functionSubprogram [
	^ lblDef, functionPrefix, functionName, functionRange
]

{ #category : #accessing }
PPFortranGrammar >> ident [
	^ id
]

{ #category : #accessing }
PPFortranGrammar >> includeStmt [
	^ 'include' asPParser, scon, eos
]

{ #category : #accessing }
PPFortranGrammar >> lpar [
	^ $( asPParser
]

{ #category : #accessing }
PPFortranGrammar >> mainProgram [
	^ programStmt optional, mainRange
]

{ #category : #accessing }
PPFortranGrammar >> mainRange [
	^ body optional, endProgramStmt
]

{ #category : #accessing }
PPFortranGrammar >> program [
	^ in6, commentOrNewLine star, executableProgram, commentOrNewLine star, ex6
]

{ #category : #accessing }
PPFortranGrammar >> programStmt [
	^ lblDef,  'program' asPParser,  programName, eos
]

{ #category : #accessing }
PPFortranGrammar >> programUnit [
	^ mainProgram / functionSubProgram / subroutineSubProgram / blockDataSubProgram
]

{ #category : #accessing }
PPFortranGrammar >> rpar [
	^ $) asPParser
]

{ #category : #accessing }
PPFortranGrammar >> specificaitonStmt [
	^ comonStmt / dataStmt / dimensionStmt / equivalenceStmt / externalStmt / intrinsicStmt / saveStmt
]

{ #category : #accessing }
PPFortranGrammar >> specificationPartConstruct [
	^ implicitStmt / parameterStmt / formatStmt / entryStmt / declarationConstruct / includeStmt
]

{ #category : #accessing }
PPFortranGrammar >> start [
	"Answer the production to start this parser with."
	
	^ ident end
]

{ #category : #accessing }
PPFortranGrammar >> subroutinePar [
	^ dummyArgName / $* asPParser
]

{ #category : #accessing }
PPFortranGrammar >> subroutineParList [
	^ (lpar, subroutinePars, rpar) / epsilon
]

{ #category : #accessing }
PPFortranGrammar >> subroutinePars [
	^ (subroutinePar, $, asPParser) star
]

{ #category : #accessing }
PPFortranGrammar >> subroutineRange [
	^ subroutineParList, eos, body optional, endSubroutineStmt
]

{ #category : #accessing }
PPFortranGrammar >> subroutineSubprogram [
	^ lblDef , 'subroutine' asPParser, subroutineName, subroutineRange
]
