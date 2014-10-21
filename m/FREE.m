% FREE.m
%
% Jan Florjanczyk, 2014
%
% Inputs: F = the set of matrices generating the free algebra closure
%         varargin{1} = the tolerance for pinv
%         varargin{2} = the maximum number of levels for closure
%
% Outputs: A = the set of matrices needed to satisfy the free algebra closure as a 3D-array
%          varargout{1} = the level of free algebra closures used

function [A, varargout] = FREE(F, varargin)
  if nargin > 1
    tol = varargin{1};
  end
  if nargin > 2
    max_level = varargin{2};    
  else
    max_level = size(F,3)^2;
  end
  
  A = F;
  
  level = 0;
  advance_level = true;
  while (advance_level == true) && (level < max_level) && (size(A,3) < 2*size(F,1)^2)
    advance_level = false;
    
    for j=1:size(A,3)
      for k=1:size(A,3)
        S = A(:,:,j)*A(:,:,k);
        if !b_in(S,A,tol)
          A(:,:,end+1) = S;
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