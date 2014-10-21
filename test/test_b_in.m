% test/test_b_in.m
%
% Jan Florjanczyk, 2014
%
% This script tests the functionality of the b_in(A,F) function
addpath('../m');
addpath('./controlsets');
clear; clc;

% Set the tolerance to 1e-4
tol = 1e-4;

% Let's use the test set {X,Z} and test Y and the Hadamard for membership
F        = FXZ();
Y        = [0,-1i;1i,0];
Hadamard = [1,1;1,-1]/sqrt(2);

if b_in(Y,F)
  printf('b_in(Y,{X,Z}) = True\n')
else
  printf('b_in(Y,{X,Z}) = False\n')
end

if b_in(Hadamard,F)
  printf('b_in(Hadamard,{X,Z}) = True\n')
else
  printf('b_in(Hadamard,{X,Z}) = False\n')
end
