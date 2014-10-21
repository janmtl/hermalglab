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
  b = b_vec(B);
  f = b_vec(F);
  pq = null_R([b,-f]);
  h = b*pq(1:d^2,:);
  H = b_unvec(h);
  H = rref_r(H);
end