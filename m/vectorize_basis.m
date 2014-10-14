% vectorize_basis.m
%
% Jan Florjanczyk, 2014
%
% Inputs: A = a matrix basis
%
% Outputs: a = the matrix of vectorized columns

function a = vectorize_basis(A)
  d   = size(A,2);
  n   = size(A,3);
  for j=1:n
    a(:,j)   = reshape(A(:,:,j), d^2, 1);
  end
end