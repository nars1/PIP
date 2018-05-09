%GSEL	;M Utility;Select list of globals
	;;Copyright(c)1994 Sanchez Computer Associates, Inc.  All Rights Reserved - 04/28/94 17:33:19 - SYSRUSSELL
	; ORIG:  RUSSELL -  1 NOV 1989
	;
	; Select list of globals.  List returned in %ZG.
	;
	; Modified version of GT.M %GSEL to incorporate %READ
	;
	; KEYWORDS:	Global handling
	;
	n add,beg,cnt,end,g,gd,gdf,k,out,pat,stp,%ZL
	n $zt s %ZL=$zl,$ZT="zg %ZL:ERR^%GSEL"
	d init,main
	u "":(ctrap="":exc="")
	q
GD	n add,beg,cnt,end,g,gd,gdf,k,out,pat,stp
	s cnt=0,(out,gd,gdf)=1
	d main 
	i gdf s %ZG="*" d setup,it w !,"Total of ",cnt," global",$s(cnt=1:".",1:"s."),!
	q
CALL	n add,beg,cnt,end,g,gd,gdf,k,out,pat,stp
	s (cnt,gd)=0
	i $d(%ZG)>1 s g="" f  s g=$o(%ZG(g)) q:'$l(g)  s cnt=cnt+1
	i $l($g(%ZG)) s out=0 d setup,it s %ZG=cnt q
	s out=1
	d main
	q
init	u "":(ctrap=$c(3):exc="zg %ZL:LOOP^%GSEL")
	k %ZG
	s (cnt,gd)=0,out=1
	q
main	f  d inter q:'$l(%ZG)
	s %ZG=cnt
	q
inter	S %ZG=$$PROMPT^%READ("Global:  ","") W ! q:'$l(%ZG)
	i $e(%ZG)="?" d help q
	d setup,it
	w !,$s(gd:"T",1:"Current t"),"otal of ",cnt," global",$s(cnt=1:".",1:"s."),!
	q
setup	i gd s add=1,cnt=0,g=%ZG k %ZG s %ZG=g
	e  i "'-"[$e(%ZG) s add=0,g=$e(%ZG,2,999)
	e  s add=1,g=%ZG
	s g=$tr(g," !""#$&'()+'-./;<=>?@[]\^_`{}|~")
	s g=$tr(g,$c(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,127))
	s end=$p(g,":",2),beg=$p(g,":")
	i end=beg s end=""
	q
it	s gdf=0
	i end'?."*",end']beg q
	s g=beg d pat 
	i pat["""" d start f  d search q:'$l(g)  d save
	i pat["""",'$l(end) q
	s beg=stp
	i '$l(g) s g=stp
	s pat=".E",stp="^"_$e(end)_$tr($e(end,2,9999),"%","z") d start f  d search q:'$l(g)  d save
	s g=end d pat
	i pat["""" s:beg]g g=beg d start f  d search q:'$l(g)  d save
	q	
pat	i $e(g)="%" s g="!"_$e(g,2,9999)
	s pat=g
	f  q:$l(g,"%")<2  s g=$p(g,"%",1)_"#"_$p(g,"%",2,999),pat=$p(pat,"%",1)_"""1E1"""_$p(pat,"%",2,999)
	f  q:$l(g,"*")<2  s g=$p(g,"*",1)_"$"_$p(g,"*",2,999),pat=$p(pat,"*",1)_""".E1"""_$p(pat,"*",2,999)
	i $e(g)="!" s g="%"_$e(g,2,9999),pat="%"_$e(pat,2,9999)
	i pat["""" s pat="1""^"_pat_""""
	s g="^"_$p($p(g,"#"),"$"),stp=g_$e("zzzzzzz",$l(g)-1,8)
	q
start	i g="^" s g="^%"
	i g?@pat,$d(@g) d save
	q
search	f  s g=$o(@g) s:g]stp g="" q:g?@pat!'$l(g) 
	q
save	i add,'$d(%ZG(g)) s %ZG(g)="",cnt=cnt+1 d prt:out
	i 'add,$d(%ZG(g)) k %ZG(g) s cnt=cnt-1 d prt:out
	q
prt	w:$x>70 ! w g,?$x\10+1*10
	q
help	i "Dd"[$e(%ZG,2),$l(%ZG)=2 d cur q
	w !,"<RET> to leave",!,"* for all",!,"global for 1 global",!,"global1:global2 for a range"
	w !,"* as wildcard permitting any number of characters"
	w !,"% as a single character wildcard in positions other than the first"
	i gd q
	w !,"' as the 1st character to remove routines from the list"
	w !,"?D for the currently selected globals"
	q
cur	w ! s g="" 
	f  s g=$o(%ZG(g)) q:'$l(g)  w:$x>70 ! w g,?($x\10+1*10)
	q
ERR	u "" w !,$p($ZS,",",2,999),!
	u "":(ctrap="":exc="")
	q
LOOP	d main
	u "":(ctrap="":exc="")
	q