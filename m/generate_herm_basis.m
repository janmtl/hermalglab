% generate_herm_basis.m
%
% Jan Florjanczyk, 2014
%
% Inputs: d = dimension of the basis to be generated
%
% Outputs: B = basis for Hermitian matrices of dimension d

function B = generate_herm_basis(d)
  %Diagonal matrices
  DIAGS = zeros(d,d,d);
  for j=1:d
    DIAGS(j,j,j) = 1;
  end
  %Off-diagonal matrices
  REALS = zeros(d,d,d*(d-1)/2);
  COMPS = zeros(d,d,d*(d-1)/2);
  cc = 1;
  for j=1:(d-1)
    for k=(j+1):d
      REALS(j,k,cc) =   1;
      REALS(k,j,cc) =   1;
      COMPS(j,k,cc) =  1i;
      COMPS(k,j,cc) = -1i;
      cc = cc+1;
    end
  end

  B = b_join(DIAGS, b_join(REALS, COMPS));
end