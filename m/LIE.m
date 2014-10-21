% LIE.m
%
% Jan Florjanczyk, 2014
%
% Inputs: F = the set of matrices generating the Lie algebra
%         varargin{1} = the tolerance for pinv
%         varargin{2} = the maximum number of levels for closure
%
% Outputs: L = the set of matrices that close the Lie alg. as a 3D-array
%          varargout{1} = the level of anti-commutator brackets used

function [L, varargout] = LIE(F, varargin)
  if nargin > 1
    tol = varargin{1};
  end
  if nargin > 2
    max_level = varargin{2};    
  else
    max_level = size(F,3)^2;
  end
  
  L = F;
  
  level = 0;
  advance_level = true;
  while (advance_level == true) && (level < max_level) && (size(L,3) < 2*size(F,1)^2)
    advance_level = false;
    
    for j=1:size(L,3)
      for k=1:size(L,3)
        T = 0.5*1i*(L(:,:,j)*L(:,:,k) - L(:,:,k)*L(:,:,j));
        if !b_in(T,L,tol)
          L(:,:,end+1) = T;
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