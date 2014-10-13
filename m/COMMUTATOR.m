% COMMUTATOR.m
%
% Jan Florjanczyk, 2014
%
% Inputs: F = the control set (left)
%         A = the algebra basis (right, must contain F)
%         varargin{1} = the tolerance for pinv
%
% Outputs: L = the set of matrices from one level of commutators

function L = COMMUTATOR(F, A, varargin)
  d   = size(F,2);
  if nargin > 1
    tol = varargin{1};
  end
  
  for j=1:size(A,3)
    L(:,:,j) = A(:,:,j);
    h(:,j)   = reshape(L(:,:,j), d^2, 1);
  end
  
    for j=1:size(F,3)
      for k=1:size(A,3)
        T = 0.5*(F(:,:,j)*A(:,:,k) - A(:,:,k)*F(:,:,j));
        t = reshape(T, d^2, 1);
        if norm(t - h*pinv(h)*t) > tol
          L(:,:,end+1) = T;
          h(:,end+1)   = reshape(T, d^2, 1);
        end
      end
    end

end