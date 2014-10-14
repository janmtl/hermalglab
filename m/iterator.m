% iterator.m
%
% Jan Florjanczyk, 2014
%
% Inputs: x = pointer variable
%         y = the concatenated vector of controls p, and evolution a
%         G = the Jordan algebra tensor
%         g = the Lie algebra tensor
%
% Outputs: dy = the iterator for the ode solver

function dy = iterator(x,y,G,g)
  n = size(G,1);

  p  = y(1:n);
  a  = y(n+1:2*n);
  dp = zeros(n,1);
  da = zeros(n,1);
  
  %Reversibility equations
  for j=1:n
    dp(j) = p'*G(:,:,j)*p;
  end
  
  %Evolutions equations
  for j=1:n
    da(j) = p'*(G(:,:,j)+g(:,:,j))*a;
  end
  
  dy = [dp;da];
end









