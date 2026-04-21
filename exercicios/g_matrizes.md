# Exercícios com Matrizes

[Todos os exercícios](../exercicios)
[Link original](https://www.ime.usp.br/~macmulti/exercicios/matrizes/index.html)

## 1
Dada uma matriz real `A` com `m` linhas e `n` colunas e um vetor real `V` com `n` elementos,
determinar o produto de `A` por `V`.

[Solução](../src/g_matrizes/ex_01.zig)

## 5
Dizemos que uma matriz inteira $A_{nxn}$ é uma matriz de permutação se em cada
linha e em cada coluna houver `n-1` elementos nulos e um único elemento igual a `1`.
Exemplo:
A matriz abaixo é de permutação:
$$
$\begin{bmatrix}
0 & 1 & 0 & 0 \\
0 & 0 & 1 & 0 \\
1 & 0 & 0 & 0 \\
0 & 0 & 0 & 1 \\
\end{bmatrix}$
$$

Observe que:
$$
$\begin{bmatrix}
 2 & -1 & 0 \\
-1 &  2 & 0 \\
 0 &  0 & 1 \\
\end{bmatrix}$
$$
Não é de permutação.

Data uma matriz $A_{nxn}$, verificar se $A$ é de permutação.

[Solução](../src/g_matrizes/ex_05.zig)

## 6
Dada uma matriz $A_{mxn}$, imprimir o número de linhas e o número de 
colunas nulas da matriz.

Exemplo: `m = 4` e `n = 4`
$
$\begin{bmatrix}
1 & 0 & 2 & 3 \\
4 & 0 & 5 & 6 \\
0 & 0 & 0 & 0 \\
0 & 0 & 0 & 0 \\
\end{bmatrix}$
$$

tem 2 linhas nulas e 1 coluna nula.

[Solução](../src/g_matrizes/ex_06.zig)

## 7
Dizemos que uma matriz $A_{nxn}$ é um _quadrado mágico_ se a soma dos elementos
de cada linha, a soma dos elementos de cada coluna e a soma dos elementos das
diagonais principal e secundária são todas iguais.

Exemplo: A matriz
$$
$\begin{bmatrix}
8 &  0 & 7 \\
4 &  5 & 6 \\
3 & 10 & 2 \\
\end{bmatrix}$
$$
é um quadrado mágico.

Data uma matriz quadrada $A_{nxn}$, verificar se $A$ é quadrado mágico.

[Solução](../src/g_matrizes/ex_07.zig)
