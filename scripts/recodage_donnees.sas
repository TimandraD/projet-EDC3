libname recod '\\ad.univ-lille.fr\Etudiants\Homedir-etu\262876\Desktop\etude_de_cas\Etude_trois_cas\recodage';

/*Recodage Age*/
data recod.bdd1;
set recod.bdd;
format age_moy 3.;
if age_moyen = 1 then age_moy = 2;
if age_moyen = 2 then age_moy = 2;
if age_moyen = 3 then age_moy = 3;
if age_moyen = 4 then age_moy = 4;
if age_moyen = 5 then age_moy = 5;
if age_moyen = 6 then age_moy = 5;
run;

data verif;
set recod.bdd1;
keep age_moyen age_moy cle;
run;

data recod.bdd1;
set recod.bdd1;
drop age_moyen;
run;


/*Recodage foyer*/
proc freq data = recod.bdd1;
table nbpers_au_foyer /missing nocol norow;
run;

data recod.bdd2; 
set recod.bdd1;
format nb_foy 3.;
if nbpers_au_foyer = 0 then nb_foy = 0;
if nbpers_au_foyer = 1 then nb_foy = 1;
if nbpers_au_foyer = 2 then nb_foy = 2;
if nbpers_au_foyer = 3 then nb_foy = 3;
if nbpers_au_foyer = 4 then nb_foy = 4;
if nbpers_au_foyer = 5 then nb_foy = 4;
run;

data verif;
set recod.bdd2;
keep cle nb_foy nbpers_au_foyer;
where nbpers_au_foyer = 5 ;
run;


/*Recodage hautes Ètudes*/
data recod.bdd3;
set recod.bdd2;
format H_stud 3.;
if niv_etude_haut = 0 then H_stud = 0 ;
if niv_etude_haut = 1 then H_stud = 1 ;
if niv_etude_haut = 2 then H_stud = 2 ;
if niv_etude_haut = 3 then H_stud = 3 ;
if niv_etude_haut = 4 then H_stud = 4 ;
if niv_etude_haut = 5 then H_stud = 5 ;
if niv_etude_haut in ('6','7','8','9') then H_stud = 5 ;
run;

data verif ;
set recod.bdd3;
keep H_stud niv_etude_haut;
where niv_etude_haut = 6 ;
run;

/*Recodage moyennes Ètudes */

data recod.bdd4;
set recod.bdd3;
format M_stud 3.;
if niv_etud_moy = 0 then M_stud = 0 ;
if niv_etud_moy = 1 then M_stud = 1 ;
if niv_etud_moy = 2 then M_stud = 2 ;
if niv_etud_moy = 3 then M_stud = 3 ;
if niv_etud_moy = 4 then M_stud = 4 ;
if niv_etud_moy = 5 then M_stud = 5 ;
if niv_etud_moy in ('6','7','8','9') then M_stud = 6 ;
run;

data verif ;
set recod.bdd4;
keep M_stud niv_etud_moy;
where niv_etud_moy = 7 ;
run;

/*Recodage basses Ètudes*/
data recod.bdd4;
set recod.bdd3;
format L_stud 3.;
if niv_etud_bas = 0 then L_stud = 1 ;
if niv_etud_bas = 1 then L_stud = 1 ;
if niv_etud_bas = 2 then L_stud = 2 ;
if niv_etud_bas = 3 then L_stud = 3 ;
if niv_etud_bas = 4 then L_stud = 4 ;
if niv_etud_bas = 5 then L_stud = 5 ;
if niv_etud_bas = 6 then L_stud = 6 ;
if niv_etud_bas = 7 then L_stud = 7 ;
if niv_etud_bas = 8 then L_stud = 8 ;
if niv_etud_bas = 9 then L_stud = 8 ;
run;

data verif ;
set recod.bdd4;
keep L_stud niv_etud_bas ;
where niv_etud_bas = 9 ;
run;

			
/*Recodage pas de voiture*/

