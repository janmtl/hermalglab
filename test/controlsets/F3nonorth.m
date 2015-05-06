% test/controlsets/F3nonorth.m
%
% Jan Florjanczyk, 2014
%
% The control set of projectors onto three non-
% orthogonal states of overlap
% - <1|2> = a
% - <1|3> = a
% - <2|3> = b
function F = F3nonorth(a,b)
  I = eye(5);
  s1 = [1/sqrt(2), 1/sqrt(2), 0        , 0                    , 0];
  s2 = [sqrt(2)*a, 0        , 1/sqrt(2), sqrt(1/2-2*conj(a)*a), 0];
  s3 = [0        , sqrt(2)*a, sqrt(2)*b, 0                    , sqrt(1-2*conj(a)*a-2*conj(b)*b)];

  F(:,:,1)     = I;

  F(:,:,end+1) = s1'*s1;
  F(:,:,end+1) = s2'*s2;
  F(:,:,end+1) = s3'*s3;

  F(:,:,end+1) = s1'*s2 + s2'*s1;
  F(:,:,end+1) = s2'*s3 + s3'*s2;
  F(:,:,end+1) = s3'*s1 + s1'*s3;
end
