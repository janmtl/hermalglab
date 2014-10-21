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
F = F4cycle;
printf('Control set                    (F): %u-dimensional\n', size(F,3));

% Find the various closures
J = JORDAN(F, tol);
printf('Jordan closure J         JORDAN(F): %u-dimensional\n', size(J,3));

L = LIE(F, tol);
printf('Lie closure                 LIE(F): %u-dimensional\n', size(L,3));

T = TETRADS(F, tol);
printf('Tetrad closure          TETRADS(F): %u-dimensional\n', size(T,3));

A = FREE(F, tol);
printf('Free algebra closure       FREE(F): %u-dimensional\n', size(A,3));

FH = HERM(A);
printf('Herm pt of Free alg. HERM(FREE(F)): %u-dimensional\n', size(FH,3));