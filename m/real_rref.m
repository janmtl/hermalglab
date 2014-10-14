% real_rref.m
%
% Jan Florjanczyk, 2014
%
% Inputs: A = a matrix basis
%
% Outputs: R = the reduced basis over real span coefficients

function R = real_rref(A)
  d  = size(A,2);
  n  = size(A,3);

  a = vectorize_basis(A);
  
    a = conj(a'); 
    sp = [real(a),imag(a)];
    sp = rref(sp);
    sp(all(sp==0,2),:)=[];
    a = sp(:,1:d^2) + 1i*sp(:,d^2+1:2*d^2);
    a = conj(a');

  R = unvectorize_basis(a);
end