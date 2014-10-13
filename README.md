HermAlgLab
==========
Hermitian Algebras MatLab library (HermAlgLab) is a collection of functions to test the behaviour of matrix algebras built up from Hermitian matrices. Currently, the library has support for
- Testing the anti-commutator (Jordan) and commutator (Lie) closure of a set of Hermitian matrices
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