data recod.bdd5;
set recod.bdd4;
format voit0 3.;
if auto0 = 0 then voit0 = 0 ;
if auto0 = 1 then voit0 = 1 ;
if auto0 = 2 then voit0 = 2 ;
if auto0 = 3 then voit0 = 3 ;
if auto0 = 4 then voit0 = 4 ;
if auto0 = 5 then voit0 = 5 ;
if auto0 in ('6','7','8','9') then voit0 = 5 ;
run;

data verif;
set recod.bdd5;
keep auto0 voit0;
where auto0 = 7 ;
run;

/*Recodage une voiture*/
data recod.bdd6;
set recod.bdd5;
format voit1 3.;
if auto1 in ('0','1','2','3') then voit1 = 3 ;
if auto1 = 4 then voit1 = 4 ;
if auto1 = 5 then voit1 = 5 ;
if auto1 = 6 then voit1 = 6 ;
if auto1 = 7 then voit1 = 7 ;
if auto1 = 8 then voit1 = 8 ;
if auto1 = 9 then voit1 = 8 ;
run;

data verif;
set recod.bdd6; 
keep auto1 voit1;
where auto1 = 1;
run;


/*Recodage deux voitures*/
data recod.bdd7;
set recod.bdd6;
format voit2 3.;
if auto2 = 0 then voit2 = 0 ;
if auto2 = 1 then voit2 = 1 ;
if auto2 = 2 then voit2 = 2 ;
if auto2 = 3 then voit2 = 3 ;
if auto2 in ('4','5','6','7','8','9') then voit2 = 4 ;
run;

data verif;
set recod.bdd7;
keep auto2 voit2;
where auto2 = 6;
run;


/*Recodage sur la religion*/
proc freq data = recod.bdd7;
table catholique protestant autre_religion sans_religion / missing nocol norow;
run;

data recod.bdd8;
set recod.bdd7;
format catho 3.;
if catholique = 0 then catho = 0 ;
if catholique = 1 then catho = 1 ;
if catholique = 2 then catho = 2 ;
if catholique = 3 then catho = 3 ;
if catholique in ('4','5','6','7','8','9') then catho = 3 ;
run;

data verif;
set recod.bdd8;
keep catholique catho ;
where catholique = 5;
run;

data recod.bdd9;
set recod.bdd8;
format protest 3.;
if protestant in ('0','1','2') then protest = 2 ;
if protestant = 3 then protest = 3 ;
if protestant = 4 then protest = 4 ;
if protestant = 5 then protest = 5 ;
if protestant = 6 then protest = 6 ;
if protestant in ('7','8','9') then protest = 7 ;
run;

data verif;
set recod.bdd9;
keep protestant protest catho ;
where protestant = 8;
run;

data recod.bdd10;
set recod.bdd9;
format autre_r 3.;
if autre_religion = 0 then autre_r = 0 ;
if autre_religion = 1 then autre_r = 1 ;
if autre_religion = 2 then autre_r = 2 ;
if autre_religion = 3 then autre_r = 3 ;
if autre_religion in ('4','5','6','7','8','9') then autre_r = 3 ;
run;

data verif;
set recod.bdd10;
keep autre_religion autre_r ;
where autre_religion = 5;
run;


data recod.bdd11;
set recod.bdd10;
format sans_r 3.;
if sans_religion = 0 then sans_r = 0 ;
if sans_religion = 1 then sans_r = 1 ;
if sans_religion = 2 then sans_r = 2 ;
if sans_religion = 3 then sans_r = 3 ;
if sans_religion = 4 then sans_r = 4 ;
if sans_religion = 5 then sans_r = 5 ;
if sans_religion = 6 then sans_r = 6 ;
if sans_religion in ('7','8','9') then sans_r = 6 ;
run;

data verif;
set recod.bdd11;
keep sans_religion sans_r ;
where sans_religion = 7;
run;


/* Recodage MARIE */

proc freq data = recod.bdd11;
table marie / missing nocol norow; 
run;

