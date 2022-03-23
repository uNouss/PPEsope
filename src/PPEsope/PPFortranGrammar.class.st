Class {
	#name : #PPFortranGrammar,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'actionStmt',
		'arithmeticIfStmt',
		'arrayDeclarator',
		'arrayDeclaratorList',
		'arrayElement',
		'arraySpec',
		'assignStmt',
		'assignedGotoStmt',
		'assignmentStmt',
		'assumedSizeSpec',
		'backspaceStmt',
		'blockDataBody',
		'blockDataBodyConstruct',
		'blockDataName',
		'blockDataStmt',
		'blockDataSubProgram',
		'blockDataSubprogram',
		'body',
		'bodyConstruct',
		'callStmt',
		'charLength',
		'closeStmt',
		'comblock',
		'comlist',
		'comma',
		'commaExpr',
		'commaInputItemList',
		'commaLoopControl',
		'commaSectionSubscript',
		'comment',
		'commentOrNewLine',
		'commonBlockName',
		'commonBlockObject',
		'comonStmt',
		'computedGotoStmt',
		'conditionalBody',
		'constant',
		'continueStmt',
		'dataIDoObject',
		'dataIDoObjectList',
		'dataImpliedDo',
		'dataImpliesdDo',
		'dataStmt',
		'dataStmtObject',
		'dataStmtObjectList',
		'dataStmtSet',
		'dataStmtValue',
		'dataStmtValueList',
		'datalist',
		'declarationConstruct',
		'dimensionStmt',
		'doConstruct',
		'doLabelStmt',
		'doLblDef',
		'doLblRef',
		'dummyArgName',
		'elseConstruct',
		'elseIfConstruct',
		'elseIfStmt',
		'elseStmt',
		'endBlockDataStmt',
		'endFunctionStmt',
		'endIfStmt',
		'endProgramStmt',
		'endSubroutineStmt',
		'endfileStmt',
		'entityDecl',
		'entityDeclList',
		'entryName',
		'entryStmt',
		'eos',
		'epsilon',
		'equivalenceObject',
		'equivalenceObjectList',
		'equivalenceSet',
		'equivalenceSetList',
		'equivalenceStmt',
		'ex6',
		'ex_2',
		'ex_6',
		'executableConstruct',
		'executableProgram',
		'executionPartConstruct',
		'explicitShapeSpec',
		'explicitShapeSpecList',
		'expr',
		'externalName',
		'externalNameList',
		'externalStmt',
		'formatStmt',
		'functionName',
		'functionPar',
		'functionParList',
		'functionPars',
		'functionPrefix',
		'functionRange',
		'functionSubProgram',
		'functionSubprogram',
		'gotoKw',
		'gotoStmt',
		'icon',
		'iconOrScon',
		'id',
		'ident',
		'ifConstruct',
		'ifStmt',
		'ifThenStmt',
		'implicitRange',
		'implicitRanges',
		'implicitSpec',
		'implicitSpecList',
		'implicitStmt',
		'impliedDoVariable',
		'in_2',
		'in_6',
		'includeStmt',
		'inputItemList',
		'inquireStmt',
		'intrinsicList',
		'intrinsicProcedureName',
		'intrinsicStmt',
		'ioControlSpecList',
		'label',
		'labelDoStmt',
		'lblDef',
		'lblRef',
		'lblRefList',
		'lengthSelector',
		'loopControl',
		'lowerBound',
		'lpar',
		'mainProgram',
		'mainRange',
		'name',
		'namedConstant',
		'namedConstantDef',
		'namedConstantDefList',
		'namedConstantUse',
		'newLine',
		'objectName',
		'openStmt',
		'outputItemList',
		'parameterStmt',
		'pauseStmt',
		'printStmt',
		'programName',
		'programStmt',
		'programUnit',
		'rdCtlSpec',
		'rdFmtId',
		'rdIoCtlSpecList',
		'rdUnitId',
		'readStmt',
		'returnStmt',
		'rewindStmt',
		'rpar',
		'saveStmt',
		'savedCommonBlock',
		'savedEntity',
		'savedEntityList',
		'scon',
		'sectionSubscript',
		'sfExprList',
		'sfExprListRef',
		'specificationPartConstruct',
		'specificationStmt',
		'spoff',
		'spon',
		'stmtFunctionStmt',
		'stopStmt',
		'subroutineName',
		'subroutinePar',
		'subroutineParList',
		'subroutinePars',
		'subroutineRange',
		'subroutineSubProgram',
		'subroutineSubprogram',
		'substringRange',
		'tab_2',
		'tab_9',
		'typeDeclarationStmt',
		'typeParamValue',
		'typeSpec',
		'uFExpr',
		'upperBound',
		'variable',
		'variableComma',
		'variableName',
		'writeStmt',
		'commonStmt',
		'comBlock',
		'unitIdentifier',
		'ioControlSpec',
		'formatIdentifier',
		'cOperand',
		'concatOp',
		'cPrimary',
		'rdFmtIdExpr',
		'scalarVariable',
		'inputItem',
		'nameDataRef',
		'inputImpliedDo',
		'outputItemList1',
		'outputImpliedDo',
		'connectSpecList',
		'unitIdentifierComma',
		'connectSpec',
		'cExpr',
		'closeSpecList',
		'closeSpec',
		'inquireSpecList',
		'inquireSpec',
		'positionSpecList',
		'positionSpec',
		'fmtSpec',
		'formatEdit',
		'formatSep',
		'editElement',
		'xcon',
		'pcon',
		'fcon',
		'mislexedFcon',
		'hcon',
		'rdcon',
		'stmtFunctionRange',
		'sfDummyArgNameList',
		'sfDummyArgName',
		'subroutineNameUse',
		'subroutineArgList',
		'subroutineArg',
		'complexDataRefTail',
		'sectionSubscriptRef',
		'sectionSubscriptList',
		'subscriptTripletTail',
		'level5Expr',
		'unsignedArithmeticConstant',
		'functionReference',
		'primary',
		'level1Expr',
		'powerUpMultOperand',
		'powerOp',
		'multOperand',
		'multOpMultOperand',
		'multOp',
		'sign',
		'addOperand',
		'addOpAddOperand',
		'addOp',
		'uFTerm',
		'uFFactor',
		'uFPrimary',
		'cPrimaryConcatOp',
		'level2Expr',
		'concatOpLevel2Expr'
	],
	#category : #'PPEsope-Parser'
}

