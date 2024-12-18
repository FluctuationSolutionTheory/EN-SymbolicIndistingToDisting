function [] = mycommon()
syms f np1 nn1 np2 nn2 qp1 qn1 qp2 qn2 xp1 xn1 xp2 xn2 gii gjj gij d1 d2 d3 d4 d5 d6

%Example is setup for I = 1.5M CaCl2 + 0.5M NaCl consisting of 300 Ca2+ (+), 300 Na+ (+'), & 900 Cl-.

np1 = 300 %number of cations in salt I (could use molarities instead of number of molecules) 
nn1 = 600 %number of  anions in salt I
np2 = 300 %number of cations in salt I'
nn2 = 300 %number of  anions in salt I'

qp1 = +2  %charge of cation in salt I
qn1 = -1  %charge of  anion in salt I
qp2 = +1  %charge of cation in salt I'
qn2 = -1  %charge of  anion in salt I'

f = np2*qp2/(np1*qp1) 

xp1 = qn1/(qn1-qp1)
xn1 = qp1/(qp1-qn1)
xp2 = qn2/(qn2-qp2)
xn2 = qp2/(qp2-qn2)

%      ++         +-               --           +'+'        +'-            ++'      
 eq1 = 1*d1     + -(1+f)*d2     +  0*d3       + 0*d4     +  0*d5         + f*d6       == 0
 eq2 = 0*d1     +  1*d2         + -(1+f)*d3   + 0*d4     +  f*d5         + 0*d6       == 0
 eq3 = 0*d1     +  0*d2         +  0*d3       + f*d4     + -(1+f)*d5     + 1*d6       == 0
 eq4 = xp1^2*d1 +  2*xp1*xn1*d2 +  xn1^2*d3   + 0*d4     +  0*d5         + 0*d6       == gii
 eq5 = 0*d1     +  0*d2         +  xn2^2*d3   + xp2^2*d4 +  2*xn2*xp2*d5 + 0*d6       == gjj
 eq6 = 0*d1     +  xp1*xn2*d2   +  xn1*xn2*d3 + 0*d4     +  xn1*xp2*d5   + xp1*xp2*d6 == gij

[A,B] = equationsToMatrix([eq1, eq2, eq3, eq4, eq5, eq6], [d1, d2, d3, d4, d5, d6])
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
%GijTH +'-
%GijTH ++'
