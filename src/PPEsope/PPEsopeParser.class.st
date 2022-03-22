Class {
	#name : #PPEsopeParser,
	#superclass : #PPEsopeGrammar,
	#category : #'PPEsope-Parser'
}

{ #category : #rules }
PPEsopeParser >> segdes [
	^ super segdes
		==> [ :production |
			PPEASTSegdes new
				startPosition: (production at: 2) start;
				stopPosition: (production at: 6) stop;
				segname: (production at: 6);
				yourself]
]