{ #category : #rules }
PPFortranGrammar >> actionStmt [
	^ arithmeticIfStmt
	/ assignmentStmt
	/ assignStmt
	/ backspaceStmt
	/ callStmt
	/ closeStmt
	/ continueStmt
	/ endfileStmt
	/ gotoStmt
	/ computedGotoStmt
	/ assignedGotoStmt
	/ ifStmt
	/ inquireStmt
	/ openStmt
	/ pauseStmt
	/ printStmt
	/ readStmt
	/ returnStmt
	/ rewindStmt
	/ stmtFunctionStmt
	/ stopStmt
	/ writeStmt
]

{ #category : #rules }
PPFortranGrammar >> addOp [
	^ $+ asPParser
	/ $- asPParser
]

{ #category : #rules }
PPFortranGrammar >> addOpAddOperand [
	^ addOp, addOperand
]

{ #category : #rules }
PPFortranGrammar >> addOperand [
	^ multOperand, multOpMultOperand star
]

{ #category : #rules }
PPFortranGrammar >> arithmeticIfStmt [
	^ lblDef, 'if' asPParser, lpar,  expr, rpar, lblRef, comma, lblRef, comma, lblRef, eos
]

{ #category : #rules }
PPFortranGrammar >> arrayDeclarator [
	^ variableName, lpar,  arraySpec, rpar
]

{ #category : #rules }
PPFortranGrammar >> arrayDeclaratorList [
	^ arrayDeclarator plus
]

{ #category : #rules }
PPFortranGrammar >> arraySpec [
	^ explicitShapeSpecList
	/ assumedSizeSpec
]

{ #category : #rules }
PPFortranGrammar >> assignStmt [
	^ lblDef, 'assign' asPParser, lblRef, 'to' asPParser, variableName, eos
]

{ #category : #rules }
PPFortranGrammar >> assignedGotoStmt [
	^ (lblDef, gotoKw, variableName, eos)
	/ (lblDef, gotoKw, variableName, lpar,  lblRefList, rpar, eos)
	/ (lblDef, gotoKw, variableComma, lpar,  lblRefList, rpar, eos)
]

{ #category : #rules }
PPFortranGrammar >> assignmentStmt [
	^ lblDef, name, sfExprListRef optional, substringRange optional, $= asPParser, expr, eos
]

{ #category : #rules }
PPFortranGrammar >> assumedSizeSpec [
	^ $* asPParser
	/ (lowerBound, $: asPParser, $* asPParser)
	/ (explicitShapeSpecList, comma, $* asPParser)
	/ (explicitShapeSpecList, comma, lowerBound, $: asPParser, $* asPParser)
]

{ #category : #rules }
PPFortranGrammar >> backspaceStmt [
	^ (lblDef, 'backspace' asPParser, unitIdentifier, eos)
	/ (lblDef, 'backspace' asPParser, lpar,  positionSpecList, rpar, eos)
]

{ #category : #rules }
PPFortranGrammar >> blockDataBody [
	^ blockDataBodyConstruct
	/ (blockDataBody blockDataBodyConstruct)
]

{ #category : #rules }
PPFortranGrammar >> blockDataBodyConstruct [
	^ specificationPartConstruct
]

{ #category : #rules }
PPFortranGrammar >> blockDataStmt [
	^ lblDef, 'blockdata' asPParser, blockDataName optional, eos
]

{ #category : #rules }
PPFortranGrammar >> blockDataSubprogram [
	^ (blockDataStmt, blockDataBody, endBlockDataStmt)
	/ (blockDataStmt, endBlockDataStmt)
]

{ #category : #rules }
PPFortranGrammar >> body [
	^ bodyConstruct plus
]

{ #category : #rules }
PPFortranGrammar >> bodyConstruct [
	^ specificationPartConstruct / executableConstruct
]

{ #category : #rules }
PPFortranGrammar >> cExpr [
	^ cPrimary, cPrimaryConcatOp star
]

{ #category : #rules }
PPFortranGrammar >> cOperand [
	^ scon
	/ nameDataRef
	/ functionReference
]

{ #category : #rules }
PPFortranGrammar >> cPrimary [
	^ cOperand
	/ (lpar, cExpr, rpar)
]

{ #category : #rules }
PPFortranGrammar >> cPrimaryConcatOp [
	^ cPrimary, concatOp
]

{ #category : #rules }
PPFortranGrammar >> callStmt [
	^ (lblDef, 'call' asPParser, subroutineNameUse, eos)
	/ (lblDef, 'call' asPParser, subroutineNameUse, lpar,  subroutineArgList, rpar, eos)
]

{ #category : #rules }
PPFortranGrammar >> charLength [
	^ (lpar, typeParamValue, rpar)
	/ constant
]

{ #category : #rules }
PPFortranGrammar >> closeSpec [
	^ ('unit=' asPParser, unitIdentifier)
	/ ('err=' asPParser, lblRef)
	/ ('status=' asPParser, cExpr)
	/ ('iostat=' asPParser, scalarVariable)
]

{ #category : #rules }
PPFortranGrammar >> closeSpecList [
	^ unitIdentifierComma optional, (closeSpec, comma) star
]

{ #category : #rules }
PPFortranGrammar >> closeStmt [
	^ lblDef, 'close' asPParser, lpar,  closeSpecList, rpar, eos
]

{ #category : #rules }
PPFortranGrammar >> comBlock [
	^ ($/ asPParser, spoff, $/ asPParser, spon)
	/ ($/ asPParser, commonBlockName, $/ asPParser)
]

{ #category : #rules }
PPFortranGrammar >> comblock [
	^ ($/ asPParser, spoff, $/ asPParser,  spon) / ($/ asPParser, commonBlockName, $/ asPParser)
]

{ #category : #rules }
PPFortranGrammar >> comlist [
	^ (comBlock optional, commonBlockObject)
	/ (comlist, comma, comBlock optional, commonBlockObject)
	/ (comlist, comBlock, commonBlockObject)
]

{ #category : #rules }
PPFortranGrammar >> comma [
	^ $, asPParser
]

{ #category : #rules }
PPFortranGrammar >> commaExpr [
	^ comma, expr
]

{ #category : #rules }
PPFortranGrammar >> commaInputItemList [
	^ comma, inputItemList
]

{ #category : #rules }
PPFortranGrammar >> commaLoopControl [
	^ comma optional, loopControl
]

{ #category : #rules }
PPFortranGrammar >> commaSectionSubscript [
	^ comma, sectionSubscript
]

{ #category : #rules }
PPFortranGrammar >> commentOrNewLine [
	^ comment /	newLine
]

{ #category : #rules }
PPFortranGrammar >> commonBlockObject [
	^ variableName
	/ arrayDeclarator
]

{ #category : #rules }
PPFortranGrammar >> commonStmt [
	^ lblDef, 'common' asPParser, comlist, eos
]

{ #category : #rules }
PPFortranGrammar >> complexDataRefTail [
	^ sectionSubscriptRef
]

{ #category : #rules }
PPFortranGrammar >> computedGotoStmt [
	^ lblDef, gotoKw lpar,  lblRefList rpar, comma optional, expr, eos
]

{ #category : #rules }
PPFortranGrammar >> concatOpLevel2Expr [
	^ concatOp, level2Expr
]

{ #category : #rules }
PPFortranGrammar >> conditionalBody [
	^ executionPartConstruct star
]

{ #category : #rules }
PPFortranGrammar >> connectSpec [
	^ ('unit=' asPParser, unitIdentifier)
	/ ('err=' asPParser, lblRef)
	/ ('file=' asPParser, cExpr)
	/ ('status=' asPParser, cExpr)
	/ ('access=' asPParser, cExpr)
	/ ('form=' asPParser, cExpr)
	/ ('recl=' asPParser, expr)
	/ ('ulank=' asPParser, cExpr)
	/ ('iostat=' asPParser, scalarVariable)
]

{ #category : #rules }
PPFortranGrammar >> connectSpecList [
	^ unitIdentifierComma optional, (connectSpec, comma) star
]

{ #category : #rules }
PPFortranGrammar >> continueStmt [
	^ lblDef, 'continue' asPParser, eos
]

{ #category : #rules }
PPFortranGrammar >> dataIDoObject [
	^ arrayElement
	/ dataImpliedDo
]

{ #category : #rules }
PPFortranGrammar >> dataIDoObjectList [
	^ dataIDoObject plus
]

{ #category : #rules }
PPFortranGrammar >> dataImpliedDo [
	^ (lpar,  dataIDoObjectList, comma, impliedDoVariable, $= asPParser, expr, comma, expr, rpar)
	/ (lpar,  dataIDoObjectList, comma, impliedDoVariable, $= asPParser, expr, comma, expr, comma, expr, rpar)
]

{ #category : #rules }
PPFortranGrammar >> dataStmt [
	^ lblDef, 'data' asPParser, datalist, eos
]

{ #category : #rules }
PPFortranGrammar >> dataStmtObject [
	^ variable
	/ dataImpliedDo
]

{ #category : #rules }
PPFortranGrammar >> dataStmtObjectList [
	^ dataStmtObject plus
]

{ #category : #rules }
PPFortranGrammar >> dataStmtSet [
	^ dataStmtObjectList, $/ asPParser, dataStmtValueList, $/ asPParser
]

{ #category : #rules }
PPFortranGrammar >> dataStmtValue [
	^ constant
	/ (constant, $* asPParser, constant)
	/ (namedConstantUse, $* asPParser, constant)
]

{ #category : #rules }
PPFortranGrammar >> dataStmtValueList [
	^ dataStmtValue plus
]

{ #category : #rules }
PPFortranGrammar >> datalist [
	^ dataStmtSet
	/ (datalist optional, comma optional, dataStmtSet)
]

{ #category : #rules }
PPFortranGrammar >> declarationConstruct [
	^ typeDeclarationStmt / specificationStmt
]

{ #category : #rules }
PPFortranGrammar >> dimensionStmt [
	^ lblDef, 'dimension' asPParser, arrayDeclaratorList, eos
]

{ #category : #rules }
PPFortranGrammar >> doConstruct [
	^ labelDoStmt
]

{ #category : #rules }
PPFortranGrammar >> doLabelStmt [
	^ actionStmt
]

{ #category : #rules }
PPFortranGrammar >> doLblDef [
	^ tab_2, icon, tab_9
]

{ #category : #rules }
PPFortranGrammar >> doLblRef [
	^ icon
]

{ #category : #rules }
PPFortranGrammar >> doubleDoStmt [
	^ 'do' asPParser, lblRef, commaLoopControl, eos
]

{ #category : #rules }
PPFortranGrammar >> editElement [
	^ fcon
	/ mislexedFcon
	/ scon
	/ hcon
	/ ident
	/ (lpar,  fmtSpec, rpar)
]

{ #category : #rules }
PPFortranGrammar >> elseConstruct [
	^ elseStmt conditionalBody
]

{ #category : #rules }
PPFortranGrammar >> elseIfConstruct [
	^ elseIfStmt conditionalBody
]

{ #category : #rules }
PPFortranGrammar >> elseIfStmt [
	^ lblDef, ex_2, 'elseif' asPParser, lpar,  expr, rpar, 'then' asPParser, eos, in_2
]

{ #category : #rules }
PPFortranGrammar >> elseStmt [
	^ lblDef, ex_2, 'else' asPParser, eos, in_2
]

{ #category : #rules }
PPFortranGrammar >> endBlockDataStmt [
	^ lblDef, 'end' asPParser, eos
]

{ #category : #rules }
PPFortranGrammar >> endFunctionStmt [
	^ lblDef, 'end' asPParser, eos
]

{ #category : #rules }
PPFortranGrammar >> endIfStmt [
	^ lblDef, ex_2, 'endif' asPParser, eos
]

{ #category : #rules }
PPFortranGrammar >> endProgramStmt [
	^ lblDef, 'end' asPParser, eos
]

{ #category : #rules }
PPFortranGrammar >> endSubroutineStmt [
	^ lblDef, 'end' asPParser, eos
]

{ #category : #rules }
PPFortranGrammar >> endfileStmt [
	^ (lblDef, 'endfile' asPParser, unitIdentifier, eos)
	/ (lblDef, 'endfile' asPParser, lpar, positionSpecList, rpar, eos)
]

{ #category : #rules }
PPFortranGrammar >> entityDecl [
	^ objectName
	/ (objectName, lpar,  arraySpec, rpar)
	/ (objectName, $* asPParser, charLength)
	/ (objectName, lpar,  arraySpec, rpar, $* asPParser, charLength)
]

{ #category : #rules }
PPFortranGrammar >> entityDeclList [
	^ entityDecl plus
]

{ #category : #rules }
PPFortranGrammar >> entryStmt [
	^ lblDef, 'entry' asPParser, entryName, subroutineParList, 'result' asPParser, lpar,  name, rpar, eos
]

{ #category : #rules }
PPFortranGrammar >> eos [
	^ commentOrNewLine, commentOrNewLine star
]

{ #category : #rules }
PPFortranGrammar >> equivalenceObject [
	^ variable
]

{ #category : #rules }
PPFortranGrammar >> equivalenceObjectList [
	^ equivalenceObject plus
]

{ #category : #rules }
PPFortranGrammar >> equivalenceSet [
	^ lpar, equivalenceObject, comma, equivalenceObjectList, rpar
]

{ #category : #rules }
PPFortranGrammar >> equivalenceSetList [
	^ equivalenceSet plus
]

{ #category : #rules }
PPFortranGrammar >> equivalenceStmt [
	^ lblDef, 'equivalence' asPParser, equivalenceSetList, eos
]

{ #category : #rules }
PPFortranGrammar >> executableConstruct [
	^ actionStmt
	/ doConstruct
	/ ifConstruct
]

{ #category : #rules }
PPFortranGrammar >> executableProgram [
	^ programUnit plus
]

{ #category : #rules }
PPFortranGrammar >> executauleProgram [
	^ programUnit plus
]

{ #category : #rules }
PPFortranGrammar >> executionPartConstruct [
	^ executableConstruct
	/ formatStmt
	/ dataStmt
	/ entryStmt
]

{ #category : #rules }
PPFortranGrammar >> explicitShapeSpec [
	^ (lowerBound, $: asPParser, upperBound)
	/ upperBound
]

{ #category : #rules }
PPFortranGrammar >> explicitShapeSpecList [
	^ explicitShapeSpec plus
]

{ #category : #rules }
PPFortranGrammar >> expr [
	^ level5Expr
]

{ #category : #rules }
PPFortranGrammar >> externalNameList [
	^ externalName plus
]

{ #category : #rules }
PPFortranGrammar >> externalStmt [
	^ lblDef, 'external' asPParser, externalNameList, eos
]

{ #category : #rules }
PPFortranGrammar >> fmtSpec [
	^ formatEdit
	/ formatSep
	/ (formatSep, formatEdit)
	/ (fmtSpec, formatSep)
	/ (fmtSpec, formatSep, formatEdit)
	/ (fmtSpec, comma, formatEdit)
	/ (fmtSpec, comma, formatSep)
	/ (fmtSpec, comma, formatSep, formatEdit)
]

{ #category : #rules }
PPFortranGrammar >> formatEdit [
	^ editElement
	/ (icon, editElement)
	/ xcon
	/ pcon
	/ (pcon, editElement)
	/ (pcon, icon, editElement)
]

{ #category : #rules }
PPFortranGrammar >> formatIdentifier [
	^ lblRef
	/ cExpr
	/ $* asPParser
]

{ #category : #rules }
PPFortranGrammar >> formatSep [
	^ $/ asPParser
	/ $: asPParser
]

{ #category : #rules }
PPFortranGrammar >> formatStmt [
	^ lblDef, 'format' asPParser, lpar,  fmtSpec optional, rpar, eos
]

{ #category : #rules }
PPFortranGrammar >> functionPar [
	^ dummyArgName
]

{ #category : #rules }
PPFortranGrammar >> functionParList [
	^ (lpar,  functionPars rpar) / epsilon
]

{ #category : #rules }
PPFortranGrammar >> functionPars [
	^ (functionPar comma) star
]

{ #category : #rules }
PPFortranGrammar >> functionPrefix [
	^ 'function' asPParser / 
	typeSpec,  'function' asPParser
]

{ #category : #rules }
PPFortranGrammar >> functionRange [
	^ functionParList, eos, body optional, endFunctionStmt
]

{ #category : #rules }
PPFortranGrammar >> functionReference [
	^ name, lpar, rpar
]

{ #category : #rules }
PPFortranGrammar >> functionSubprogram [
	^ lblDef, functionPrefix, functionName, functionRange
]

{ #category : #rules }
PPFortranGrammar >> gotoKw [
	^ 'goto' asPParser
]

{ #category : #rules }
PPFortranGrammar >> gotoStmt [
	^ lblDef, gotoKw, lblRef, eos
]

{ #category : #rules }
PPFortranGrammar >> iconOrScon [
	^ icon
	/ scon
]

{ #category : #rules }
PPFortranGrammar >> ident [
	^ id
]

{ #category : #rules }
PPFortranGrammar >> ifConstruct [
	^ ifThenStmt, conditionalBody, elseIfConstruct star, elseConstruct optional, endIfStmt
]

{ #category : #rules }
PPFortranGrammar >> ifStmt [
	^ lblDef, 'if' asPParser, lpar,  expr, rpar, actionStmt
]

{ #category : #rules }
PPFortranGrammar >> ifThenStmt [
	^ lblDef, 'if' asPParser, lpar,  expr, rpar, 'then' asPParser, eos, in_2
]

{ #category : #rules }
PPFortranGrammar >> implicitRange [
	^ ident, $- asPParser, ident
]

{ #category : #rules }
PPFortranGrammar >> implicitRanges [
	^ (implicitRange comma) star
]

{ #category : #rules }
PPFortranGrammar >> implicitSpec [
	^ (typeSpec, implicitRanges)
	/ (typeSpec, lpar,  implicitRanges, rpar)
]

{ #category : #rules }
PPFortranGrammar >> implicitSpecList [
	^ implicitSpec plus
]

{ #category : #rules }
PPFortranGrammar >> implicitStmt [
	^ lblDef, 'implicit' asPParser, implicitSpecList, eos
]

{ #category : #rules }
PPFortranGrammar >> includeStmt [
	^ 'include' asPParser, scon, eos
]

{ #category : #rules }
PPFortranGrammar >> inputImpliedDo [
	^ lpar,  inputItemList, comma, impliedDoVariable, $= asPParser, expr, comma, expr, commaExpr optional, rpar
]

{ #category : #rules }
PPFortranGrammar >> inputItem [
	^ nameDataRef
	/ inputImpliedDo
]

{ #category : #rules }
PPFortranGrammar >> inputItemList [
	^ inputItem plus
]

{ #category : #rules }
PPFortranGrammar >> inquireSpec [
	^ ('unit=' asPParser, unitIdentifier)
	/ ('file=' asPParser, cExpr)
	/ ('err=' asPParser, lblRef)
	/ ('iostat=' asPParser, scalarVariable)
	/ ('exist=' asPParser, scalarVariable)
	/ ('opened=' asPParser, scalarVariable)
	/ ('numuer=' asPParser, scalarVariable)
	/ ('named=' asPParser, scalarVariable)
	/ ('name=' asPParser, scalarVariable)
	/ ('access=' asPParser, scalarVariable)
	/ ('sequential=' asPParser, scalarVariable)
	/ ('direct=' asPParser, scalarVariable)
	/ ('form=' asPParser, scalarVariable)
	/ ('formatted=' asPParser, scalarVariable)
	/ ('unformatted=' asPParser, scalarVariable)
	/ ('recl=' asPParser, expr)
	/ ('nextrec=' asPParser, scalarVariable)
	/ ('ulank=' asPParser, scalarVariable)
]

{ #category : #rules }
PPFortranGrammar >> inquireSpecList [
	^ unitIdentifier optional, (inquireSpec, comma) star
]

{ #category : #rules }
PPFortranGrammar >> inquireStmt [
	^ lblDef, 'inquire' asPParser, lpar,  inquireSpecList, rpar, eos
]

{ #category : #rules }
PPFortranGrammar >> intrinsicList [
	^ intrinsicProcedureName plus
]

{ #category : #rules }
PPFortranGrammar >> intrinsicStmt [
	^ lblDef, 'intrinsic' asPParser, intrinsicList, eos
]

{ #category : #rules }
PPFortranGrammar >> ioControlSpec [
	^ ('fmt=' asPParser, formatIdentifier)
	/ ('unit=' asPParser, unitIdentifier)
	/ ('rec=' asPParser, expr)
	/ ('end=' asPParser, lblRef)
	/ ('err=' asPParser, lblRef)
	/ ('iostat=' asPParser, scalarVariable)
]

{ #category : #rules }
PPFortranGrammar >> ioControlSpecList [
	^ (unitIdentifier, $$ asPParser, comma)
	/ (unitIdentifier, comma, formatIdentifier)
	/ (unitIdentifier, comma, ioControlSpec)
	/ ioControlSpec
	/ (ioControlSpecList, comma, ioControlSpec)
]

{ #category : #rules }
PPFortranGrammar >> labelDoStmt [
	^ lblDef, 'do' asPParser, doLblRef, commaLoopControl, eos, in_2, executionPartConstruct star, ex_2, doLblDef, doLabelStmt
]

{ #category : #rules }
PPFortranGrammar >> lblRef [
	^ label
]

{ #category : #rules }
PPFortranGrammar >> lblRefList [
	^ lblRef plus
]

{ #category : #rules }
PPFortranGrammar >> lengthSelector [
	^ $* asPParser, charLength
]

{ #category : #rules }
PPFortranGrammar >> level1Expr [
	^ primary
]

{ #category : #rules }
PPFortranGrammar >> level2Expr [
	^ sign optional, addOperand, addOpAddOperand star
]

{ #category : #rules }
PPFortranGrammar >> level3Expr [
	^ level2Expr, concatOpLevel2Expr star
]

{ #category : #rules }
PPFortranGrammar >> loopControl [
	^ variableName, $= asPParser, expr, comma, expr, commaExpr optional
]

{ #category : #rules }
PPFortranGrammar >> lowerBound [
	^ expr
]

{ #category : #rules }
PPFortranGrammar >> lpar [
	^ $( asPParser
]

{ #category : #rules }
PPFortranGrammar >> mainProgram [
	^ programStmt optional, mainRange
]

{ #category : #rules }
PPFortranGrammar >> mainRange [
	^ body optional, endProgramStmt
]

{ #category : #rules }
PPFortranGrammar >> mislexedFcon [
	^ (rdcon, spoff, rdcon, spon)
	/ (ident, spoff, rdcon, spon)
]

{ #category : #rules }
PPFortranGrammar >> multOp [
	^ $* asPParser
	/ $/ asPParser
]

{ #category : #rules }
PPFortranGrammar >> multOpMultOperand [
	^ multOp, multOperand
]

{ #category : #rules }
PPFortranGrammar >> multOperand [
	^ level1Expr, powerUpMultOperand optional
]

{ #category : #rules }
PPFortranGrammar >> nameDataRef [
	^ name, complexDataRefTail star
]

{ #category : #rules }
PPFortranGrammar >> namedConstant [
	^ ident
]

{ #category : #rules }
PPFortranGrammar >> namedConstantDef [
	^ namedConstant, $= asPParser, expr
]

{ #category : #rules }
PPFortranGrammar >> namedConstantDefList [
	^ namedConstantDef optional
]

{ #category : #rules }
PPFortranGrammar >> namedConstantUse [
	^ ident
]

{ #category : #rules }
PPFortranGrammar >> openStmt [
	^ lblDef, 'open' asPParser, lpar,  connectSpecList, rpar, eos
]

{ #category : #rules }
PPFortranGrammar >> outputImpliedDo [
	^ (lpar,  expr, comma, impliedDoVariable, $= asPParser, expr, comma, expr, commaExpr optional, rpar)
	/ (lpar,  outputItemList1, comma, impliedDoVariable, $= asPParser, expr, comma, expr, commaExpr optional, rpar)
]

{ #category : #rules }
PPFortranGrammar >> outputItemList [
	^ expr
	/ outputItemList1
]

{ #category : #rules }
PPFortranGrammar >> outputItemList1 [
	^ (expr, comma, expr)
	/ (expr, comma, outputImpliedDo)
	/ outputImpliedDo
	/ (outputItemList1, comma, expr)
	/ (outputItemList1, comma, outputImpliedDo)
]

{ #category : #rules }
PPFortranGrammar >> parameterStmt [
	^ lblDef, 'parameter' asPParser, lpar,  namedConstantDefList, rpar, eos
]

{ #category : #rules }
PPFortranGrammar >> pauseStmt [
	^ lblDef, 'pause' asPParser, iconOrScon optional, eos
]

{ #category : #rules }
PPFortranGrammar >> positionSpec [
	^ ('unit=' asPParser, unitIdentifier)
	/ ('err=' asPParser, lblRef)
	/ ('iostat=' asPParser, scalarVariable)
]

{ #category : #rules }
PPFortranGrammar >> positionSpecList [
	^ unitIdentifierComma optional, positionSpec plus
]

{ #category : #rules }
PPFortranGrammar >> powerOp [
	^ '**' asPParser
]

{ #category : #rules }
PPFortranGrammar >> powerUpMultOperand [
	^ powerOp, multOperand
]

{ #category : #rules }
PPFortranGrammar >> primary [
	^ unsignedArithmeticConstant
	/ nameDataRef
	/ functionReference
	/ (lpar, expr, rpar)
]

{ #category : #rules }
PPFortranGrammar >> printStmt [
	^ (lblDef, 'print' asPParser, formatIdentifier, comma, outputItemList, eos)
	/ (lblDef, 'print' asPParser, formatIdentifier, eos)
]

{ #category : #rules }
PPFortranGrammar >> program [
	^ in_6, commentOrNewLine star, executableProgram, commentOrNewLine star, ex_6
]

{ #category : #rules }
PPFortranGrammar >> programStmt [
	^ lblDef, 'program' asPParser, programName, eos
]

{ #category : #rules }
PPFortranGrammar >> programUnit [
	^ mainProgram / functionSubprogram / subroutineSubprogram / blockDataSubprogram
]

{ #category : #rules }
PPFortranGrammar >> rdCtlSpec [
	^ rdUnitId
	/ (lpar,  rdIoCtlSpecList, rpar)
]

{ #category : #rules }
PPFortranGrammar >> rdFmtId [
	^ lblRef
	/ $* asPParser
	/ cOperand
	/ (cOperand, concatOp, cPrimary)
	/ (rdFmtIdExpr, concatOp, cPrimary)
]

{ #category : #rules }
PPFortranGrammar >> rdFmtIdExpr [
	^ lpar,  uFExpr, rpar
]

{ #category : #rules }
PPFortranGrammar >> rdIoCtlSpecList [
	^ (unitIdentifier, comma, ioControlSpec)
	/ (unitIdentifier, comma, formatIdentifier)
	/ ioControlSpec
	/ (rdIoCtlSpecList, comma, ioControlSpec)
]

{ #category : #rules }
PPFortranGrammar >> rdUnitId [
	^ (lpar,  uFExpr, rpar)
	/ (lpar,  $* asPParser, rpar)
]

{ #category : #rules }
PPFortranGrammar >> readStmt [
	^ (lblDef, 'read' asPParser, rdCtlSpec, inputItemList optional, eos) /
	(lblDef, 'read' asPParser, rdFmtId, commaInputItemList optional, eos)
]

{ #category : #rules }
PPFortranGrammar >> returnStmt [
	^ lblDef, 'return' asPParser, expr optional, eos
]

{ #category : #rules }
PPFortranGrammar >> rewindStmt [
	^ (lblDef, 'rewind' asPParser, unitIdentifier, eos)
	/ (lblDef, 'rewind' asPParser, lpar, positionSpecList, rpar, eos)
]

{ #category : #rules }
PPFortranGrammar >> rpar [
	^ $) asPParser
]

{ #category : #rules }
PPFortranGrammar >> sFExprList [
	^ (expr, $: asPParser optional, expr optional)
	/ ($: asPParser, expr optional)
]

{ #category : #rules }
PPFortranGrammar >> saveStmt [
	^ (lblDef, 'save' asPParser, eos)
	/ (lblDef, 'save' asPParser, savedEntityList, eos)
]

{ #category : #rules }
PPFortranGrammar >> savedCommonBlock [
	^ $/ asPParser, commonBlockName, $/ asPParser
]

{ #category : #rules }
PPFortranGrammar >> savedEntity [
	^ variableName
	/ savedCommonBlock
]

{ #category : #rules }
PPFortranGrammar >> savedEntityList [
	^ savedEntity plus
]

{ #category : #rules }
PPFortranGrammar >> sectionSubscript [
	^ (expr, subscriptTripletTail optional)
	/ subscriptTripletTail
]

{ #category : #rules }
PPFortranGrammar >> sectionSubscriptList [
	^ sectionSubscript plus
]

{ #category : #rules }
PPFortranGrammar >> sectionSubscriptRef [
	^ lpar, sectionSubscriptList, rpar
]

{ #category : #rules }
PPFortranGrammar >> sfDummyArgNameList [
	^ sfDummyArgName plus
]

{ #category : #rules }
PPFortranGrammar >> sfExprList [
	^ (expr, $: asPParser optional, expr optional) / ($: asPParser, expr optional)
]

{ #category : #rules }
PPFortranGrammar >> sfExprListRef [
	^ lpar,  sfExprList, commaSectionSubscript star, rpar
]

{ #category : #rules }
PPFortranGrammar >> sign [
	^ $+ asPParser
	/ $- asPParser
]

{ #category : #rules }
PPFortranGrammar >> specificaitonStmt [
	^ comonStmt / dataStmt / dimensionStmt / equivalenceStmt / externalStmt / intrinsicStmt / saveStmt
]

{ #category : #rules }
PPFortranGrammar >> specificationPartConstruct [
	^ implicitStmt / parameterStmt/ formatStmt/ entryStmt/ declarationConstruct/ includeStmt
]

{ #category : #rules }
PPFortranGrammar >> specificationStmt [
	^ commonStmt
	/ dataStmt
	/ dimensionStmt
	/ equivalenceStmt
	/ externalStmt
	/ intrinsicStmt
	/ saveStmt
]

{ #category : #rules }
PPFortranGrammar >> start [
	"Answer the production to start this parser with."
	
	^ programUnit end
]

{ #category : #rules }
PPFortranGrammar >> stmtFunctionRange [
	^ lpar, sfDummyArgNameList optional, rpar, $= asPParser, expr, eos
]

{ #category : #rules }
PPFortranGrammar >> stmtFunctionStmt [
	^ lblDef, name, stmtFunctionRange
]

{ #category : #rules }
PPFortranGrammar >> stopStmt [
	^ lblDef, 'stop' asPParser, iconOrScon optional, eos
]

{ #category : #rules }
PPFortranGrammar >> subroutineArg [
	^ expr
	/ hcon
	/ ($* asPParser, lblRef)
]

{ #category : #rules }
PPFortranGrammar >> subroutineArgList [
	^ (subroutineArg, comma) star
]

{ #category : #rules }
PPFortranGrammar >> subroutinePar [
	^ dummyArgName
	/ ($* asPParser)
]

{ #category : #rules }
PPFortranGrammar >> subroutineParList [
	^ (lpar,  subroutinePars, rpar) / epsilon 
]

{ #category : #rules }
PPFortranGrammar >> subroutinePars [
	^ (subroutinePar comma) star
]

{ #category : #rules }
PPFortranGrammar >> subroutineRange [
	^ subroutineParList, eos, body optional, endSubroutineStmt
]

{ #category : #rules }
PPFortranGrammar >> subroutineSubprogram [
	^ lblDef, 'subroutine' asPParser, subroutineName, subroutineRange
]

{ #category : #rules }
PPFortranGrammar >> typeDeclarationStmt [
	^ lblDef, typeSpec, entityDeclList, eos
]

{ #category : #rules }
PPFortranGrammar >> typeParamValue [
	^ expr
	/ $* asPParser
]

{ #category : #rules }
PPFortranGrammar >> typeSpec [
	^ 'integer' asPParser
	/ 'real' asPParser
	/ 'doubleprecision' asPParser
	/ 'complex' asPParser
	/ 'logical' asPParser
	/ 'character' asPParser
	/ ('character' asPParser lengthSelector)
]

{ #category : #rules }
PPFortranGrammar >> uFExpr [
	^ uFTerm
	/ (sign, uFTerm)
	/ (uFExpr, addOp, uFTerm)
]

{ #category : #rules }
PPFortranGrammar >> uFFactor [
	^ uFPrimary
	/ (uFPrimary, powerOp, uFFactor)
]

{ #category : #rules }
PPFortranGrammar >> uFPrimary [
	^ icon
	/ scon
	/ nameDataRef
	/ functionReference
	/ (lpar,  uFExpr, rpar)
]

{ #category : #rules }
PPFortranGrammar >> uFTerm [
	^ uFFactor
	/ (uFTerm, multOp, uFFactor)
	/ (uFTerm, concatOp, uFPrimary)
]

{ #category : #rules }
PPFortranGrammar >> unitIdentifier [
	^ uFExpr
	/ $* asPParser
]

{ #category : #rules }
PPFortranGrammar >> unitIdentifierComma [
	^ unitIdentifier, comma
]

{ #category : #rules }
PPFortranGrammar >> upperBound [
	^ expr
]

{ #category : #rules }
PPFortranGrammar >> variableComma [
	^ variableName, comma
]

{ #category : #rules }
PPFortranGrammar >> writeStmt [
	^ lblDef, 'write' asPParser, lpar, ioControlSpecList, rpar, outputItemList optional, eos
]
