% HERM.m
%
% Jan Florjanczyk, 2014
%
% Inputs: F = a matrix basis
%
% Outputs: H = the Hermitian part of F

function H = HERM(F)
  d   = size(F,2);
  n   = size(F,3);

  B = generate_herm_basis(d);
  b = vectorize_basis(B);
  f = vectorize_basis(F);
  pq = real_null([b,-f]);
  h = b*pq(1:d^2,:);
  H = unvectorize_basis(h);
  H = real_rref(H);
end