% rref_R.m
%
% Jan Florjanczyk, 2014
%
% Inputs: A = a matrix basis
%
% Outputs: R = the reduced basis over real span coefficients

function R = rref_R(A)
  d  = size(A,2);
  n  = size(A,3);

  a = b_vec(A);
  
    a = conj(a'); 
    sp = [real(a),imag(a)];
    sp = rref(sp);
    sp(all(sp==0,2),:)=[];
    a = sp(:,1:d^2) + 1i*sp(:,d^2+1:2*d^2);
    a = conj(a');

  R = b_unvec(a);
end