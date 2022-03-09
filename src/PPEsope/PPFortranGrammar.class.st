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
		'blockDataName',
		'arrayDeclaratorList',
		'arrayDeclarator',
		'variableName',
		'arraySpec',
		'explicitShapeSpecList',
		'assumedSizeSpec',
		'explicitShapeSpec',
		'lowerBound',
		'upperBound',
		'expr',
		'equivalenceSetList',
		'equivalenceSet',
		'equivalenceObject',
		'equivalenceObjectList',
		'comma',
		'variable',
		'comlist',
		'comblock',
		'commonBlockObject',
		'spoff',
		'spon',
		'commonBlockName',
		'entityDeclList',
		'lengthSelector',
		'entityDecl',
		'objectName',
		'charLength',
		'implicitSpecList',
		'implicitSpec',
		'implicitRanges',
		'implicitRange',
		'typeParamValue',
		'constant',
		'namedConstantDefList',
		'namedConstantDef',
		'namedConstant',
		'externalNameList',
		'externalName',
		'intrinsicList',
		'intrinsicProcedureName',
		'savedEntityList',
		'savedEntity',
		'savedCommonBlock',
		'datalist',
		'dataStmtSet',
		'dataStmtObjectList',
		'dataStmtValueList',
		'dataStmtObject',
		'dataImpliesdDo',
		'dataStmtValue',
		'namedConstantUse',
		'dataIDoObjectList',
		'impliedDoVariable',
		'dataIDoObject',
		'arrayElement',
		'dataImpliedDo',
		'sfExprListRef',
		'substringRange',
		'sfExprList',
		'commaSectionSubscript',
		'sectionSubscript',
		'lblRef',
		'goToKw',
		'lblRefList',
		'label',
		'variableComma',
		'ifThenStmt',
		'conditionalBody',
		'elseIfConstruct',
		'elseConstruct',
		'endIfStmt',
		'elseIfStmt',
		'elseStmt',
		'executionPartConstruct',
		'in2',
		'ex2',
		'labelDoStmt',
		'doLblRef',
		'commaLoopControl',
		'doLblDef',
		'doLabelStmt',
		'loopControl',
		'icon',
		'tab2',
		'tab9',
		'commaExpr',
		'iconOrScon',
		'ioControlSpecList',
		'outputItemList',
		'rdCtlSpec',
		'inputItemList',
		'rdFmtId',
		'commaInputItemList',
		'rdUnitId',
		'rdIoCtlSpecList',
		'uFExpr'
	],
	#category : #'PPEsope-Parser'
}

