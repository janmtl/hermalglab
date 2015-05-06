% test/controlsets/Fdiag.m
%
% Jan Florjanczyk, 2014
%
% This control set is made up of diagonal matrices
function F = Fdiag()
  I = eye(5);
  F(:,:,1)     = I;
  F(:,:,end+1) = diag([ 1, 2, 3, 4, 5 ]);
end