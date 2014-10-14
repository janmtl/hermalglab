% test/cohn.m
%
% Jan Florjanczyk, 2014
%
% This script tests the Cohn reversibility theorem
addpath('../m');
addpath('./controlsets');
clear; clc;

% Set the tolerance to 1e-4
tol = 1e-4;

% Let's use the test set of two non-orthogonal states
F = F2nonorth(1i/3);

% Cohn's reversibility theorem
A = HERM(FREE(F,tol));
B = join(JORDAN(F,tol), TETRADS(F,tol));
equal_basis(A,B)
