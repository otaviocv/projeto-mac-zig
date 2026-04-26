# Exercícios com Funções - Parte III

[Todos os exercícios](../exercicios)

[Link original](https://www.ime.usp.br/~macmulti/exercicios/funcoes3/index.html)

## 1
(POLI 94) Um conjunto pode ser representado por um vetor da seguinte forma:

- `V[0]` é o tamanho do conjunto;
- `V[1]`, `V[2]`, etc. são os elementos do conjunto (sem repetições).

### a
Faça uma função chamada intersecção que dados dois conjuntos de números inteiros $A$ e $B$,
constrói um terceiro conjunto $C$ que é a intersecção de $A$ e $B$. Lembre-se de que em `C[0]`
a sua função deve colocar o tamanho da intersecção.

### b
Faça um programa que lê um inteiro `n > 1` e uma sequência de `n` conjuntos de números inteiros
(cada um com no máximo 100 elementos) e constrói e imprime um vetor `INTER` que representa a
intersecção dos `n` conjuntos.

Por exemplo, se `n=3` e os conjuntos são ${1, 2, 4, 9}$, ${2, 4, 7, 8, 9}$ e ${5, 4, 9}$, a entrada será:

```
3           // O valor de n
4           // V[0] = tamanho do primeiro conjunto
1 2 4 9     // V[1]  V[2]  V[3]  V[4]
5           // V[0] = tamanho do segundo conjunto
2 4 7 8 9   // V[1]  V[2]  V[3]  V[4]  V[5]
3           // V[0] = tamanho do terceiro conjunto
5 4 9       // V[1]  V[2]  V[3]
```

E o vetor INTER construído será

```
INTER[0] = 2                tamanho do conjunto
INTER[1] = 4  INTER[2] = 9  conjunto intersecção
```

NOTE que não é preciso ler todos os conjuntos de uma só vez. Você pode ler os dois primeiros
conjuntos e calcular a primeira intersecção. Depois, leia o próximo conjunto e calcule uma
nova intesecção entre esse conjunto lido e o conjunto da intersecção anterior, e assim por diante.
Use obrigatoriamente a função do item anterior, mesmo que você não a tenha feito.

## 2

### a
Escreva uma função que lê, linha a linha, uma matriz real $A_{mxn}$.

### b
Escreva uma função que imprime uma matriz real $A_{mxn}$.

## 3

### a
Escreva uma função que calcula a soma dos elementos da linha $i$ de uma matriz real $A_{mxn}$.

### b
Escreva uma função que calcula o produto dos elementos da coluna $j$ de uma matriz real $A_{mxn}$.

## 4

### a
Escreva uma função que troca o conteúdo de duas variáveis.

### b
Escreva uma função que recebe dois inteiros, $i$ e $j$, uma matriz real Amxne troca linha $i$ pela linha $j$.
Utilize a função do item anterior.

## 5
(POLI 97)

### a
Faça uma função `MAX` que recebe como entrada um inteiro `n`, uma matriz inteira $A_{nxn}$ e devolve três
inteiros: `k`, `Lin` e `Col`. O inteiro `k` é um maior elemento de $A$ e é igual a `A[Lin,Col]`.

Exemplo:

$$
se

\begin{bmatrix}
3 & 7 & 1 \\
1 & 2 & 8 \\
5 & 3 & 4 \\
\end{bmatrix}

então 

\begin{cases}
k = 8   \\
Lin = 1 \\
Col = 2 \\
\end{cases}
$$

Obs.: Se o elemento máximo ocorrer mais de uma vez, indique em `Lin` e `Col` qualquer uma das possíveis posições.

### b
Faça um programa que, dado um inteiro `n` e uma matriz quadrada de ordem `n`, cujos elementos são todos inteiros positivos,
imprime uma tabela onde os elementos são listados em ordem decrescente, acompanhados da indicação de linha e coluna a que pertencem.
Havendo repetições de elementos na matriz, a ordem é irrelevante. Utilize obrigatoriamente o procedimento da parte (a),
mesmo que você não o tenha feito.

Exemplo: No caso da matriz acima, a saída poderia ser:

| Elem | Linha | Coluna |
|------|-------|--------|
| 8    | 1     | 2      |
| 7    | 0     | 1      |
| 5    | 2     | 0      |
| 4    | 2     | 2      |
| 3    | 0     | 0      |
| 3    | 2     | 1      |
| 2    | 1     | 1      |
| 1    | 0     | 2      |
| 1    | 1     | 0      |

## 6
Escreva uma função que recebe uma matriz de caracteres `8x8` representando um tabuleiro de xadrez e calcula o valor total das
peças do jogo. Espaços vazios do tabuleiro são codificados como casas com ` ` (branco) e têm valor `0` (zero).
O valor das demais peças é dado de acordo com a tabela

| Peça   | Valor |
|--------|-------|
| peão   | 1     |
| cavalo | 3     |
| bispo  | 3     |
| torre  | 5     |
| rainha | 10    |
| rei    | 50    |

## 7
### a
Escreva uma função que recebe como parâmetros um vetor real $A$ com `n` elementos e um vetor real $B$ com `m` elementos,
ambos representando conjuntos, e verifica se `A` está contido em `B` ($A \subseteq B$).

### b
Usando a função do item acima verifique se dois conjuntos são iguais ($A = B$ se e somente se $A \subseteq B$ e $B \subseteq A$).

## 8
### a
Escreva uma função que recebe uma matriz real $A_{mxn}$
e determina a sua transposta (Se $B$ é a matriz transposta de $A$ então $a_{ij} = b_{ji}$).

### b
Escreva uma função que calcula o produto escalar de dois vetores dados.

### c
Dada uma matriz real $X_{mxn}$, usando as funções acimas, calcule o produto $X \times X_t$.

### d
Faça uma função que verifica se uma matriz $A_{mxm}$ é a matriz identidade.

### e
Ache uma aplicação para esse exercício.

## 9
### a
Dado um vetor real $X$ com `n` elementos e um certo índice `k`, escreva uma função que determina o índice do
elemento mínimo entre `X[k], X[k+1], ..., X[n-1]`.

### b
Usando a função do item anterior coloque os elementos de um vetor em ordem crescente.

## 10
Para encontrar uma raiz de um polinômio $p(x) = a_0 + a_1x + ... + a_{n}x^n, (n > 2)$, pode-se aplicar
o método de [Newton](https://pt.wikipedia.org/wiki/M%C3%A9todo_de_Newton%E2%80%93Raphson), que consiste em
refinar uma aproximação inicial $x_0$ dessa raiz através da expressão:

$$
x_{n+1} = x_n - \frac{p(x_n)}{p'(x_n)}
$$

`n = 0, 1, 2, ...`,  onde $p'(x)$ é a primeira derivada de $p(x)$.

Usualmente, repete-se esse refinamento até que
$|x_{n+1} - x_n | < \epsilon$,
$\epsilon > 0$, ou até que `m` iterações tenham sido executadas.

Dados um polinômio $p(x) = a_0 + a_1x + ... + a_{n}x^n$, uma aproximação inicial $x_0$ da
raiz de $p(x)$, $\epsilon > 0$ e o número máximo de iterações que devem ser executadas,
determine uma aproximação da raiz de $p(x)$ pelo método de Newton.

Utilize uma função que, dado um polinômio $p(x)$, calcula a derivada $p'(x)$ e, para calcular
$p(x_n)$ e $p'(x_n)$ em cada iteração, uma função que calcula o valor de um polinômio em um ponto.

## 11
### a
Escreva uma função que recebe como parâmetros:

- dois inteiros positivos `n` e `m`;
- uma matriz $A_{nxm}$;
- o índice `c` de uma coluna;
- os índices `k` e `p` de duas linhas,

e ordena entre as linhas `k` e `p` da matriz $A$ segundo a coluna `c`.

Exemplo:

```
n=6, m=3
c=1,
k=0, p=4
```

$$
A = 
\begin{bmatrix}
 0 & 12 &  1 \\
 1 &  2 & -1 \\
 0 & -2 &  3 \\
-1 & -3 &  2 \\
 0 & 18 &  1 \\
 0 & 10 &  1 \\
\end{bmatrix}
tem como saída
\begin{bmatrix}
-1 & -3 &  2 \\
 0 & -2 &  3 \\
 1 &  2 & -1 \\
 0 & 12 &  1 \\
 0 & 18 &  1 \\
 0 & 10 &  1 \\
\end{bmatrix}
$$

### b
Dadas `n` datas em uma matriz $DATA_{nx3}$,
onde a primeira coluna corresponde ao dia,
a segunda ao mês e a terceira ao ano,
coloque essas datas em ordem cronológica crescente, usando a função acima.

Exemplo: `n = 6`,

$$
DATA = 
\begin{bmatrix}
25 &  6 & 1965 \\
16 &  6 & 1965 \\
13 & 12 & 1941 \\
21 &  4 & 1965 \\
 6 &  2 & 1989 \\
 1 & 10 & 1973 \\
\end{bmatrix}
tem como saída
\begin{bmatrix}
13 & 12 & 1941 \\
21 &  4 & 1965 \\
16 &  6 & 1965 \\
25 &  6 & 1965 \\
 1 & 10 & 1973 \\
 6 &  2 & 1989 \\
\end{bmatrix}
$$

## 12
### a
Escreva uma função que recebe como parâmetros uma matriz de caracteres
$NOMES_{mxn}$, os índices `i` e `j` de duas linhas e que troca os elementos
da linha `i` com os da linha `j`.

### b
Escreva uma função que recebe como parâmetros uma matriz $NOMES_{mxn}$,
os índices `i` e `j` de duas linhas e que devolve valor 1 se o nome na linha
`i` é maior ou igual ao da linha `j` (ordem alfabética) e 0 caso contrário.

### c
São dados `n` nomes que serão armazenados em uma matriz $NOMES_{mxn}$.
Coloque os nomes dessa matriz em ordem alfabética usando as funções descritas acima.

## 13
(FEA 88)

### a
Escreva uma função que recebe como parâmetros uma matriz real $A_{nxm}$,
e uma posição `(i,j)` da matriz, e calcula a média aritmética dos vizinhos de
`(i,j)`, ou seja, a média entre $A_{i-1,j}, A_{i+1,j}, A_{i,j+1}, A_{i,j+1}$.

Desconsidere os vizinhos que não pertencem a matriz (por exemplo, os vizinhos de
`(0, 0)` são somente `(0,1)` e `(1,0)`).

### b
Escreva uma função que recebe como parâmetro uma matriz real $A_{nxm}$ e
devolve uma matriz $A^média$, onde $a_{ij}^{média} é a média aritmética dos
vizinhos de `(i,j)`. Para isto, utilize a função do item anterior.

### c
Escreva um programa que lê uma matriz real $A_{nxm}$, e um número inteiro `k`;
utilizando a função do item anterior, o programa deve transformar a matriz `k` vezes,
imprimindo a matriz inicial e depois de cada transformação.

## 14
Dizemos que uma matriz $A_{nxn}$ é um quadrado latino de ordem `n` se em cada linha e em
cada coluna aparecem todos os inteiros `1, 2, 3, ..., n` (ou seja, cada linha e
coluna é permutação dos inteiros `1, 2, ..., n`).

Exemplo:

$$
\begin{bmatrix}
1 & 2 & 3 & 4 \\
2 & 3 & 4 & 1 \\
4 & 1 & 2 & 3 \\
3 & 4 & 1 & 2 \\
\end{bmatrix}
$$

A matriz acima é um _quadrado latino_ de ordem 4.

### a
Escreva uma função que recebe como parâmetros um inteiro `n`, um vetor `V` com `n` inteiros e
verifica se em `V` ocorrem todos os inteiros de `1` a `n`.

### b
Usando a função acima, verifique se uma dada matriz inteira $A_{nxn}$ é um quadrado latino de ordem `n`.

## 15
### a
Faça uma função que transforma um número num vetor correspondente à sua representação binária.

### b
Dados inteiros positivos `n` e `m`, e os vetores $Repr_N$ e $Repr_M$ correspondentes à representação
binária dos números `n` e `m`, considere a seguinte matriz $A$ de caracteres:

$$
a_{ij} = 
\begin{cases}
'*' se, Repr_N[i] = 1, e, Repr_M[i] = 1    \\
'\quad' caso, contrário                        \\
\end{cases}
$$

Faça um programa que recebe `n` e `m`, e constrói a matriz $A$ descrita acima, usando o item (a).

## 16
## 17
## 18
## 19
## 20
## 21
## 22
## 23
## 24
## 25

---

[Todos os exercícios](../exercicios)
