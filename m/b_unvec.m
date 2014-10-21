% b_unvec.m
%
% Jan Florjanczyk, 2014
%
% Inputs: a = the matrix of vectorized matrices
%
% Outputs: A = the matrix basis

function A = b_unvec(a)
  d   = sqrt(size(a,1));
  n   = size(a,2);

  A = zeros(d,d,n);
  for j=1:n
    A(:,:,j) = reshape(a(:,j), d, d);
  end
end