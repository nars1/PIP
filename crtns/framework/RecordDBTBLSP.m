 ; 
 ; **** Routine compiled from DATA-QWIK Filer RecordDBTBLSP ****
 ; 
 ; 02/24/2010 18:40 - pip
 ; 
 ;
 ; Record Class code for table DBTBLSP
 ;
 ; Generated by PSLRecordBuilder on 02/24/2010 at 18:40 by
 ;
vcdmNew() ; 
 N vOid
 ;  #ACCEPT DATE=02/26/2008; PGM=Dan Russell; CR=30801; Group=BYPASS
 ;*** Start of code by-passed by compiler
 S vOid=$O(vobj(""),-1)+1,vobj(vOid,-1)="RecordDBTBLSP",vobj(vOid,-2)=0,vobj(vOid)=""
 S vobj(vOid,-3)=""
 ;*** End of code by-passed by compiler ***
 ;  #ACCEPT DATE=02/26/2008; PGM=Dan Russell; CR=30801; Group=SCOPE
 Q vOid
 ;
vRCgetRecord0(v1,vfromDbSet) ; 
 N vOid
 ;  #ACCEPT DATE=02/26/2008; PGM=Dan Russell; CR=30801; Group=BYPASS
 ;*** Start of code by-passed by compiler
 S vOid=$O(vobj(""),-1)+1,vobj(vOid,-1)="RecordDBTBLSP"
 S vobj(vOid)=$G(^DBTBLSP(v1))
 I vobj(vOid)="",'($D(^DBTBLSP(v1))#2)
 S vobj(vOid,-2)=1
 I $T K vobj(vOid) S $ZE="0,"_$ZPOS_",%PSL-E-RECNOFL,,DBTBLSP",$EC=",U1001,"
 S vobj(vOid,-3)=v1
 ;*** End of code by-passed by compiler ***
 ;  #ACCEPT DATE=02/26/2008; PGM=Dan Russell; CR=30801; Group=SCOPE
 Q vOid
 ;
vRCgetRecord1(v1,vfromDbSet) ; 
 N vOid
 ;  #ACCEPT DATE=02/26/2008; PGM=Dan Russell; CR=30801; Group=BYPASS
 ;*** Start of code by-passed by compiler
 S vOid=$O(vobj(""),-1)+1,vobj(vOid,-1)="RecordDBTBLSP"
 S vobj(vOid)=$G(^DBTBLSP(v1))
 I vobj(vOid)="",'($D(^DBTBLSP(v1))#2)
 S vobj(vOid,-2)='$T
 S vobj(vOid,-3)=v1
 ;*** End of code by-passed by compiler ***
 ;  #ACCEPT DATE=02/26/2008; PGM=Dan Russell; CR=30801; Group=SCOPE
 Q vOid
 ;
vRCgetRecord0Opt(v1,vfromDbSet,v2out) ; 
 N dbtblsp
 ;  #ACCEPT DATE=02/26/2008; PGM=Dan Russell; CR=30801; Group=BYPASS
 ;*** Start of code by-passed by compiler
 S dbtblsp=$G(^DBTBLSP(v1))
 I dbtblsp="",'($D(^DBTBLSP(v1))#2)
 S v2out=1
 I $T S $ZE="0,"_$ZPOS_",%PSL-E-RECNOFL,,DBTBLSP",$EC=",U1001,"
 ;*** End of code by-passed by compiler ***
 Q dbtblsp
 ;
vRCgetRecord1Opt(v1,vfromDbSet,v2out) ; 
 N dbtblsp
 ;  #ACCEPT DATE=02/26/2008; PGM=Dan Russell; CR=30801; Group=BYPASS
 ;*** Start of code by-passed by compiler
 S dbtblsp=$G(^DBTBLSP(v1))
 I dbtblsp="",'($D(^DBTBLSP(v1))#2)
 S v2out='$T
 ;*** End of code by-passed by compiler ***
 Q dbtblsp
 ;
vBypassSave(this) ; 
 D vSave(this,"/NOJOURNAL/NOTRIGAFT/NOTRIGBEF/NOVALDD/NOVALREQ/NOVALRI/NOVALST",0)
 Q 
 ;
