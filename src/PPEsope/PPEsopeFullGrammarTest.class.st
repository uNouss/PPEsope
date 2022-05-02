Class {
	#name : #PPEsopeFullGrammarTest,
	#superclass : #TestCase,
	#instVars : [
		'parser'
	],
	#category : #'PPEsope-Tests'
}

{ #category : #running }
PPEsopeFullGrammarTest >> parserClass [
	^ PPEsopeGrammar
]

{ #category : #running }
PPEsopeFullGrammarTest >> setUp [
	super setUp.
	parser := self parserClass new
]

{ #category : #running }
PPEsopeFullGrammarTest >> testBigFile [
	self deny: (parser parse: PPEsopeGrammarTest esopeBigFile) isPetit2Failure 
]

{ #category : #running }
PPEsopeFullGrammarTest >> testEmptyFile [
	self deny: (parser parse: '
') isPetit2Failure 
]

{ #category : #running }
PPEsopeFullGrammarTest >> testEsopePointeurFile [
	self deny: (parser parse: '      subroutine stgbrk(
c     == entrees ==
     & alist,splist,
c     == sorties ==
     & rlist,status)
      pointeur alist.list
      return
      end
') isPetit2Failure 
]

{ #category : #running }
PPEsopeFullGrammarTest >> testEsopeSegactFile [
	self deny: (parser parse: '      subroutine stgbrk(
c     == entrees ==
     & alist,splist,
c     == sorties ==
     & rlist,status)
      segact,splist
      return
      end
') isPetit2Failure 
]

{ #category : #running }
PPEsopeFullGrammarTest >> testEsopeSegadjFile [
	self deny: (parser parse: '      subroutine stgbrk(
c     == entrees ==
     & alist,splist,
c     == sorties ==
     & rlist,status)
                segadj,rlist

      return
      end
') isPetit2Failure 
]

{ #category : #running }
PPEsopeFullGrammarTest >> testEsopeSegdesFile [
	self deny: (parser parse: '      subroutine stgbrk(
c     == entrees ==
     & alist,splist,
c     == sorties ==
     & rlist,status)
      segdes,alist

      return
      end
') isPetit2Failure 
]

{ #category : #running }
PPEsopeFullGrammarTest >> testEsopeSeginiFile [
	self deny: (parser parse: '      subroutine stgbrk(
c     == entrees ==
     & alist,splist,
c     == sorties ==
     & rlist,status)
              segini,ms

      return
      end
') isPetit2Failure 
]

{ #category : #running }
PPEsopeFullGrammarTest >> testNonEsopeFile [
	self deny: (parser parse: '      subroutine stgbrk(
c     == entrees ==
     & alist,splist,
c     == sorties ==
     & rlist,status)
      return
      end
') isPetit2Failure 
]

{ #category : #running }
PPEsopeFullGrammarTest >> testSmallFile [
	self deny: (parser parse: PPEsopeGrammarTest esopeSmallFile) isPetit2Failure 
]
