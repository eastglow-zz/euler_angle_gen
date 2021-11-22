

%Case2 & Case5 결정립 구조에 대해
%1) 집합조직 <111> // ND (Random // RD)
%2) 집합조직 <110> // ND (Random // RD)
%3) 집합조직 <100> // ND (Random // RD)
%4) 집합조직 <112> // ND & <111> // RD – 압연 집합조직 
%5) 집합조직 <123> // ND & <634> // RD – 압연 집합조직 
%6) 집합조직 <110> // ND & <112> // RD – 압연 집합조직


% This script includes how to model ODFs with desired orientations
% Unimodal & fiber texture will be modeled

%% Setting up the symetry
cs = crystalSymmetry('cubic');
ss = specimenSymmetry('orthorhombic');

%% Definition of specimen coordinate system
ND = vector3d(1,0,0);
RD = vector3d(0,1,0);
TD = vector3d(0,0,1);


%% ODF for 1~3 cases: fiber textures
odf1 = fibreODF(Miller(1,1,1,cs),TD,'halfwidth', 2*degree);
odf2 = fibreODF(Miller(1,1,0,cs),TD,'halfwidth', 2*degree);
odf3 = fibreODF(Miller(1,0,0,cs),TD,'halfwidth', 2*degree);

%% ODF for 4~6 cases: unimodal textures

% Preparation of a kernel for unimodal ODF
%psi = vonMisesFisherKernel('halfwidth', 2*degree);

mod4 = orientation.byMiller([1,1,2],[1,1,-1],cs,ss);
odf4 = unimodalODF(mod4, 'halfwidth', 2*degree);

mod5 = orientation.byMiller([1,2,3],[6,3,-4],cs,ss);
odf5 = unimodalODF(mod5, 'halfwidth', 2*degree);

mod6 = orientation.byMiller([1,1,0],[1,-1,2],cs,ss);
odf6 = unimodalODF(mod6, 'halfwidth', 2*degree);

