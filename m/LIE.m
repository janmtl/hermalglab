% LIE.m
%
% Jan Florjanczyk, 2014
%
% Inputs: F = the set of matrices generating the Lie algebra
%         varargin{1} = the tolerance for pinv
%
% Outputs: L = the set of matrices that close the Lie alg. as a 3D-array
%          varargout{1} = the level of anti-commutator brackets used

function [L, varargout] = LIE(F, varargin)
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
    L(:,:,j) = F(:,:,j);
    h(:,j)   = reshape(F(:,:,j), d^2, 1);
  end
  
  level = 0;
  advance_level = true;
  while (advance_level == true) && (level < max_level)
    advance_level = false;
    
    for j=1:size(L,3)
      for k=1:size(L,3)
        T = 0.5*1i*(L(:,:,j)*L(:,:,k) - L(:,:,k)*L(:,:,j));
        t = reshape(T, d^2, 1);
        if norm(t - h*pinv(h)*t) > tol
          L(:,:,end+1) = T;
          h(:,end+1)   = reshape(T, d^2, 1);
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