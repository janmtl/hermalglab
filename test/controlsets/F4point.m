% test/controlsets/F4point.m
%
% Jan Florjanczyk, 2014
%
% This control set is attempt to generate tetrad-exclusive
% terms by modeling a 4-point interaction
function F = F4point()
  I = eye(5);
  s1 = [1,1,0,0,0];
  s2 = [0,1,1,0,0];
  s3 = [0,0,1,1,0];
  s4 = [0,0,0,1,1];
  s5 = [1,0,0,0,1];
  F(:,:,1)     = I;
  F(:,:,end+1) = s1'*s1;
  F(:,:,end+1) = s2'*s2;
  F(:,:,end+1) = s3'*s3;
  F(:,:,end+1) = s4'*s4;
  F(:,:,end+1) = s5'*s5;
end