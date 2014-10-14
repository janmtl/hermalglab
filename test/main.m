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

% Let's use the test set of two non-orthogonal states
F = F2nonorth(1/3);
% Find the various closures
[J, J_level] = JORDAN(F, tol);
[L, L_level] = LIE(F, tol);
[T, T_level] = TETRADS(F, tol);
[A, A_level] = FREE(F, tol);
FH           = HERM(A);

printf('Control set                    (F): %u-dimensional\n', size(F,3));
printf('Jordan closure J         JORDAN(F): %u-dimensional\n', size(J,3));
printf('Lie closure                 LIE(F): %u-dimensional\n', size(L,3));
printf('Tetrad closure           TETRAD(F): %u-dimensional\n', size(T,3));
printf('Free algebra closure       FREE(F): %u-dimensional\n', size(A,3));
printf('Herm pt of Free alg. HERM(FREE(F)): %u-dimensional\n', size(FH,3));
