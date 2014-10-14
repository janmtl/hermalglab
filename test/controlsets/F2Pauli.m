% test/controlsets/F2Pauli.m
%
% Jan Florjanczyk, 2014
%
% The "2-Pauli" control set
% - Jordan closed
% - Lie open
% - Tetrad closed (same as Jordan closure)
function F = F2Pauli()
  I = [1,0;0,1]; X = [0,1;1,0]; Y = [0,-1i;1i,0]; Z = [1,0;0,-1];
  F(:,:,1)     = kron(I,I);
  F(:,:,end+1) = kron(X,I);
  F(:,:,end+1) = kron(I,X);
  F(:,:,end+1) = kron(X,X);
  F(:,:,end+1) = kron(Z,Z);
  F(:,:,end+1) = kron(Y,Y);
end