data recod.bdd12;
set recod.bdd11;
format mari 3.;
if marie in ('0','1','2') then mari = 2 ;
if marie = 3 then mari = 3 ;
if marie = 4 then mari = 4 ;
if marie = 5 then mari = 5 ;
if marie = 6 then mari = 6 ;
if marie = 7 then mari = 7 ;
if marie = 8 then mari = 8 ;
if marie = 9 then mari = 9 ;
run;

data verif;
set recod.bdd12;
keep marie mari;
where marie = 1;
run;

/*Recodage concubin*/

proc freq data = recod.bdd12;
table concubin /missing nocol norow;
run;

data recod.bdd13;
set recod.bdd12;
format concu 3.;
if concubin = 0 then concu = 0 ;
if concubin = 1 then concu = 1 ;
if concubin = 2 then concu = 2 ;
if concubin = 3 then concu = 3 ;
if concubin in ('4','5','6','7','8','9') then concu = 3 ;
run;

data verif ;
set recod.bdd13;
keep concu concubin;
where concubin = 5;
run;

/* Recodage autre religion */

proc freq data = recod.bdd13;
table autre_relation /missing nocol norow;
run;

data recod.bdd14;
set recod.bdd13;
format autre_rela 3.;
if autre_relation = 0 then autre_rela = 0 ;
if autre_relation = 1 then autre_rela = 1 ;
if autre_relation = 2 then autre_rela = 2 ;
if autre_relation = 3 then autre_rela = 3 ;
if autre_relation = 4 then autre_rela = 4 ;
if autre_relation in ('5','6','7','8','9') then autre_rela = 5 ;
run;

data verif ;
set recod.bdd14;
keep autre_relation autre_rela;
where autre_relation = 7;
run;


/*celibataire*/

proc freq data = recod.bdd13;
table celibataire /missing nocol norow;
run;

data recod.bdd15;
set recod.bdd14;
format celib 3.;
if celibataire = 0 then celib = 0 ;
if celibataire = 1 then celib = 1 ;
if celibataire = 2 then celib = 2 ;
if celibataire = 3 then celib = 3 ;
if celibataire = 4 then celib = 4 ;
if celibataire = 5 then celib = 5 ;
if celibataire in ('6','7','8','9') then celib = 6 ;
run;

data verif ;
set recod.bdd15;
keep celibataire celib;
where celibataire = 7;
run;

/*Recodage sans enfant */

proc freq data = recod.bdd15;
table sans_enfant /missing nocol norow;
run;

data recod.bdd15;
set recod.bdd14;
format sans_enf 3.;
if sans_enfant = 0 then sans_enf = 0 ;
if sans_enfant = 1 then sans_enf = 1 ;
if sans_enfant = 2 then sans_enf = 2 ;
if sans_enfant = 3 then sans_enf = 3 ;
if sans_enfant = 4 then sans_enf = 4 ;
if sans_enfant = 5 then sans_enf = 5 ;
if sans_enfant in ('6','7','8','9') then sans_enf = 6 ;
run;

data verif ;
set recod.bdd15;
keep sans_enfant sans_enf;
where sans_enfant = 7;
run;

/*Recodage avec enfant */
proc freq data = recod.bdd15;
table avec_enfant / missing nocol norow; 
run; /*ca passe la plus petite c 10% de la plus grande*/

/*Recodage pcs top*/
proc freq data = recod.bdd15;
table PCSTOP /missing norow nocol;
run;


data recod.bdd16;
set recod.bdd15;
format PCS_TOP 3.;
if PCSTOP = 0 then PCS_TOP = 0 ;
if PCSTOP = 1 then PCS_TOP = 1 ;
if PCSTOP = 2 then PCS_TOP = 2 ;
if PCSTOP = 3 then PCS_TOP = 3 ;
if PCSTOP = 4 then PCS_TOP = 4 ;
if PCSTOP = 5 then PCS_TOP = 5 ;
if PCSTOP in ('6','7','8','9') then PCS_TOP = 6 ;
run;

data verif ;
set recod.bdd16;
keep PCSTOP PCS_TOP;
where PCSTOP = 7;
run;


/*pcs cadre*/
proc freq data = recod.bdd16;
table PCScadre /missing norow nocol;
run;

