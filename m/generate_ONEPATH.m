% generate_RESULTS.m
%
% Jan Florjanczyk, 2014
%
% Inputs: F       = the set of matrices generating the Jordan algebra
%         MIN     = Starting value for P0 grid search
%         MAX     = Stopping value for P0 grid search
%         SPACING = Spacing of P0 ndgrid
%         tol     = tolerance for pinv
%
% Outputs: RESULTS = array of structs with START, PATH, and TIME matrices
%          N       = size of the tensors
%          n       = dimension of the Jordan algebra

function [RESULT] = generate_ONEPATH(START, tol)
  
  ode_options  = odeset('RelTol', tol);

  G(:,:,1) =[
    2,      0,      0,      0,      0;
    0,      0,      0,      0,      0;
    0,      0,      0,      0,      0;
    0,      0,      0,      0,      0;
    0,      0,      0,      0,      0];
  G(:,:,2) =[
    0,      2,      0,      0,      0;
    2,      1,      0,    2/3,      0;
    0,      0,      0,      0,      0;
    0,    2/3,      0,      1,      0;
    0,      0,      0,      0,      -1];
  G(:,:,3) =[
    0,      0,      2,      0,      0;
    0,      0,      0,      0,      0;
    2,      0,      1,    2/3,      0;
    0,      0,    2/3,      1,      0;
    0,      0,      0,      0,      -1];
  G(:,:,4) =[
    0,      0,      0,      2,      0;
    0,      0,    1/3,      1,      0;
    0,      1/3,    0,      1,      0;
    2,      1,      1,    1/3,      0;
    0,      0,      0,      0,      1/3];
  G(:,:,5) =[
    0,      0,      0,      0,      2;
    0,      0,      0,      0,      1;
    0,      0,      0,      0,      1;
    0,      0,      0,      0,      2/3;
    2,      1,      1,      2/3,    0];

  g(:,:,1) = zeros(5,5);
  g(:,:,2) =[
    0,      0,      0,      0,      0;
    0,      0,      0,      0,      -2/3;
    0,      0,      0,      0,      0;
    0,      0,      0,      0,      -2;
    0,    2/3,      0,      2,      0];
  g(:,:,3) =[
    0,      0,      0,      0,      0;
    0,      0,      0,      0,      0;
    0,      0,      0,      0,      2/3;
    0,      0,      0,      0,      2;
    0,      0,      -2/3,  -2,      0];
  g(:,:,4) =[
    0,      0,      0,      0,      0;
    0,      0,      0,      0,      1;
    0,      0,      0,      0,     -1;
    0,      0,      0,      0,      0;
    0,     -1,      1,      0,      0];
  g(:,:,5) =[
    0,      0,      0,      0,      0;
    0,      0,      1/3,    1,      0;
    0,   -1/3,      0,     -1,      0;
    0,     -1,      1,      0,      0;
    0,      0,      0,      0,      0];
  
  N            = 5;
  n            = 5;

  % Grid for the search
  RESULT = struct('START', [],'PATH', [], 'TIME', []);

  [T, Y] = ode45(@(t,y) iterator(t,y,G,g), [0 12], START, ode_options);
  RESULT.START = START;
  RESULT.PATH  = Y;
  RESULT.TIME  = T;
end