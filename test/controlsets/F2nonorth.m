% test/controlsets/F2nonorth.m
%
% Jan Florjanczyk, 2014
%
% The control set of projectors onto two non-
% orthogonal states of overlap <1|2> = a
% - Jordan closed
% - Lie open
% - Tetrad closed (same as Jordan closure)
function F = F2nonorth(a)
  I = eye(3);
  s1 = [1,0,0];
  s2 = [a,sqrt(1-a^2),0];
  F(:,:,1)     = I;
  F(:,:,end+1) = s1'*s1;
  F(:,:,end+1) = s2'*s2;
  F(:,:,end+1) = s1'*s2 + s2'*s1;;
end