% b_in.m
%
% Jan Florjanczyk, 2014
%
% Inputs: A   = matrix belonging? to the basis F
%         F   = matrix basis
%         varargin{1} = the tolerance for basis membership
%
% Outputs: IN = True if f in span(A)

function IN = b_in(A, F, varargin)
  if nargin > 2
    tol = varargin{1};
  else
    tol=1e-4;
  end
  
  f = b_vec(F);
  a = b_vec(A);

  spf = [real(f);imag(f)];
  spa = [real(a);imag(a)];

  if norm(pinv(spf)*spa) > tol
    IN=true;
  else
    IN=false;
  end
end