data recod.bdd17;
set recod.bdd16;
format PCS_CADRE 3.;
if PCSCADRE = 0 then PCS_CADRE = 0 ;
if PCSCADRE = 1 then PCS_CADRE = 1 ;
if PCSCADRE = 2 then PCS_CADRE = 2 ;
if PCSCADRE in ('3', '4', '5','6','7','8','9') then PCS_CADRE = 2 ;
run;

data verif ;
set recod.bdd17;
keep PCS_CADRE PCSCADRE;
where PCSCADRE = 5;
run;


/*PCS AGRI*/
proc freq data = recod.bdd17;
table PCSagri /missing norow nocol;
run;

data recod.bdd18;
set recod.bdd17;
format PCS_AGRI 3.;
if PCSagri = 0 then PCS_AGRI = 0 ;
if PCSagri = 1 then PCS_AGRI = 1 ;
if PCSagri = 2 then PCS_AGRI = 2 ;
if PCSagri in ('3', '4', '5','6','7','8','9') then PCS_AGRI = 3 ;
run;


data verif ;
set recod.bdd18;
keep PCSagri PCS_AGRI;
where PCSagri = 5;
run;

/*PCS Inter*/
proc freq data = recod.bdd18;
table PCSinter /missing norow nocol;
run;

data recod.bdd19;
set recod.bdd18;
format PCS_INTER 3.;
if PCSinter = 0 then PCS_INTER = 0 ;
if PCSinter = 1 then PCS_INTER = 1 ;
if PCSinter = 2 then PCS_INTER = 2 ;
if PCSinter = 3 then PCS_INTER = 3 ;
if PCSinter = 4 then PCS_INTER = 4 ;
if PCSinter = 5 then PCS_INTER = 5 ;
if PCSinter = 6 then PCS_INTER = 6 ;
if PCSinter in ('7','8','9') then PCS_INTER = 7 ;
run;

data verif ;
set recod.bdd19;
keep PCSinter PCS_inter;
where PCSinter = 8;
run;

/*Ouvirer quali*/

proc freq data = recod.bdd19;
table PCSouvr_quali /missing norow nocol;
run;

data recod.bdd20;
set recod.bdd19;
format PCS_OUVQUAL 3.;
if PCSouvr_quali
 = 0 then PCS_OUVQUAL = 0 ;
if PCSouvr_quali
 = 1 then PCS_OUVQUAL = 1 ;
if PCSouvr_quali
 = 2 then PCS_OUVQUAL = 2 ;
if PCSouvr_quali
 = 3 then PCS_OUVQUAL = 3 ;
if PCSouvr_quali
 = 4 then PCS_OUVQUAL = 4 ;
if PCSouvr_quali
 = 5 then PCS_OUVQUAL = 5 ;
if PCSouvr_quali
 = 6 then PCS_OUVQUAL = 6 ;
if PCSouvr_quali
 in ('7','8','9') then PCS_OUVQUAL = 6 ;
run;


data verif ;
set recod.bdd20;
keep PCS_OUVQUAL PCSouvr_quali;
where PCSouvr_quali = 8;
run;

/*revenu 1*/
proc freq data = recod.bdd21;
table rev1 /missing norow nocol;
run;

data recod.bdd21;
set recod.bdd20;
format REV1 3.;
if revenu1 = 0 then REV1 = 0 ;
if revenu1 = 1 then REV1 = 1 ;
if revenu1 = 2 then REV1 = 2 ;
if revenu1 = 3 then REV1 = 3 ;
if revenu1 = 4 then REV1 = 4 ;
if revenu1 = 5 then REV1 = 5 ;
if revenu1 = 6 then REV1 = 6 ;
if revenu1 in ('7','8','9') then REV1 = 7 ;
run;

/*revenu 2*/

proc freq data = recod.bdd22;
table rev2 /missing norow nocol;
run;


