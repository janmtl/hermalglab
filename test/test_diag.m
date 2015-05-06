% test/test_diag.m
%
% Jan Florjanczyk, 2014
%
% This script tests the anti-commutator closure of a set of diagonal matrices
addpath('../m');
addpath('./controlsets');
clear; clc;

% Set the tolerance to 1e-4
tol = 1e-4;

% Test control set
F = Fdiag();
printf('Control set                    (F): %u-dimensional\n', size(F,3));
fflush(stdout);

% Find the anti-commutator closure
J = JORDAN(F, tol);
printf('Jordan closure J         JORDAN(F): %u-dimensional\n', size(J,3));
fflush(stdout);
display(J);