% test/main.m
%
% Jan Florjanczyk, 2014
%
% This script tests the various functions of HermAlgLab
addpath('../m');
addpath('./controlsets');
clear; clc;

% Set the tolerance to 1e-4
tol = 1e-4;

% Test control set
F = F3nonorth(1/3,1/6);
printf('Control set                    (F): %u-dimensional\n', size(F,3));
fflush(stdout);

% Find the various closures
J = JORDAN(F, tol);
printf('Jordan closure J         JORDAN(F): %u-dimensional\n', size(J,3));
fflush(stdout);

L = LIE(F, tol);
printf('Lie closure                 LIE(F): %u-dimensional\n', size(L,3));
fflush(stdout);

T = TETRADS(F, tol);
printf('Tetrad closure          TETRADS(F): %u-dimensional\n', size(T,3));
fflush(stdout);

A = FREE(F, tol);
printf('Free algebra closure       FREE(F): %u-dimensional\n', size(A,3));
fflush(stdout);

FH = HERM(A);
printf('Herm pt of Free alg. HERM(FREE(F)): %u-dimensional\n', size(FH,3));
fflush(stdout);