data recod.bdd22;
set recod.bdd21;
format REV2 3.;
if revenu2 = 0 then REV2 = 0 ;
if revenu2 = 1 then REV2 = 1 ;
if revenu2 = 2 then REV2 = 2 ;
if revenu2 = 3 then REV2 = 3 ;
if revenu2 = 4 then REV2 = 4 ;
if revenu2 = 5 then REV2 = 5 ;
if revenu2 = 6 then REV2 = 6 ;
if revenu2 in ('7','8','9') then REV2 = 7 ;
run;

/*revenu 3 */
proc freq data = recod.bdd23;
table rev3 /missing norow nocol;
run;

data recod.bdd23;
set recod.bdd22;
format REV3 3.;
if revenu3 = 0 then REV3 = 0 ;
if revenu3 = 1 then REV3 = 1 ;
if revenu3 = 2 then REV3 = 2 ;
if revenu3 = 3 then REV3 = 3 ;
if revenu3 = 4 then REV3 = 4 ;
if revenu3 = 5 then REV3 = 5 ;
if revenu3 = 6 then REV3 = 6 ;
if revenu3 in ('7','8','9') then REV3 = 6 ;
run;

/*revenu 4*/

proc freq data = recod.bdd24;
table rev4 /missing norow nocol;
run;

data recod.bdd24;
set recod.bdd23;
format REV4 3.;
if revenu4 = 0 then REV4 = 0 ;
if revenu4 = 1 then REV4 = 1 ;
if revenu4 = 2 then REV4 = 2 ;
if revenu4 = 3 then REV4 = 3 ;
if revenu4 = 4 then REV4 = 4 ;
if revenu4 in ('5','6','7','8','9') then REV4 = 4 ;
run;

/*revenu 5*/

proc freq data = recod.bdd24;
table revenu5 /missing norow nocol;
run;

data recod.bdd25;
set recod.bdd24;
format REV5 3.;
if revenu5 = 0 then REV5 = 0 ;
if revenu5 = 1 then REV5 = 1 ;
if revenu5 = 2 then REV5 = 2 ;
if revenu5 in ('3','4','5','6','7','8','9') then REV5 = 2 ;
run;

/*import de bdd 25 en fichier excel, suppression des erreurs et verif, reste juste quelques erreurs ‡ corriger*/

proc import datafile = "\\ad.univ-lille.fr\Etudiants\Homedir-etu\262876\Desktop\etude_de_cas\Etude_trois_cas\Post_recod\df_finale.xltx" 
out = recod.df dbms=xltx;
run;

data verif;
set recod.df;
where PCS_TOP = 0 and PCS_AGRI = 0 and PCS_INTER = 0 and PCS_OUVQUAL = 0 and PCS_CADRE = 0;
run;

data recod.df;
set recod.df;
if PCS_TOP = 0 and PCS_AGRI = 0 and PCS_INTER = 0 and PCS_OUVQUAL = 0 and PCS_CADRE = 0 then delete;
run; /*supp de 26 indivs pr lesquels on a des valeurs manquantes qui avaient Ètaient id sur R*/

data recod.df;
set recod.df;
format M_stud 3.;
if niv_etud_moy = 0 then M_stud = 0 ;
if niv_etud_moy = 1 then M_stud = 1 ;
if niv_etud_moy = 2 then M_stud = 2 ;
if niv_etud_moy = 3 then M_stud = 3 ;
if niv_etud_moy = 4 then M_stud = 4 ;
if niv_etud_moy = 5 then M_stud = 5 ;
if niv_etud_moy in ('6','7','8','9') then M_stud = 6 ;
run;

data verif ;
set recod.df;
keep M_stud niv_etud_moy;
where niv_etud_moy = 7 ;
run;


data recod.df;
set recod.df;
format celib 3.;
if celibataire = 0 then celib = 0 ;
if celibataire = 1 then celib = 1 ;
if celibataire = 2 then celib = 2 ;
if celibataire = 3 then celib = 3 ;
if celibataire = 4 then celib = 4 ;
if celibataire = 5 then celib = 5 ;
if celibataire in ('6','7','8','9') then celib = 6 ;
run;

data verif ;
set recod.df;
keep celibataire celib;
where celibataire = 7;
run;

proc freq data = recod.df;
table celib /missing nocol norow;
run;
