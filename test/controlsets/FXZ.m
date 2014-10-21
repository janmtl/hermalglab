% test/controlsets/FXZ.m
%
% Jan Florjanczyk, 2014
%
% The {X,Z} control set
% - Jordan closed
% - Lie open
% - Tetrad closed (same as Jordan closure)
function F = FXZ()
  I = [1,0;0,1]; X = [0,1;1,0]; Y = [0,-1i;1i,0]; Z = [1,0;0,-1];
  F(:,:,1)     = I;
  F(:,:,end+1) = X;
  F(:,:,end+1) = Z;
end