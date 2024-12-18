function [] = mybinary()
syms f np1 nn1 np2 nn2 qp1 qn1 qp2 qn2 xp1 xn1 xp2 xn2 xp3 xn3 xp4 xn4 gii gjj gij gkk gll gik d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 

%Example is setup for I = 1M NaCl (I) + 1M KBr (I').

np1 = 600 %number of cations in salt I (could use molarities instead of number of molecules) 
nn1 = 600 %number of  anions in salt I
np2 = 600 %number of cations in salt I'
nn2 = 600 %number of  anions in salt I'

qp1 = +1  %charge of cation in salt I
qn1 = -1  %charge of  anion in salt I
qp2 = +1  %charge of cation in salt I'
qn2 = -1  %charge of  anion in salt I'

f = np2*qp2/(np1*qp1) 

xp1 = qn1/(qn1-qp1)
xn1 = qp1/(qp1-qn1)
xp2 = qn2/(qn2-qp2)
xn2 = qp2/(qp2-qn2)

xp3 = qn2/(qn2-qp1)
xn3 = qp1/(qp1-qn2)
xp4 = qn1/(qn1-qp2)
xn4 = qp2/(qp2-qn1)

%        ++           +-               --           +'+'            +'-'               -'-'           ++'                +-'              -+'                 --'
 eq1 = 1*d1      + -1*d2            +  0*d3      +  0*d4        +  0*d5              +  0*d6        +  f*d7            + -f*d8           +  0*d9             +  0*d10            == 0
 eq2 = 0*d1      +  1*d2            + -1*d3      +  0*d4        +  0*d5              +  0*d6        +  0*d7            +  0*d8           +  f*d9             + -f*d10            == 0
 eq3 = 0*d1      +  0*d2            +  0*d3      +  f*d4        + -f*d5              +  0*d6        +  1*d7            +  0*d8           + -1*d9             +  0*d10            == 0
 eq4 = 0*d1      +  0*d2            +  0*d3      +  0*d4        +  f*d5              + -f*d6        +  0*d7            +  1*d8           +  0*d9             + -1*d10            == 0
 
 eq5 = xp1^2*d1  +  2*xp1*xn1*d2    +  xn1^2*d3  +  0*d4        +  0*d5              +  0*d6        +  0*d7            +  0*d8           +  0*d9             +  0*d10            == gii
 eq6 = 0*d1      +  0*d2            +  0*d3      +  xp2^2*d4    +  2*xp2*xn2*d5      +  xn2^2*d6    +  0*d7            +  0*d8           +  0*d9             +  0*d10            == gjj
 eq7 = 0*d1      +  0*d2            +  0*d3      +  0*d4        +  0*d5              +  0*d6        +  xp1*xp2*d7      +  xp1*xn2*d8     +  xn1*xp2*d9       +  xn1*xn2*d10      == gij
 eq8 = xp3^2*d1  +  0*d2            +  0*d3      +  0*d4        +  0*d5              +  xn3^2*d6    +  0*d7            +  2*xp3*xn3*d8   +  0*d9             +  0*d10            == gkk
 eq9 = 0*d1      +  0*d2            +  xn4^2*d3  +  xp4^2*d4    +  0*d5              +  0*d6        +  0*d7            +  0*d8           +  2*xp4*xn4*d9     +  0*d10            == gll
 eq10= xp1*xp3*d1 + xp3*xn1*d2      +  0*d3      +  0*d4        +  0*d5              +  0*d6        +  0*d7            +  xp1*xn3*d8     +  0*d9             +  xn1*xn3*d10      == gik

[A,B] = equationsToMatrix([eq1, eq2, eq3, eq4, eq5, eq6, eq7, eq8, eq9, eq10], [d1, d2, d3, d4, d5, d6, d7, d8, d9, d10])
A
B
rank(vertcat(A,B'))
B'/A
rref(vertcat(A,B')')

myX=linsolve(A,B)

%myX is a column vector where each element is a GijTH in terms of combinations of Indistinguishable KBIs.
%The order of the elements is:
%GijTH ++
%GijTH +-
%GijTH --
%GijTH +'+'
%GijTH +'-'
%GijTH -'-'
%GijTH ++'
%GijTH +-'
%GijTH -+'
%GijTH --'
