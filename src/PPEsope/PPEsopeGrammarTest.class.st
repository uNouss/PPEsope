Class {
	#name : #PPEsopeGrammarTest,
	#superclass : #PP2CompositeNodeTest,
	#category : #'PPEsope-Tests'
}

{ #category : #tests }
PPEsopeGrammarTest class >> esopeBigFile [
	^ '      subroutine vcstp(ov1,pshp1,pbeg1,pend1,ov2,status)
c xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
cb  Subroutine : vcstp (langage Esope)
cb  Module     : VECTOR
cb  Auteur     : L.Brault
cb  Date       : Octobre-2000
cb  Service    : EPDN 
cb  But        : changer une partie des elements avec un vecteur
c
cm   auteur    : L.Brault
cm   service   : EPDN
cm   date      : 31-05-2001
cm   objet     : corriger l''implementation dans le cas hors colonne
c xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
c
cae  ov1    : objet VECTOR a changer
cas  ov1    : objet VECTOR a changer
cae  pshp1  : shape du VECTOR
cae  pbeg1  : position de depart
cae  pend1  : position de fin   
cas  ov2    : objet VECTOR 
cas  status : status d''execution (status=0 <=> succes)
c
#include <implicit.h>
c
      integer  mypnt
      external mypnt
c
#include <vector.obj>
#include <values.seg>
c
      integer  ov2
      integer  ov1
      pointeur pshp1.values
      pointeur pbeg1.values
      pointeur pend1.values
      integer  status
c
      pointeur pv2.tvecto
      pointeur pv1.tvecto
c
      pointeur ppos1.values
      pointeur pbot1.values
      pointeur ptop1.values
      integer  ierr
      integer  v2sz
      integer  v1sz
      integer  shp1sz
      integer  ibeg1
      integer  iend1
      integer  ioff1
      integer  idim1
      integer  iposmx
      integer  ipos
      integer  i
      integer  k
c
      status=0
c
c     -- check version of vector v1
      call vc0ckv(ov1,ierr)
      if (ierr.ne.0) goto 999
c
c     -- check version of vector v2
      call vc0ckv(ov2,ierr)
      if (ierr.ne.0) goto 999
c
c     -- ouvrir le VECTOR v1
      call actstr(ov1)
      pv1=mypnt(ov1,1)
      segact,pv1
      nvcflo=pv1.vecflo(/1)
      nvcent=pv1.vecent(/1)
      nvclog=pv1.veclog(/1)
      nvccha=pv1.veccha(/2)
      cvccha=pv1.veccha(/1)
      v1sz=max(nvcflo,nvcent,nvclog,nvccha)
c
c     -- ouvrir le VECTOR v2
      call actstr(ov2)
      pv2=mypnt(ov2,1)
      segact,pv2
      nvcflo=pv2.vecflo(/1)
      nvcent=pv2.vecent(/1)
      nvclog=pv2.veclog(/1)
      nvccha=pv2.veccha(/2)
      cvccha=pv2.veccha(/1)
      v2sz=max(nvcflo,nvcent,nvclog,nvccha)
c
c     -- verifier le type de v1 et v2
      if(pv1.vectyp .ne. pv2.vectyp)then
        call edmess(''vcstp: arguments de type differents'')
	goto 999
      endif
c
c     -- si shape fournie, verifier compatiblite avec size
      if(pshp1 .ne. 0)then
        segact,pshp1
        iposmx=1
        do i=1,pshp1.vale(/1)
          iposmx=iposmx*pshp1.vale(i)
	enddo
        segdes,pshp1*NOMOD
c
        if(iposmx .ne. v1sz)then
          call edmess(''vcstp: shape et size incompatibles'')
          goto 999
        endif
      endif
c
c     -- retourner begin-1D equivalente a une multi-position
      call vc0pos(pshp1,pbeg1,ibeg1,ierr)
      if(ierr .ne. 0) goto 999
c
c     -- verifier la position de begin
      if(v1sz.ge.1)then
        if(.not.(ibeg1.ge.1 .and. ibeg1.le.v1sz))then
          call edmess(''vcstp: BEGIN hors domaine'')
	  goto 999
	endif
      else
        if(ibeg1.ne.0)then
          call edmess(''vcstp: BEGIN hors domaine'')
	  goto 999
	endif
      endif
c
c     -- retourner end-1D equivalente a une multi-position
      call vc0pos(pshp1,pend1,iend1,ierr)
      if(ierr .ne. 0) goto 999
c
c     -- verifier la position de end
      if(v1sz.ge.1)then
        if(.not.(iend1.ge.1 .and. iend1.le.v1sz))then
          call edmess(''vcstp: END hors domaine'')
	  goto 999
	endif
      else
        if(iend1.ne.0)then
          call edmess(''vcstp: END hors domaine'')
	  goto 999
	endif
      endif
c
c     -- calculer la taille de intervalle [begin, end]
      if(pshp1 .ne. 0)then
        segact,pshp1
        shp1sz=pshp1.vale(/1)
c
        segact,pbeg1
        segact,pend1
        segini,pbot1=pbeg1
        segini,ptop1=pend1
c
        idim1=1
        do i=1,shp1sz
          pbot1.vale(i)=min(pbeg1.vale(i), pend1.vale(i))
          ptop1.vale(i)=max(pbeg1.vale(i), pend1.vale(i))
          idim1=idim1*(ptop1.vale(i) - pbot1.vale(i) + 1)
        enddo
c
      else
        idim1=max(0,iend1-ibeg1+1)
      endif
      if(v1sz .le. 0)then
        idim1=0
      endif
c
c     -- verifier compatibilite [begin, end] et taille de v2
      if(v2sz .ne. idim1)then
        call edmess(
     &  ''vcstp: (BEGIN,END) de v1 et taille de v2 incompatibles'')
	goto 999
      endif
c
c     -- changer les elements
      if(pshp1 .ne. 0)then
c       == multi-indice
c
c       -- positionner au depart tous les indices
        segini,ppos1=pshp1
        do i=1,shp1sz
          ppos1.vale(i)=pbot1.vale(i)
        enddo
c
        do k=1,idim1
c
      	  call vc0pos(pshp1,ppos1,ipos,ierr)
      	  if(ierr .ne. 0) goto 999
	  segact,pshp1
	  segact,ppos1
c
          if(pv1.vectyp .eq. ''FLOTTANT'')then
            pv1.vecflo(ipos)=pv2.vecflo(k)
c
          elseif(pv1.vectyp .eq. ''ENTIER'')then
            pv1.vecent(ipos)=pv2.vecent(k)
c
          elseif(pv1.vectyp .eq. ''LOGIQUE'')then
            pv1.veclog(ipos)=pv2.veclog(k)
c
          elseif(pv1.vectyp .eq. ''CHAINE'')then
            pv1.veccha(ipos)=pv2.veccha(k)
	  endif
c
c         -- incrementer un indice
          do 10, i=1,shp1sz
            if(ppos1.vale(i) .lt. ptop1.vale(i))then
              ppos1.vale(i)=ppos1.vale(i)+1
	      goto 11
            else
              ppos1.vale(i)=pbot1.vale(i)
            endif
 10       continue
 11       continue
c
	enddo
c
        segsup,ppos1
        segsup,pbot1
        segsup,ptop1
c
        segdes,pshp1*NOMOD
        segdes,pbeg1*NOMOD
        segdes,pend1*NOMOD
c
      else
c       == mono-indice
      	ioff1=ibeg1-1
c
      	if(pv1.vectyp .eq. ''FLOTTANT'')then
	  do i=1,v2sz
	    pv1.vecflo(ioff1+i)=pv2.vecflo(i)
	  enddo
c
      	elseif(pv1.vectyp .eq. ''ENTIER'')then
	  do i=1,v2sz
	    pv1.vecent(ioff1+i)=pv2.vecent(i)
	  enddo
c
      	elseif(pv1.vectyp .eq. ''LOGIQUE'')then
	  do i=1,v2sz
	    pv1.veclog(ioff1+i)=pv2.veclog(i)
	  enddo
c
      	elseif(pv1.vectyp .eq. ''CHAINE'')then
	  do i=1,v2sz
	    pv1.veccha(ioff1+i)=pv2.veccha(i)
	  enddo
      	endif
      endif
c
c     -- fermer le VECTOR v2
      segdes,pv2*NOMOD
      call desstr(ov2,''NOMOD'')
c
c     -- fermer le VECTOR v1
      segdes,pv1*MOD
      call desstr(ov1,''MOD'')
c
c     -- terminer avec succes      
      return
c
c     -- terminer en echec
 999  continue      
      call edmess(''vcstp: routine en echec'')
      status=1
      return
      end
''apres une liste de separateurs
c xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
c
cae  alist  : "la" liste de chaines
cae  splist : "la" liste de separateurs
c
cas  rlist  : la liste des morceaux/decoupes de "la" chaine
cas  status : status d''execution (status=0 <=> succes)
c
#include <implicit.h>
#include <string.seg>
#include <list.seg>
c
      pointeur alist.list
      pointeur splist.list
      pointeur rlist.list
      integer  status
c
      pointeur xs.string
      pointeur sp.string
      pointeur ms.string
      integer  lxs
      integer  lsp
      integer  lmin
      integer  i,ia
      integer  idx,kdx
      integer  first,last
      integer  mfirst,mlast
c
      status=0
      nlist=10
      segini,rlist
      rlist.ilist=0
c
      segact,splist
      segact,alist
c
c     //repeter "decouper chaque chaine"
      do ia=1,alist.ilist
        xs=abs(alist.elist(ia))
c
        segact,xs
        lxs=xs.cstg(/1)
c
        if(lxs.eq.0)then
c         == la chaine a "decouper" est vide
c         >> ne rien renvoyer <<
        else
c         == la chaine a "decouper" n''est pas vide 
          first=1
          last=lxs
c
c         //repeter "decouper morceau"
 100      continue
c
c           //repeter "sauter separateur-tete"
c             -- chercher separateur-entete
c             -- ... donnant le plus petit separateur
 110          i=0
              lmin=-1
 120          i=i+1
              if(i.le.(splist.ilist))then
                sp=abs(splist.elist(i))
                segact,sp
                lsp=sp.cstg(/1)
                if(lsp.eq.0)then
                  idx=1
                else
                  idx=index(xs.cstg(first:last),
     +                      sp.cstg)
                endif
                if(idx.eq.1) then
c                 -- initialiser
                  if(lmin.eq.-1)lmin=lsp
c                 -- favoriser tout separateur-non-vide
                  if(lmin.eq.0)lmin=lsp
c                 -- prendre le plus petit separateur-non-vide
                  if((lsp.lt.lmin).and.(lsp.gt.0))lmin=lsp
                endif
                segdes,sp
                goto 120
              endif
c
c             //si trouve, sauter separateur-tete
              if(lmin.ne.-1) then
c               -- sauter separateur-entete
                first=first+lmin
c               //si possible, sauter prochain separateur-tete
                if((first.le.last).and.(lmin.ge.1))goto 110
              endif
c           //fin repeter "sauter separateur-tete"
c
c           //si possible, chercher morceau
            if(first.le.last)then
c             -- chercher separateur-morceau
c             -- ... donnant le plus petit morceau
              i=0
              kdx=0
              lmin=-1
 130          i=i+1
              if(i.le.(splist.ilist))then
                sp=abs(splist.elist(i))
                segact,sp
                lsp=sp.cstg(/1)
                if(lsp.eq.0)then
                  idx=1
                else
                  idx=index(xs.cstg(first:last),
     +                      sp.cstg)
                endif
                if(idx.ne.0) then
                  if(kdx.eq.0)then
                    kdx=idx
                    lmin=lsp
                  endif
                  if(idx.lt.kdx)then
                    kdx=idx
                    lmin=lsp
                  endif
                  if((idx.eq.kdx).and.(lsp.lt.lmin))then
                    kdx=idx
                    lmin=lsp
                  endif
                endif
                segdes,sp
                goto 130
              endif
c
c             -- determiner limites morceau
              if(kdx.ne.0) then
                mfirst=first
                if(kdx.eq.1)then
                  mlast=first
                else
                  mlast=first+kdx-2
                endif
              else
                lmin=0
                mfirst=first
                mlast=last
              endif
c
c             -- ranger morceau 
              lstg=mlast-mfirst+1
              segini,ms
                ms.cstg=xs.cstg(mfirst:mlast)
              segdes,ms
              rlist.ilist=rlist.ilist+1
              if((rlist.ilist).gt.nlist)then
                nlist=nlist+10
                segadj,rlist
              endif
              rlist.elist(rlist.ilist)=ms          
c
c             //si possible, decouper prochain morceau
              first=mlast+lmin+1
              if(first.le.last)goto 100
            endif
c
c         //fin repeter "decouper morceau"
        endif
c
        segdes,xs
      enddo
c     //fin repeter "decouper chaque chaine"
c
      segdes,alist
      segdes,splist
      segdes,rlist
      return
      end
'
]

{ #category : #tests }
PPEsopeGrammarTest class >> esopeSmallFile [
	^ '      subroutine stgbrk(
c     == entrees ==
     & alist,splist,
c     == sorties ==
     & rlist,status)
c xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
cb  Subroutine : stgbrk (langage Esope)
cb  Module     : STRING
cb  Auteur     : L.Brault
cb  Date       : 28-Octobre-1997
cb  Service    : EPNC 
cb  But        : briser/decouper des chaines de caracteres
cb               d''apres une liste de separateurs
c xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
c
cae  alist  : "la" liste de chaines
cae  splist : "la" liste de separateurs
c
cas  rlist  : la liste des morceaux/decoupes de "la" chaine
cas  status : status d''execution (status=0 <=> succes)
c
#include <implicit.h>
#include <string.seg>
#include <list.seg>
c
      pointeur alist.list
      pointeur splist.list
      pointeur rlist.list
      integer  status
c
      pointeur xs.string
      pointeur sp.string
      pointeur ms.string
      integer  lxs
      integer  lsp
      integer  lmin
      integer  i,ia
      integer  idx,kdx
      integer  first,last
      integer  mfirst,mlast
c
      status=0
      nlist=10
      segini,rlist
      rlist.ilist=0
c
      segact,splist
      segact,alist
c
c     //repeter "decouper chaque chaine"
      do ia=1,alist.ilist
        xs=abs(alist.elist(ia))
c
        segact,xs
        lxs=xs.cstg(/1)
c
        if(lxs.eq.0)then
c         == la chaine a "decouper" est vide
c         >> ne rien renvoyer <<
        else
c         == la chaine a "decouper" n''est pas vide 
          first=1
          last=lxs
c
c         //repeter "decouper morceau"
 100      continue
c
c           //repeter "sauter separateur-tete"
c             -- chercher separateur-entete
c             -- ... donnant le plus petit separateur
 110          i=0
              lmin=-1
 120          i=i+1
              if(i.le.(splist.ilist))then
                sp=abs(splist.elist(i))
                segact,sp
                lsp=sp.cstg(/1)
                if(lsp.eq.0)then
                  idx=1
                else
                  idx=index(xs.cstg(first:last),
     +                      sp.cstg)
                endif
                if(idx.eq.1) then
c                 -- initialiser
                  if(lmin.eq.-1)lmin=lsp
c                 -- favoriser tout separateur-non-vide
                  if(lmin.eq.0)lmin=lsp
c                 -- prendre le plus petit separateur-non-vide
                  if((lsp.lt.lmin).and.(lsp.gt.0))lmin=lsp
                endif
                segdes,sp
                goto 120
              endif
c
c             //si trouve, sauter separateur-tete
              if(lmin.ne.-1) then
c               -- sauter separateur-entete
                first=first+lmin
c               //si possible, sauter prochain separateur-tete
                if((first.le.last).and.(lmin.ge.1))goto 110
              endif
c           //fin repeter "sauter separateur-tete"
c
c           //si possible, chercher morceau
            if(first.le.last)then
c             -- chercher separateur-morceau
c             -- ... donnant le plus petit morceau
              i=0
              kdx=0
              lmin=-1
 130          i=i+1
              if(i.le.(splist.ilist))then
                sp=abs(splist.elist(i))
                segact,sp
                lsp=sp.cstg(/1)
                if(lsp.eq.0)then
                  idx=1
                else
                  idx=index(xs.cstg(first:last),
     +                      sp.cstg)
                endif
                if(idx.ne.0) then
                  if(kdx.eq.0)then
                    kdx=idx
                    lmin=lsp
                  endif
                  if(idx.lt.kdx)then
                    kdx=idx
                    lmin=lsp
                  endif
                  if((idx.eq.kdx).and.(lsp.lt.lmin))then
                    kdx=idx
                    lmin=lsp
                  endif
                endif
                segdes,sp
                goto 130
              endif
c
c             -- determiner limites morceau
              if(kdx.ne.0) then
                mfirst=first
                if(kdx.eq.1)then
                  mlast=first
                else
                  mlast=first+kdx-2
                endif
              else
                lmin=0
                mfirst=first
                mlast=last
              endif
c
c             -- ranger morceau 
              lstg=mlast-mfirst+1
              segini,ms
                ms.cstg=xs.cstg(mfirst:mlast)
              segdes,ms
              rlist.ilist=rlist.ilist+1
              if((rlist.ilist).gt.nlist)then
                nlist=nlist+10
                segadj,rlist
              endif
              rlist.elist(rlist.ilist)=ms          
c
c             //si possible, decouper prochain morceau
              first=mlast+lmin+1
              if(first.le.last)goto 100
            endif
c
c         //fin repeter "decouper morceau"
        endif
c
        segdes,xs
      enddo
c     //fin repeter "decouper chaque chaine"
c
      segdes,alist
      segdes,splist
      segdes,rlist
      return
      end
'
]

{ #category : #accessing }
PPEsopeGrammarTest >> parserClass [
	^ PPEsopeGrammar
]

{ #category : #tests }
PPEsopeGrammarTest >> testBigFile [
	self parse: self class esopeBigFile rule: #file
]

{ #category : #tests }
PPEsopeGrammarTest >> testInclude [
	self parse: '#include <implicit.h>
' rule: #include.
	self parse: '#include "string.seg"
' rule: #include.
	
	self fail: '#include >implicit.h<' rule: #include.
	self fail: '#include ''string.seg''' rule: #include.
]

{ #category : #tests }
PPEsopeGrammarTest >> testPointer [
	self parse: '      pointeur splist.list
' rule: #pointer.
	self fail: 'pointeur splist.list' rule: #pointer.
]

{ #category : #tests }
PPEsopeGrammarTest >> testSegact [
	self parse: '      segact,splist
' rule: #segact.
	self fail: 'segact,splist' rule: #segact.
]

{ #category : #tests }
PPEsopeGrammarTest >> testSegadj [
	self parse: '      segadj,alist
' rule: #segadj.
	self fail: 'segadj,alist' rule: #segadj.
]

{ #category : #tests }
PPEsopeGrammarTest >> testSegdef [

	| segment |
	segment := '      segment,values
        character*8        valtyp
        real               valf(valnf)
        integer            vale(valne)
        logical            vall(valnl)
        character*(valsmx) valc(valnc)
        integer            vals(valnc)
      endsegment
'.
	self parse: segment rule: #segdef.
	self fail: '      segment,values' rule: #segdef
]

{ #category : #tests }
PPEsopeGrammarTest >> testSegdes [
	self parse: '      segdes,alist
' rule: #segdes.
	self fail: 'segdes,alist' rule: #segdes.
]

{ #category : #tests }
PPEsopeGrammarTest >> testSegini [
	self parse: '      segini,rlist
' rule: #segini.
	self fail: 'segini,rlist' rule: #segini.
]

{ #category : #tests }
PPEsopeGrammarTest >> testSegsup [
	self parse: '      segsup,rlist
' rule: #segsup.
	self fail: 'segsup,rlist' rule: #segsup.
]

{ #category : #tests }
PPEsopeGrammarTest >> testSmallFile [
	self parse: self class esopeSmallFile rule: #file
]

{ #category : #tests }
PPEsopeGrammarTest >> testStart [
	self parse: self class esopeSmallFile
]

{ #category : #tests }
PPEsopeGrammarTest >> testUnknownLine [
	self parse: '      subroutine test(brr)
' rule: #unknownLine.
]

{ #category : #tests }
PPEsopeGrammarTest >> testUnknownLineEmpty [
	self parse: '
' rule: #unknownLine.
]
