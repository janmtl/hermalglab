% FREE.m
%
% Jan Florjanczyk, 2014
%
% Inputs: F = the set of matrices generating the free algebra closure
%         varargin{1} = the tolerance for pinv
%
% Outputs: A = the set of matrices needed to satisfy the free algebra closure as a 3D-array
%          varargout{1} = the level of free algebra closures used

function [A, varargout] = FREE(F, varargin)
  d   = size(F,2);
  n   = size(F,3);
  if nargin > 1
    tol = varargin{1};
  end
  if nargin > 2
    max_level = varargin{2};    
  else
    max_level = d^2;
  end
  
  for j=1:n
    A(:,:,j) = F(:,:,j);
    h(:,j)   = reshape(F(:,:,j), d^2, 1);
  end
  
  level = 0;
  advance_level = true;
  while (advance_level == true) && (level < max_level)
    advance_level = false;
    
    for j=1:size(A,3)
      for k=1:size(A,3)
        S = A(:,:,j)*A(:,:,k);
        s = reshape(S, d^2, 1);
        if norm(s - h*pinv(h)*s) > tol
          A(:,:,end+1) = S;
          h(:,end+1)   = reshape(S, d^2, 1);
          if advance_level == false
            level = level + 1;
          end
          advance_level = true;
        end
      end
    end

  end
  
  if nargout > 0
    varargout{1} = level;
  end
end