% generate_onepath.m
%
% Jan Florjanczyk, 2014
%
% Inputs: G       = the Jordan algebra tensor
%         g       = the Lie algebra tensor
%         START   = Starting value for controls p0
%         tol     = tolerance for ode45
%
% Outputs: X      = values of the pointer variable x
%          PATH   = Values of the controls p(x) and evolution a(x)

function [X, PATH] = generate_onepath(G, g, START, tol)
  ode_options  = odeset('RelTol', tol);
  [X, PATH] = ode45(@(x,y) iterator(x,y,G,g), [0 12], START, ode_options);
end