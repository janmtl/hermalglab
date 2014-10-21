% rref_R.m
%
% Jan Florjanczyk, 2014
%
% Inputs: A = a complex matrix
%
% Outputs: R = the nullspace restricted to real vectors

function pq = null_R(a)
  sp = [real(a);imag(a)];
  pq = null(sp);
end