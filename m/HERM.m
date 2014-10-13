% HERM.m
%
% Jan Florjanczyk, 2014
%
% Inputs:  M = any matrix
%
% Outputs: H = the Hermitian part of M

function H = HERM(M)
  H = 0.5*(M + M');
end