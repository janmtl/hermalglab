% join.m
%
% Jan Florjanczyk, 2014
%
% Inputs: A = a matrix basis
%         B = a matrix basis
%
% Outputs: C = the joined matrix basis

function C = join(A, B)
  da  = size(A,2);
  na  = size(A,3);
  nb  = size(B,3);
  
  C = zeros(da,da,na+nb);
  %Diagonal matrices
  for j=1:na
    C(:,:,j) = A(:,:,j);
  end
  for j=1:nb
    C(:,:,j+na) = B(:,:,j);
  end

  C = real_rref(C);
end