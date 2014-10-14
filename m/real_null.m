% real_null.m
%
% Jan Florjanczyk, 2014
%
% Inputs: A = a complex matrix
%
% Outputs: R = the nullspace restricted to real vectors

function pq = real_null(a)
  sp = [real(a);imag(a)];
  pq = null(sp);
end