vSave(this,vRCparams,vauditLogSeq) ; 
 N vRCaudit N vRCauditIns
 N %O S %O=$G(vobj(this,-2))
 I ($get(vRCparams)="") S vRCparams="/CASDEL/INDEX/JOURNAL/LOG/TRIGAFT/TRIGBEF/UPDATE/VALDD/VALFK/VALREQ/VALRI/VALST/"
 I (%O=0) D
 .	D AUDIT^UCUTILN(this,.vRCauditIns,1,"|")
 .	I (("/"_vRCparams_"/")["/VALREQ/") D vRCchkReqForInsert(this)
 .	I (("/"_vRCparams_"/")["/VALDD/") D vRCvalidateDD(this,%O)
 .	D vRCmiscValidations(this,vRCparams,%O)
 .	D vRCupdateDB(this,%O,vRCparams,.vRCaudit,.vRCauditIns)
 .	Q 
 E  I (%O=1) D
 .	D AUDIT^UCUTILN(this,.vRCaudit,1,"|")
 .	I ($D(vobj(this,-100,"1*","PID"))&($P($E($G(vobj(this,-100,"1*","PID")),5,9999),$C(124))'=vobj(this,-3))) D vRCkeyChanged(this,vRCparams,.vRCaudit) Q 
 .	I (("/"_vRCparams_"/")["/VALREQ/") D vRCchkReqForUpdate(this)
 .	I (("/"_vRCparams_"/")["/VALDD/") D vRCvalidateDD1(this)
 .	D vRCmiscValidations(this,vRCparams,%O)
 .	D vRCupdateDB(this,%O,vRCparams,.vRCaudit,.vRCauditIns)
 .	Q 
 E  I (%O=2) D
 .	I (("/"_vRCparams_"/")["/VALREQ/") D vRCchkReqForInsert(this)
 .	I (("/"_vRCparams_"/")["/VALDD/") D vRCvalidateDD(this,%O)
 .	D vRCmiscValidations(this,vRCparams,2)
 .	Q 
 E  I (%O=3) D
 .	  N V1 S V1=vobj(this,-3) Q:'($D(^DBTBLSP(V1))#2) 
 .	D vRCdelete(this,vRCparams,.vRCaudit,0)
 .	Q 
 Q 
 ;
vcheckAccessRights() ; 
 Q ""
 ;
vinsertAccess(userclass) ; 
 Q 1
 ;
vinsertOK(this,userclass) ; PUBLIC access is allowed, no restrict clause
 Q 1
 ;
vupdateAccess(userclass) ; 
 Q 1
 ;
vupdateOK(this,userclass) ; PUBLIC access is allowed, no restrict clause
 Q 1
 ;
vdeleteAccess(userclass) ; 
 Q 1
 ;
vdeleteOK(this,userclass) ; PUBLIC access is allowed, no restrict clause
 Q 1
 ;
vselectAccess(userclass,restrict,from) ; 
 S (restrict,from)=""
 Q 1
 ;
vselectOK(this,userclass) ; PUBLIC access is allowed, no restrict clause
 Q 1
 ;
vselectOptmOK(userclass,dbtblsp,vkey1) ; PUBLIC access is allowed, no restrict clause
 Q 1
 ;
vgetLogging() ; 
 Q "0"
 ;
logUserclass(operation) ; 
 I (operation="INSERT") Q 0
 E  I (operation="UPDATE") Q 0
 E  I (operation="DELETE") Q 0
 E  I (operation="SELECT") Q 0
 Q 0
 ;
vlogSelect(statement,using) ; 
 Q 0
 ;
columnList() ; 
 Q $$vStrRep("HASHKEY,HVARS,LTD,PARS,PGM,PID,SPTYPE,TIME,USER",",",$char(9),0,0,"")
 ;
columnListBM() ; 
 Q $$vStrRep("SQLSTMT",",",$char(9),0,0,"")
 ;
columnListCMP() ; 
 Q $$vStrRep("SQL1,SQL10,SQL2,SQL3,SQL4,SQL5,SQL6,SQL7,SQL8,SQL9",",",$char(9),0,0,"")
 ;
getColumnMap(map) ; 
 ;
 S map(-3)="PID:T:"
 S map(-1)="HASHKEY:T:3;HVARS:T:2;LTD:D:6;PARS:T:4;PGM:T:1;SPTYPE:T:8;TIME:C:7;USER:T:5"
 S map("1,1")="SQLSTMT:M:"
 Q 
 ;
vlegacy(processMode,params) ; 
 N vTp
 I (processMode=2) D
 .	N dbtblsp S dbtblsp=$$vRCgetRecord0^RecordDBTBLSP(PID,0)
 .	S vobj(dbtblsp,-2)=2
 . S vTp=($TL=0) TS:vTp (vobj):transactionid="CS" D vSave^RecordDBTBLSP(dbtblsp,$$initPar^UCUTILN(params)) K vobj(dbtblsp,-100) S vobj(dbtblsp,-2)=1 TC:vTp  
 .	K vobj(+$G(dbtblsp)) Q 
 Q 
 ;
vhasLiterals() ; 
 Q 0
 ;
vRCmiscValidations(this,vRCparams,processMode) ; 
 I (("/"_vRCparams_"/")["/VALST/")  N V1 S V1=vobj(this,-3) I '(''($D(^DBTBLSP(V1))#2)=''processMode) D
 .	N errmsg
 .	I (+processMode'=+0) S errmsg=$$^MSG(7932)
 .	E  S errmsg=$$^MSG(2327)
 .	D throwError(errmsg)
 .	Q 
 Q 
 ;
vRCupdateDB(this,processMode,vRCparams,vRCaudit,vRCauditIns) ; 
 I '(("/"_vRCparams_"/")["/NOUPDATE/") D
 .	I (processMode=0)  S $P(vobj(this),$C(124),6)=$P($H,",",1)
 .	I (processMode=0)  S $P(vobj(this),$C(124),7)=$P($H,",",2)
 .	I (processMode=0) I '(+$P($G(vobj(this,-100,"0*","USER")),$C(124),2)&($P($E($G(vobj(this,-100,"0*","USER")),5,9999),$C(124))'=$P(vobj(this),$C(124),5)))  S $P(vobj(this),$C(124),5)=$E($$USERNAM^%ZFUNC,1,20)
 .	;   #ACCEPT DATE=04/22/04; PGM=Dan Russell; CR=20602; GROUP=BYPASS
 .	;*** Start of code by-passed by compiler
 .	if $D(vobj(this)) K:$D(vobj(this,1,1)) ^DBTBLSP(vobj(this,-3)) S ^DBTBLSP(vobj(this,-3))=vobj(this)
 .	;*** End of code by-passed by compiler ***
 .	;    #ACCEPT DATE=04/22/04; PGM=Dan Russell; CR=20602; GROUP=BYPASS
 .	;*** Start of code by-passed by compiler
 .	if $D(vobj(this,1,1)) N vS1,vS2 S vS1=0 F vS2=1:450:$ZL(vobj(this,1,1)) S vS1=vS1+1,^DBTBLSP(vobj(this,-3),vS1)=$ZE(vobj(this,1,1),vS2,vS2+449)
 .	;*** End of code by-passed by compiler ***
 .	Q 
 Q 
 ;
vRCdelete(this,vRCparams,vRCaudit,isKeyChange) ; 
 ;  #ACCEPT DATE=04/22/04; PGM=Dan Russell; CR=20602; Group=BYPASS
 ;*** Start of code by-passed by compiler
 kill ^DBTBLSP(vobj(this,-3))
 ;*** End of code by-passed by compiler ***
 Q 
 ;
vRCchkReqForInsert(this) ; 
 I (vobj(this,-3)="") D vRCrequiredErr("PID")
 Q 
 ;
vRCchkReqForUpdate(this) ; 
 I (vobj(this,-3)="") D vRCrequiredErr("PID")
 Q 
 ;
vRCrequiredErr(column) ; 
 N ER S ER=0
 N RM S RM=""
 D SETERR^DBSEXECU("DBTBLSP","MSG",1767,"DBTBLSP."_column)
 I ER D throwError($get(RM))
 Q 
 ;
vRCvalidateDD(this,processMode) ; 
 N ER S ER=0
 N RM S RM=""
 N errmsg N X
 I ($L(vobj(this,-3))>40) D vRCvalidateDDerr("PID",$$^MSG(1076,40))
 I ($L($P(vobj(this),$C(124),3))>25) D vRCvalidateDDerr("HASHKEY",$$^MSG(1076,25))
 I ($L($P(vobj(this),$C(124),2))>255) D vRCvalidateDDerr("HVARS",$$^MSG(1076,255))
 S X=$P(vobj(this),$C(124),6) I '(X=""),(X'?1.5N) D vRCvalidateDDerr("LTD",$$^MSG(742,"D"))
 I ($L($P(vobj(this),$C(124),4))>80) D vRCvalidateDDerr("PARS",$$^MSG(1076,80))
 I ($L($P(vobj(this),$C(124),1))>8) D vRCvalidateDDerr("PGM",$$^MSG(1076,8))
 I ($L($P(vobj(this),$C(124),8))>6) D vRCvalidateDDerr("SPTYPE",$$^MSG(1076,6))
 S X=$P(vobj(this),$C(124),7) I '(X=""),(X'?1.5N) D vRCvalidateDDerr("TIME",$$^MSG(742,"C"))
 I ($L($P(vobj(this),$C(124),5))>20) D vRCvalidateDDerr("USER",$$^MSG(1076,20))
 Q 
 ;
vRCvalidateDD1(this) ; 
 N ER S ER=0
 N RM S RM=""
 N errmsg N X
 I ($D(vobj(this,-100,"1*","PID"))&($P($E($G(vobj(this,-100,"1*","PID")),5,9999),$C(124))'=vobj(this,-3))) I ($L(vobj(this,-3))>40) D vRCvalidateDDerr("PID",$$^MSG(1076,40))
 I ($D(vobj(this,-100,"0*","HASHKEY"))&($P($E($G(vobj(this,-100,"0*","HASHKEY")),5,9999),$C(124))'=$P(vobj(this),$C(124),3))) I ($L($P(vobj(this),$C(124),3))>25) D vRCvalidateDDerr("HASHKEY",$$^MSG(1076,25))
 I ($D(vobj(this,-100,"0*","HVARS"))&($P($E($G(vobj(this,-100,"0*","HVARS")),5,9999),$C(124))'=$P(vobj(this),$C(124),2))) I ($L($P(vobj(this),$C(124),2))>255) D vRCvalidateDDerr("HVARS",$$^MSG(1076,255))
 I ($D(vobj(this,-100,"0*","LTD"))&($P($E($G(vobj(this,-100,"0*","LTD")),5,9999),$C(124))'=$P(vobj(this),$C(124),6))) S X=$P(vobj(this),$C(124),6) I '(X=""),(X'?1.5N) D vRCvalidateDDerr("LTD",$$^MSG(742,"D"))
 I ($D(vobj(this,-100,"0*","PARS"))&($P($E($G(vobj(this,-100,"0*","PARS")),5,9999),$C(124))'=$P(vobj(this),$C(124),4))) I ($L($P(vobj(this),$C(124),4))>80) D vRCvalidateDDerr("PARS",$$^MSG(1076,80))
 I ($D(vobj(this,-100,"0*","PGM"))&($P($E($G(vobj(this,-100,"0*","PGM")),5,9999),$C(124))'=$P(vobj(this),$C(124),1))) I ($L($P(vobj(this),$C(124),1))>8) D vRCvalidateDDerr("PGM",$$^MSG(1076,8))
 I ($D(vobj(this,-100,"0*","SPTYPE"))&($P($E($G(vobj(this,-100,"0*","SPTYPE")),5,9999),$C(124))'=$P(vobj(this),$C(124),8))) I ($L($P(vobj(this),$C(124),8))>6) D vRCvalidateDDerr("SPTYPE",$$^MSG(1076,6))
 I ($D(vobj(this,-100,"0*","TIME"))&($P($E($G(vobj(this,-100,"0*","TIME")),5,9999),$C(124))'=$P(vobj(this),$C(124),7))) S X=$P(vobj(this),$C(124),7) I '(X=""),(X'?1.5N) D vRCvalidateDDerr("TIME",$$^MSG(742,"C"))
 I ($D(vobj(this,-100,"0*","USER"))&($P($E($G(vobj(this,-100,"0*","USER")),5,9999),$C(124))'=$P(vobj(this),$C(124),5))) I ($L($P(vobj(this),$C(124),5))>20) D vRCvalidateDDerr("USER",$$^MSG(1076,20))
 Q 
 ;
vRCvalidateDDerr(column,errmsg) ; 
 N ER S ER=0
 N RM S RM=""
 D SETERR^DBSEXECU("DBTBLSP","MSG",979,"DBTBLSP."_column_" "_errmsg)
 I ER D throwError($get(RM))
 Q 
 ;
vRCtrimNumber(str) ; 
 I ($E(str,1)="0") S str=$$vStrTrim(str,-1,"0") I (str="") S str="0"
 I (str["."),($E(str,$L(str))="0") S str=$$RTCHR^%ZFUNC(str,"0") I ($E(str,$L(str))=".") S str=$E(str,1,$L(str)-1) I (str="") S str="0"
 Q str
 ;
vRCkeyChanged(this,vRCparams,vRCaudit) ; 
 N vTp
 N newkeys N oldkeys N vRCauditIns
 N newKey1 S newKey1=vobj(this,-3)
 N oldKey1 S oldKey1=$S($D(vobj(this,-100,"1*","PID")):$P($E(vobj(this,-100,"1*","PID"),5,9999),$C(124)),1:vobj(this,-3))
  N V1 S V1=vobj(this,-3) I ($D(^DBTBLSP(V1))#2) D throwError($$^MSG(2327))
 S newkeys=newKey1
 S oldkeys=oldKey1
  S vobj(this,-3)=oldKey1
 S vRCparams=$$setPar^UCUTILN(vRCparams,"NOINDEX")
 I (("/"_vRCparams_"/")["/VALREQ/") D vRCchkReqForInsert(this)
 I (("/"_vRCparams_"/")["/VALDD/") D vRCvalidateDD(this,1)
 D vRCmiscValidations(this,vRCparams,1)
 D vRCupdateDB(this,1,vRCparams,.vRCaudit,.vRCauditIns)
  S vobj(this,-3)=newKey1
 N newrec S newrec=$$vReCp1(this)
 S vobj(newrec,-2)=0
 S vTp=($TL=0) TS:vTp (vobj):transactionid="CS" D vSave^RecordDBTBLSP(newrec,$$initPar^UCUTILN($$initPar^UCUTILN("/NOVAL/NOCASDEL/NOJOURNAL/NOTRIGBEF/NOTRIGAFT/"))) K vobj(newrec,-100) S vobj(newrec,-2)=1 TC:vTp  
 D
 .	N %O S %O=1
 .	N ER S ER=0
 .	N RM S RM=""
 .	;   #ACCEPT Date=10/24/2008; Pgm=RussellDS; CR=30801; Group=ACCESS
 .	D CASUPD^DBSEXECU("DBTBLSP",oldkeys,newkeys)
 .	I ER D throwError($get(RM))
 .	Q 
  S vobj(this,-3)=oldKey1
 S vRCparams=$$initPar^UCUTILN("/NOVAL/NOCASDEL/NOJOURNAL/NOTRIGBEF/NOTRIGAFT/")
 D vRCdelete(this,vRCparams,.vRCaudit,1)
  S vobj(this,-3)=newKey1
 K vobj(+$G(newrec)) Q 
 ;
throwError(MSG) ; 
 S $ZE="0,"_$ZPOS_","_"%PSL-E-DBFILER,"_$translate(MSG,",","~"),$EC=",U1001,"
 Q 
 ; ----------------
 ;  #OPTION ResultClass 1
vStrRep(object,p1,p2,p3,p4,qt) ; String.replace
 ;
 ;  #OPTIMIZE FUNCTIONS OFF
 ;
 I p3<0 Q object
 I $L(p1)=1,$L(p2)<2,'p3,'p4,(qt="") Q $translate(object,p1,p2)
 ;
 N y S y=0
 F  S y=$$vStrFnd(object,p1,y,p4,qt) Q:y=0  D
 .	S object=$E(object,1,y-$L(p1)-1)_p2_$E(object,y,1048575)
 .	S y=y+$L(p2)-$L(p1)
 .	I p3 S p3=p3-1 I p3=0 S y=$L(object)+1
 .	Q 
 Q object
 ; ----------------
 ;  #OPTION ResultClass 1
vStrTrim(object,p1,p2) ; String.trim
 ;
 ;  #OPTIMIZE FUNCTIONS OFF
 I p1'<0 S object=$$RTCHR^%ZFUNC(object,p2)
 I p1'>0 F  Q:$E(object,1)'=p2  S object=$E(object,2,1048575)
 Q object
 ; ----------------
 ;  #OPTION ResultClass 1
vStrFnd(object,p1,p2,p3,qt) ; String.find
 ;
 ;  #OPTIMIZE FUNCTIONS OFF
 ;
 I (p1="") Q $S(p2<1:1,1:+p2)
 I p3 S object=$ZCONVERT(object,"U") S p1=$ZCONVERT(p1,"U")
 S p2=$F(object,p1,p2)
 I '(qt=""),$L($E(object,1,p2-1),qt)#2=0 D
 .	F  S p2=$F(object,p1,p2) Q:p2=0!($L($E(object,1,p2-1),qt)#2) 
 .	Q 
 Q p2
 ;
vReCp1(v1) ; RecordDBTBLSP.copy: DBTBLSP
 ;
 N vNod,vOid
 I $G(vobj(v1,-2)) D
 . N von,vol S von="",vol=$D(vobj(v1,1,1)) S:'vol vobj(v1,1,1)="" F  Q:vol  S von=$O(^DBTBLSP(vobj(v1,-3),von)) quit:von=""  S vobj(v1,1,1)=vobj(v1,1,1)_^DBTBLSP(vobj(v1,-3),von)
 S vOid=$$copy^UCGMR(v1)
 Q vOid
