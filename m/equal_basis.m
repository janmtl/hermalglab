% equal_basis.m
%
% Jan Florjanczyk, 2014
%
% Inputs: A = first matrix basis
%         B = second matrix basis
%
% Outputs: EQUAL = True if span(A) = span(B)

function EQUAL = equal_basis(A, B)
  a = vectorize_basis(A);
  b = vectorize_basis(B);
  if rank(a) ~= rank(b)
    EQUAL = false;
  else if (rank([a';b']) == rank(a))
    EQUAL = true;
  else
    EQUAL = false;
  end
end