% b_eq.m
%
% Jan Florjanczyk, 2014
%
% Inputs: A = first matrix basis
%         B = second matrix basis
%
% Outputs: EQUAL = True if span(A) = span(B)

function EQUAL = b_eq(A, B)
  a = b_vec(A);
  b = b_vec(B);
  if rank(a) ~= rank(b)
    EQUAL = false;
  else if (rank([a';b']) == rank(a))
    EQUAL = true;
  else
    EQUAL = false;
  end
end