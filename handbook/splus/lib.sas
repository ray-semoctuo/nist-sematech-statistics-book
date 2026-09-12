%let path =  ~/detwiler/permsas;
libname library;
libname library "&path";
goptions reset=symbol;
options ls=125 pageno=1;
&s1; &s2; &s3; &s4; &s5;
%let opt = frame haxis=axis99;
%let title = Silica Fume Concrete for Bridge Decks;
%let client = Rachel Detwiler  Dave Whiting  CTL;
%let crackfac = wc 0.35 0.40 0.45   sf 0 6 9 %   Cure 1 7 days   Round A B C D E;
%let ftitle = Full-depth (F);
%let otitle = Overlay (O);
%let ktitle = Type K cement (K);
%let stitle = Slurry (S);
%let fktitle = Full-depth: Type I (F) vs. Type K (K);
%let ostitle = Overlay: Dry (O) vs. Slurry (S);
%let sflo = 0; %let sfhi = 12;
%let fwclo = 0.35; %let fwchi = 0.45;
%let kwclo = 0.35; %let kwchi = 0.45;
%let owclo = 0.30; %let owchi = 0.40;
%let swclo = 0.30; %let swchi = 0.40;
%let x1lo = -1.42; %let x1hi = 1.42;
%let fx2lo = -1.42; %let fx2hi = 1.42;
%let ox2lo = -1.42; %let ox2hi = 1.42;
%let sx2lo = -1.42; %let sx2hi = 1.42;
%let kx2lo = -1.42; %let kx2hi = 1.42;

%let sforder = order = (0 to 12 by 1);
%let fwcorder = order = (0.35 to 0.45 by 0.02); 
%let fkmix1 = 1; %let fkmix2 = 4; %let fkmix3 = 6; %let fkmix4 = 9;
%let osmix1 = 5; %let osmix2 = 7; %let osmix3 = 8; %let osmix4 = 9;

%let ccdf = library.ccdf;
%let ccdo = library.ccdo;
%let ccds = library.ccds;
%let ccdk = library.ccdk;

%let f = library.f;
%let o = library.o;
%let k = library.k;
%let s = library.s;
%let fk = library.fk;
%let os = library.os;

%let crack = library.crack;
%let crack1 = library.crack1;
%let crack7 = library.crack7;
%let mcrack = library.mcrack;

%let f_str = 7.1;
%let str7 = 7-day strength (psi);

%let str28old = 28-day strength (psi);
%let str28 = 28-day strength (MPa);
%let lfstr28 = 30 to 58 by 4;
%let oostr28 = ('2OC','8OC');
%let lostr28 = 40 to 76 by 4;

%let str56 = 56-day strength (psi);
%let str90old = 90-day strength (psi);
%let str90 = 90-day strength (MPa);
%let lstr90 = ln(&str90);
%let lflstr90 = 3.57 to 4.07 by 0.05;
%let lolstr90 = 3.85 to 4.40 by 0.05;

%let shr4d = 4-day shrinkage, %;
%let lfshr4d = 0.015 to 0.026 by 0.001;
%let loshr4d = 0.021 to 0.034 by 0.001;
* Contour levels with outlier 5OB deleted;
%let loshr4d = 0.015 to 0.035 by 0.002;
%let ooshr4d = ('5OB');
%let shr1w = 1-week shrinkage, %;
%let shr2w = 2-week shrinkage, %;
%let shr4w = 4-week shrinkage, %;
%let shr8w = 8-week shrinkage, %;
%let shr16w = 16-week shrinkage, %;
%let lfshr16w = 0.045 to 0.069 by 0.003;
%let ofshr16w = ('6FA','8FA');
%let fshr16w = 0.047 to 0.067 by 0.0025;
%let loshr16w = 0.067 to 0.083 by 0.002;
%let shr44w = 44-week shrinkage, %;
%let shr64w = 64-week shrinkage, %;
%let lfshr64w = 0.049 to 0.073 by 0.002;
%let loshr64w = 0.069 to 0.085 by 0.002;

%let dc = Diffusivity coefficient (10**-13) m**2/sec;
%let f_dc = 6.2;
%let ofdc = ('2FA','3FA');
%let oflogdc = ('2FA','3FA');
%let logdc = Log Base 10 (&dc);
%let f_logdc = 6.3;
%let fkdc = 0 to 60 by 10;
%let osdc = 5 to 16 by 1;
%let fklogdc = 0.9 to 1.8 by 0.1;
%let oslogdc = 0.70 to 1.20 by 0.10;

%let lflogdc = 0.95 to 1.75 by 0.1;
%let lologdc = 0.65 to 1.85 by 0.1;

*%let crack = Days to Cracking;

%let mod28 = 28-day modulus (GPa);
%let lfmod28 = 28 to 39 by 1;
%let lomod28 = 32 to 42 by 1;
%let lomod28 = 32.5 to 42.5 by 1;
%let mod90 = 90-day modulus (10**4 psi);
%let lfmod90 = 480 to 570 by 10;
%let lomod90 = 505 to 615 by 10;