{ #category : #accessing }
PPFortranGrammar >> BlockDataStmt [
	^ lblDef, 'blockdata' asPParser, blockDataName optional, eos
]

{ #category : #accessing }
PPFortranGrammar >> CharLength [
	^ (lpar, typeParamValue, rpar) / constant
]

{ #category : #accessing }
PPFortranGrammar >> DoubleDoStmt [
	^ 'do' asPParser, lblRef, commaLoopControl, eos
]

{ #category : #accessing }
PPFortranGrammar >> TypeDeclarationStmt [
	^ lblDef, typeSpec, entityDeclList, eos
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
PPFortranGrammar >> arithmeticIfStmt [
	^ lblDef, 'if' asPParser, lpar, expr, rpar, lblRef, comma, lblRef, comma, lblRef, eos
]

{ #category : #accessing }
PPFortranGrammar >> arrayDeclarator [
	^ variableName, lpar, arraySpec, rpar
]

{ #category : #accessing }
PPFortranGrammar >> arrayDeclaratorList [
	^ arrayDeclarator plus
]

{ #category : #accessing }
PPFortranGrammar >> arraySpec [
	^ explicitShapeSpecList / assumedSizeSpec
]

{ #category : #accessing }
PPFortranGrammar >> assignStmt [
	^ lblDef, 'assign' asPParser, lblRef, 'to' asPParser, variableName, eos
]

{ #category : #accessing }
PPFortranGrammar >> assignedGotoStmt [
	^ (lblDef, goToKw, variableName, eos) /
	(lblDef, goToKw, variableName , lpar, lblRefList, rpar, eos) /
	(lblDef, goToKw, variableComma, lpar, lblRefList, rpar, eos)
]

{ #category : #accessing }
PPFortranGrammar >> assignmentStmt [
	^ lblDef, name, sfExprListRef optional, substringRange optional, $= asPParser, expr, eos
]

{ #category : #accessing }
PPFortranGrammar >> assumedSizeSpec [
	^ $* asPParser /
	(lowerBound, $: asPParser,  $* asPParser) /
	(explicitShapeSpecList, $, asPParser, $*) /
	(explicitShapeSpecList, $, asPParser, lowerBound, $: asPParser, $* asPParser)
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
PPFortranGrammar >> comblock [
	^ ($/ asPParser, spoff, $/ asPParser,  spon) / ($/ asPParser, commonBlockName, $/ asPParser)
]

{ #category : #accessing }
PPFortranGrammar >> comlist [
	^ (comblock optional, commonBlockObject) / 
	(comlist, comma,  comblock optional, commonBlockObject) /
	(comlist, comblock, commonBlockObject)
]

{ #category : #accessing }
PPFortranGrammar >> comma [
	^ $, asPParser
]

{ #category : #accessing }
PPFortranGrammar >> commaInputItemList [
	^ comma, inputItemList
]

{ #category : #accessing }
PPFortranGrammar >> commaLoopControl [
	^ comma optional, loopControl
]

{ #category : #accessing }
PPFortranGrammar >> commaSectionSubscript [
	^ comma, sectionSubscript
]

{ #category : #accessing }
PPFortranGrammar >> commentOrNewLine [
	^ comment / newLine
]

{ #category : #accessing }
PPFortranGrammar >> commonBlockObject [
	^ variableName / arrayDeclarator
]

{ #category : #accessing }
PPFortranGrammar >> commonStmt [
	^ lblDef, 'common' asPParser, comlist, eos
]

{ #category : #accessing }
PPFortranGrammar >> computedGotoStmt [
	^ lblDef, goToKw, lpar, lblRefList, rpar, comma optional, expr, eos
]

{ #category : #accessing }
PPFortranGrammar >> conditionalBody [
	^ executionPartConstruct star
]

{ #category : #accessing }
PPFortranGrammar >> continueStmt [
	^ lblDef, 'continue' asPParser, eos
]

{ #category : #accessing }
PPFortranGrammar >> dataIDoObject [
	^ arrayElement / dataImpliedDo
]

{ #category : #accessing }
PPFortranGrammar >> dataIDoObjectList [
	^ dataIDoObject plus
]

{ #category : #accessing }
PPFortranGrammar >> dataImpliedDo [
	^ (lpar, dataIDoObjectList, $, asPParser, impliedDoVariable, $= asPParser, expr, $, asPParser, expr, rpar) /
	(lpar, dataIDoObjectList, comma, impliedDoVariable, $= asPParser, expr, comma, expr, comma, expr, rpar)
]

{ #category : #accessing }
PPFortranGrammar >> dataStmt [
	^ lblDef, 'data' asPParser, datalist, eos
]

{ #category : #accessing }
PPFortranGrammar >> dataStmtObject [
	^ variable / dataImpliesdDo
]

{ #category : #accessing }
PPFortranGrammar >> dataStmtObjectList [
	^ dataStmtObject plus
]

{ #category : #accessing }
PPFortranGrammar >> dataStmtSet [
	^ dataStmtObjectList, $/ asPParser, dataStmtValueList, $/ asPParser
]

{ #category : #accessing }
PPFortranGrammar >> dataStmtValue [
	^ constant /
	(constant, $* asPParser, constant) /
	(namedConstantUse, $* asPParser, constant)
]

{ #category : #accessing }
PPFortranGrammar >> dataStmtValueList [
	^ dataStmtValue plus
]

{ #category : #accessing }
PPFortranGrammar >> datalist [
	^ dataStmtSet /
	(datalist optional , comma optional, dataStmtSet)
]

{ #category : #accessing }
PPFortranGrammar >> declarationConstruct [
	^ typeDeclarationStmt / specificationStmt
]

{ #category : #accessing }
PPFortranGrammar >> dimensionStmt [
	^ lblDef, 'dimension' asPParser, arrayDeclaratorList, eos
]

{ #category : #accessing }
PPFortranGrammar >> doConstruct [
	^ labelDoStmt
]

{ #category : #accessing }
PPFortranGrammar >> doLabelStmt [
	^ actionStmt
]

{ #category : #accessing }
PPFortranGrammar >> doLblDef [
	^ tab2, icon, tab9
]

{ #category : #accessing }
PPFortranGrammar >> doLblRef [
	^ icon
]

{ #category : #accessing }
PPFortranGrammar >> elseConstruct [
	^ elseStmt, conditionalBody
]

{ #category : #accessing }
PPFortranGrammar >> elseIfConstruct [
	^ elseIfStmt, conditionalBody
]

{ #category : #accessing }
PPFortranGrammar >> elseIfStmt [
	^ lblDef, ex2, 'elseif' asPParser, lpar, expr, rpar, 'then', eos, in2
]

{ #category : #accessing }
PPFortranGrammar >> elseStmt [
	^ lblDef, ex2, 'else' asPParser, eos, in2
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
PPFortranGrammar >> endIfStmt [
	^ lblDef, ex2, 'endif' asPParser, eos
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
PPFortranGrammar >> entityDecl [
	^ objectName /
	(objectName, lpar, arraySpec, rpar) /
	(objectName, $* asPParser, charLength) /
	(objectName , lpar, arraySpec, rpar, $* asPParser, charLength) 
]

{ #category : #accessing }
PPFortranGrammar >> entityDeclList [
	^ entityDecl plus
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
PPFortranGrammar >> equivalenceObject [
	^ variable
]

{ #category : #accessing }
PPFortranGrammar >> equivalenceObjectList [
	^ equivalenceObject plus
]

{ #category : #accessing }
PPFortranGrammar >> equivalenceSet [
	^ lpar, equivalenceObject, comma, equivalenceObjectList, rpar
]

{ #category : #accessing }
PPFortranGrammar >> equivalenceSetList [
	^ equivalenceSet plus
]

{ #category : #accessing }
PPFortranGrammar >> equivalenceStmt [
	^ lblDef, 'equivalence' asPParser, equivalenceSetList, eos
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
PPFortranGrammar >> explicitShapeSpec [
	^ (lowerBound, $: asPParser, upperBound) / upperBound
]

{ #category : #accessing }
PPFortranGrammar >> explicitShapeSpecList [
	^ explicitShapeSpec plus
]

{ #category : #accessing }
PPFortranGrammar >> externalNameList [
	^ externalName plus
]

{ #category : #accessing }
PPFortranGrammar >> externalStmt [
	^ lblDef, 'external' asPParser, externalNameList, eos
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
PPFortranGrammar >> goToKw [
	^ 'goto' asPParser
]

{ #category : #accessing }
PPFortranGrammar >> gotoStmt [
	^ lblDef, goToKw, lblRef, eos
]

{ #category : #accessing }
PPFortranGrammar >> iconOrScon [
	^ icon / scon
]

{ #category : #accessing }
PPFortranGrammar >> ident [
	^ id
]

{ #category : #accessing }
PPFortranGrammar >> ifConstruct [
	^ ifThenStmt, conditionalBody, elseIfConstruct optional, elseConstruct optional, endIfStmt
]

{ #category : #accessing }
PPFortranGrammar >> ifStmt [
	^ lblDef, 'if' asPParser, lpar, expr, rpar, actionStmt
]

{ #category : #accessing }
PPFortranGrammar >> ifThenStmt [
	^ lblDef, 'if' asPParser, lpar, expr, rpar, 'then' asPParser, eos, in2
]

{ #category : #accessing }
PPFortranGrammar >> implicitRange [
	^ ident, $- asPParser, ident
]

{ #category : #accessing }
PPFortranGrammar >> implicitRanges [
	^ (implicitRange, comma) star
]

{ #category : #accessing }
PPFortranGrammar >> implicitSpec [
	^ (typeSpec, implicitRanges) /
	(typeSpec, lpar, implicitRanges, rpar)
]

{ #category : #accessing }
PPFortranGrammar >> implicitSpecList [
	^ implicitSpec plus
]

{ #category : #accessing }
PPFortranGrammar >> implicitStmt [
	^ lblDef, 'implicit' asPParser, implicitSpecList, eos
]

{ #category : #accessing }
PPFortranGrammar >> includeStmt [
	^ 'include' asPParser, scon, eos
]

{ #category : #accessing }
PPFortranGrammar >> intrinsicList [
	^ intrinsicProcedureName plus
]

{ #category : #accessing }
PPFortranGrammar >> intrinsicStmt [
	^ lblDef, 'intrinsic' asPParser, intrinsicList, eos
]

{ #category : #accessing }
PPFortranGrammar >> labelDoStmt [
	^ lblDef, 'do' asPParser, doLblRef, commaLoopControl, eos, in2, executionPartConstruct star, ex2, doLblDef, doLabelStmt
]

{ #category : #accessing }
PPFortranGrammar >> lblRef [
	^ label
]

{ #category : #accessing }
PPFortranGrammar >> lblRefList [
	^ lblRef plus
]

{ #category : #accessing }
PPFortranGrammar >> lengthSelector [
	^ $* asPParser, charLength
]

{ #category : #accessing }
PPFortranGrammar >> loopControl [
	^ variableName, $= asPParser, expr, comma, expr, commaExpr optional
]

{ #category : #accessing }
PPFortranGrammar >> lowerBound [
	^ expr
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
PPFortranGrammar >> namedConstant [
	^ ident
]

{ #category : #accessing }
PPFortranGrammar >> namedConstantDef [
	^ namedConstant, $= asPParser, expr
]

{ #category : #accessing }
PPFortranGrammar >> namedConstantDefList [
	^ namedConstantDef plus
]

{ #category : #accessing }
PPFortranGrammar >> namedConstantUse [
	^ ident
]

{ #category : #accessing }
PPFortranGrammar >> parameterStmt [
	^ lblDef, 'parameter' asPParser, lpar, namedConstantDefList, rpar, eos
]

{ #category : #accessing }
PPFortranGrammar >> pauseStmt [
	^ lblDef, 'pause' asPParser, iconOrScon optional, eos
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
PPFortranGrammar >> rdCtlSpec [
	^ rdUnitId / (lpar, rdIoCtlSpecList rpar)
]

{ #category : #accessing }
PPFortranGrammar >> rdUnitId [
	^ (lpar, uFExpr, rpar) / (lpar, $* asPParser, rpar)
]

{ #category : #accessing }
PPFortranGrammar >> readStmt [
	^ (lblDef, 'read' asPParser, rdCtlSpec, inputItemList optional, eos) /
	(lblDef, 'read' asPParser, rdFmtId, commaInputItemList optional, eos)
]

{ #category : #accessing }
PPFortranGrammar >> rpar [
	^ $) asPParser
]

{ #category : #accessing }
PPFortranGrammar >> saveStmt [
	^ (lblDef, 'save' asPParser, eos) /
	(lblDef, 'save' asPParser, savedEntityList, eos)
]

{ #category : #accessing }
PPFortranGrammar >> savedCommonBlock [
	^ $/ asPParser, commonBlockName, $/ asPParser
]

{ #category : #accessing }
PPFortranGrammar >> savedEntity [
	^ variableName / savedCommonBlock
]

{ #category : #accessing }
PPFortranGrammar >> savedEntityList [
	^ savedEntity plus
]

{ #category : #accessing }
PPFortranGrammar >> sfExprList [
	^ (expr, $: asPParser optional, expr optional) / ($: asPParser, expr optional)
]

{ #category : #accessing }
PPFortranGrammar >> sfExprListRef [
	^ lpar, sfExprList, commaSectionSubscript star, rpar
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
PPFortranGrammar >> stopStmt [
	^ lblDef, 'stop' asPParser, iconOrScon optional, eos
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

{ #category : #accessing }
PPFortranGrammar >> typeParamValue [
	^ expr / $* asPParser 
]

{ #category : #accessing }
PPFortranGrammar >> typeSpec [
	^ 'integer' asPParser /
	'real' asPParser /
	'doubleprecision' asPParser /
	'complex' asPParser /
	'logical' asPParser /
	'character' asPParser /
	('character', lengthSelector)
]

{ #category : #accessing }
PPFortranGrammar >> upperBound [
	^ expr
]

{ #category : #accessing }
PPFortranGrammar >> variableComma [
	^ variableName, comma
]

{ #category : #accessing }
PPFortranGrammar >> writeStmt [
	^ lblDef, 'write' asPParser, lpar, ioControlSpecList, rpar, outputItemList optional, eos
]
