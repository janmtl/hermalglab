HermAlgLab
==========
Hermitian Algebras MatLab library (HermAlgLab) is a collection of functions to test the behaviour of matrix algebras built up from Hermitian matrices. Currently, the library has support for
- Finding the anti-commutator (Jordan) closure of a set of Hermitian matrices
- Finding the commutator (Lie) closure of a set of Hermitian matrices
- Finding the tetrad closure of a set of Hermitian matrices
- Finding the free algebra closure of a set of Hermitian matrices
- Finding the Hermitian part of any of these closures
- Simulating quadratic systems of ODEs over the underlying algebra

[Documentation](docs/main.md) is under development

Quickstart
----------
In this example we can test the Jordan and Lie closures of the set of Hermitian matrices composed of tensors of Pauli matrices `F={II, XI, XX, ZZ}`


```
I = [1,0;0,1]; X = [0,1;1,0]; Y = [0,-1i;1i,0]; Z = [1,0;0,-1];
F(:,:,1)     = kron(I,I);
F(:,:,end+1) = kron(X,I);
F(:,:,end+1) = kron(X,X);
F(:,:,end+1) = kron(Z,Z);

[J, J_level] = JORDAN(F, tol);
[L, L_level] =    LIE(F, tol);
```

Cohn Reversible Theorem
-----------------------
Testing a theorem like the Cohn Reversible Theorem (citation needed) is easy using the `b_*` functions and the various `CLOSURE` functions.

```
% Set the tolerance to 1e-4
tol = 1e-4;

% Let's use the test set of two non-orthogonal states
F = F2nonorth(1i/3);

% Cohn's reversibility theorem
A = HERM(FREE(F,tol));
B = b_join(JORDAN(F,tol), TETRADS(F,tol));
if b_eq(A,B)
  printf('Cohn reversibility theorem holds true for F.\n')
else
  printf('Cohn reversibility theorem does not hold true for F.\n')
end
```