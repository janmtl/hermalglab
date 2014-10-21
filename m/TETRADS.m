% TETRADS.m
%
% Jan Florjanczyk, 2014
%
% Inputs: F = the set of matrices generating the tetrad closure
%         varargin{1} = the tolerance for pinv
%         varargin{2} = the maximum number of levels for closure
%
% Outputs: J = the set of matrices needed to satisfy the tetrad closure as a 3D-array
%          varargout{1} = the level of tetrads closures used

function [T, varargout] = TETRADS(F, varargin)
  if nargin > 1
    tol = varargin{1};
  end
  if nargin > 2
    max_level = varargin{2};    
  else
    max_level = size(F,3)^2;
  end
  
  T = F;
  
  level = 0;
  advance_level = true;
  while (advance_level == true) && (level < max_level) && (size(T,3) < 2*size(F,1)^2)
    advance_level = false;
    n = size(T,3);

    for j=1:n-3
      for k=j+1:n-2
        for l=k+1:n-1
          for m=l+1:n
            S = 0.5*(T(:,:,j)*T(:,:,k)*T(:,:,l)*T(:,:,m) + T(:,:,m)*T(:,:,l)*T(:,:,k)*T(:,:,j));
            if !b_in(S,T,tol)
              T(:,:,end+1) = S;
              if advance_level == false
                level = level + 1;
              end
              advance_level = true;
            end
          end
        end
      end
    end

  end
  
  if nargout > 0
    varargout{1} = level;
  end
end