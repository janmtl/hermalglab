% generate_Gg
%
% Jan Florjanczyk, 2014
%
% Inputs: J = Jordan algebra matrices (3D array)
%         L = Lie algebra matrices(3D array)
%         varargin{1} = tolerance for pinv
%
% Outputs: G = the Jordan algebra tensor
%          g = the Lie algebra tensor

function [G,g] = generate_Gg(J, L, varargin)
  %Preamble
  if nargin>2
    tol = varargin{1};
  else
    tol = 1e-4;
  end
  N = max(size(J,3), size(L,3));
  
  %G tensor for JORDAN
  d = size(J,2);
  n = size(J,3);
  G = zeros(N,N,N);
  
  for j=1:n
    h(:,j) = reshape(J(:,:,j), d^2, 1);
  end
  H = pinv(h);
  
  for j=1:n
    for k=1:n
      T = 1/2*(J(:,:,j)*J(:,:,k) + J(:,:,k)*J(:,:,j));
      t = reshape(T, d^2, 1);
      r = H*t;
      for l=1:n
        if abs(r(l)) > tol
          G(j,k,l) = r(l);
        end
      end
    end
  end

  %g tensor for LIE
  d = size(L,2);
  n = size(L,3);
  g = zeros(N,N,N);
  
  for j=1:n
    h(:,j) = reshape(L(:,:,j), d^2, 1);
  end
  H = pinv(h);
  
  for j=1:n
    for k=1:n
      T = 1/2*(L(:,:,j)*L(:,:,k) - L(:,:,k)*L(:,:,j));
      t = reshape(T, d^2, 1);
      r = H*t;
      for l=1:n
        if abs(r(l)) > tol
          g(j,k,l) = r(l);
        end
      end
    end
  end
end