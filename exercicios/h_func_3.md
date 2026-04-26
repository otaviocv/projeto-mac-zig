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
\quad
\begin{bmatrix}
3 & 7 & 1 \\
1 & 2 & 8 \\
5 & 3 & 4 \\
\end{bmatrix}
\quad
então 
\quad
\begin{cases}
k = 8   \\
Lin = 1 \\
Col = 2 \\
\end{cases}
$$

Observação: Se o elemento máximo ocorrer mais de uma vez, indique em `Lin` e `Col` qualquer uma das possíveis posições.

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
\end{bmatrix} \quad
tem \quad como \quad saída
\quad
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
\end{bmatrix} \quad
tem \quad como \quad saída
\quad
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
devolve uma matriz $A^{média}$, onde $a_{ij}^{média}$ é a média aritmética dos
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
'*' se \quad Repr_N[i] = 1 \quad e \quad  Repr_M[i] = 1    \\
'\quad' caso \quad contrário                        \\
\end{cases}
$$

Faça um programa que recebe `n` e `m`, e constrói a matriz $A$ descrita acima, usando o item (a).

## 16
(POLI 96) Dada uma matriz real quadrada $A$ de ordem `n` e um inteiro positivo `k`, define-se a aproximação
da matriz real $e^A$ pela soma abaixo:

$$
e^A = I_n + A + \frac{A^2}{2!} + \frac{A^3}{3!} + ... + \frac{A^k}{k!}
$$

Sendo $I_n$ a matriz identidade de ordem `n`.

### a
Faça uma função que recebe como parâmetros um inteiro `n` e duas matrizes quadradas reais $X$ e $Y$ de ordem `n`.
Esta função devolve em uma matriz $Z$, também passada como parâmetro, a soma das matrizes $X$ e $Y$.

### b
Escreva uma função que recebe como parâmetro um número inteiro `n`, um número real `c` e uma matriz $X_{nxn}$.
A função devolve em uma matriz $Y$, também passada como parâmetro, o produto do número `c` pela matriz $X$. Ou seja,

$$
Y_{i,j} = c X_{i,j} \quad para \quad 0 \le i \le n-1 \quad e \quad 0 \le j le n-1
$$

### c
Escreva uma função que recebe como parâmetros um inteiro `n` e duas matrizes quadradas reais $X_{nxn}$ e $Y_{nxn}$.
Esta função devolve em uma matriz $Z$, também passada como parâmetro, o produto das matrizes $X$ e $Y$.

### d
Faça um programa que, dados dois inteiros `n` e `k` e uma matriz real quadrada $A_{nxn}$, determina uma aproximação da
matriz real $e^A$ utilizando obrigatoriamente as três funções mencionadas anteriormente.

## 17
(POLI 86) Este problema consta de três partes:

### a
Escreva uma função de nome **Início** com os seguintes parâmetros de entrada:

- um vetor alfanumérico $V$ com `n` elementos;
- um inteiro `n`.

O valor da função deve ser o **índice** da posição onde se inicia a última palavra de $V$
(isto é, o índice da primeira letra dessa palavra).

Exemplo:

| E | S | S | E |   | É |   | F | Á | C | I | L | ! |
|---|---|---|---|---|---|---|---|---|---|---|---|---|

O valor da função deve ser 7.

### b
Escreva uma função de nome **Insere** com os seguintes parâmetros:

- uma matriz alfanumérica $T$;
- dois inteiros `m` e `n`;
- um inteiro `k`.

A função insere uma nova linha preenchida com brancos, entre as linhas `k` e `k+1` da matriz $T$, devolvendo a nova matriz $T_{(m+1)xn}$.

### c
Faça um programa que:
- lê e imprime dois inteiros `m` e `n` e uma matriz alfanumérica $A_{mxn}$ onde cada elemento contém um único caractere;
- elimina (conforme explicado abaixo) as "quebras" de palavras entre uma linha e outra, do texto armazenado em $A$;
- imprime o novo conteúdo da matriz $A$.

Diz-se que existe "quebra" de palavras entre uma linha e outra somente quando o último caractere da linha e o primeiro da
linha seguinte são ambos diferentes de branco.

Exemplo:

| O |   | Q | U | E |   | É |   | B | O | M |   | A |   | G | E |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| N | T | E |   | F | A | T | U | R | A | , |   | O |   | Q | U |
| E |   | É |   | R | U | I | M |   | A |   | G | E | N | T | E |
|   | E | S | C | O | N | D | E | . |   |   |   |   |   |   |   |

A eliminação da "quebra" deve ser feita inserindo-se uma nova linha, que será ocupada apenas pela palavra "quebrada".
As posições anteriormente ocupadas pela palavra devem passar a conter brancos. Supõe-se que qualquer palavra do texto
caiba inteiramente em uma linha.

No exemplo acima, o novo conteúdo da matriz $A$, após eliminar a "quebra" da palavra GENTE, seria:

| O  |   | Q | U  | E |   | É |   | B  | O  | M  |    | A  |    |    |    |
|----|---|---|----|---|---|---|---|----|----|----|----|----|----|----|----|
| G  | E | N | T  | E |   |   |   |    |    |    |    |    |    |    |    |
|    |   |   |    | F | A | T | U | R  | A  | ,  |    | O  |    | Q  | U  |
| E  |   | É |    | R | U | I | M |    | A  |    | G  | E  | N  | T  | E  |
|    | E | S | C  | O | N | D | E | .  |    |    |    |    |    |    |    |

Use obrigatoriamente as funções definidas nos itens (a) e (b) (mesmo que você não as tenha feito).

Observação: no texto existe pelo menos um branco separando duas palavras consecutivas, mesmo que elas estejam em linhas diferentes.

## 18
Considere um exame de vestibular em que as questões são do tipo teste. Deseja-se obter uma lista com o nome,
o número de identificação e o número de pontos de cada um dos candidatos, em ordem decrescente de pontos.
A resolução deste problema será dividida em três partes:

### a
Escreva uma função Pontos com os seguintes parâmetros:

- um inteiro `XN`;
- um vetor inteiro $XResp$, onde `XResp[i]` é a resposta à questão `i` dada por um candidato;
- um vetor inteiro $XGab$,  onde `XGab[i]`  é a resposta correta à questão `i`.

O valor que esta função deve assumir é o número de pontos feitos pelo candidato cujas respostas estão armazenadas em $XResp$.

### b
Escreva uma _função_ **Insere** com os seguintes parâmetros:

- um vetor $A$ contendo as informações de vários candidatos: nome,
  número de identificação e número de pontos,
  classificado em ordem decrescente pelo número de pontos;
- um inteiro `NA` que representa o número de elementos de $A$;
- _InfoCandidato_ contendo as informações de um candidato.

Esta função insere o candidato _InfoCandidato_ no vetor $A$,
de modo que os candidatos continuem armazenados por ordem decrescente de pontos.

### c
Escreva um programa que recebe como dados:

- um inteiro `n`, que representa o número de questões de um exame vestibular;
- um vetor inteiro $Gab$, contendo o gabarito das `n` questões;
- um inteiro `m`, que é o número de candidatos que prestam o vestibular;
- o nome de cada candidato, o seu número de identificação e suas respectivas respostas.

e constrói um vetor contendo o nome, o número de identificação e o número de pontos alcançados por cada candidato,
em ordem decrescente de pontos. Utilize obrigatoriamente as funções Pontos e Insere, mesmo que você não as tenha feito.

## 19
POLI 96) Uma função matemática pode ser representada por um vetor.
Por exemplo, com `n = 5` e o vetor de tamanho `n` `[0.0, 0.5, 1.0, 1.5, 2.0]` estamos representando a função
$f(i) = i/2, \quad i = 0, 1, 2, 3, 4$.

O alisamento de uma função é definido como:
 
- $ g(i) = \frac{f(i-1) + f(i) + f(i+1)}{3}, \quad para \quad 1 \le i \le n-2 $;
- $ g(0) = g(1) $;
- $ g(n-1) = g(n-2) $.

Para o exemplo acima, temos:

| 0.0     | 0.5     | 1.0 | 1.5     | 2.0     | função f        |
|---------|---------|-----|---------|---------|-----------------|
| 0.5     | 0.5     | 1.0 | 1.5     | 1.5     | alisamento g    |
| 0.66... | 0.66... | 1.0 | 1.33... | 1.33... | alisamento de g |

Observação: Não utilize variáveis globais para escrever as funções abaixo.

### a
Escreva uma função **alisa** que recebe um vetor real $F$ com `n` elementos e devolve um
vetor $G$ contendo o alisamento da função representada em $F$.

### b
Escreva uma função **realisa** que recebe `m`, `n` inteiros e um vetor $F$ de n números reais
e retorne em uma matriz de números reais $A_{mxn}$ os `m` alisamentos sucessivos da função
representada em $F$. Cada vetor deverá ser armazenado em um linha da matriz.

### c
Escreva uma função avalia que recebe os números inteiros `m`, `n` e um vetor $F$ de `n` números
reais e, utilizando obrigatoriamente a função do item anterior (se não o fez, escreva apenas
o protótipo) retorne quais são os valores máximo e mínimo da representação do `m`-ésimo alisamento
de $F$.

## 20
Simule a execução do seguinte programa, destacando a sua saída.

```c
#include <stdio.h>

/* Variavel Global */
int i;

void p1(int x)
{ 
  i = i + 1; 
  x = x + 2;
  printf("%d\n", x);
}

void p2(int *x)
{ 
  i  =  i + 1; 
  *x = *x + 2;
  printf("%d\n", *x);
}

int main()
{ 
  /* Variavel Local */
  int a[2];

  a[0] = 10; 
  a[1] = 20;
  printf("%d %d\n", a[0], a[1]);
  i = 0; 
  p1(a[i]);
  printf("%d %d\n", a[0], a[1]);
  a[0] = 10; 
  a[1] = 20;
  i = 0; 
  p2(&a[i]);
  printf("%d %d\n", a[0], a[1]);
  return 0;
}
```

[Implementação em C](../src/h_func_3/ex_20.c)

[Resultado da simulação](../src/h_func_3/ex_20_output.txt)

## 21
(POLI 87) Simule a execução do programa abaixo destacando a sua saída:

> [!NOTE]
> A função _constroi_ está faltando! Não é possível executar o código
> desse jeito.

```c
#include <stdio.h>

int main()
{ 
  int m, x, nv, i, k, achou, b[50], v[50];

  printf("Digite o tamanho da sequencia: ");
  scanf("%d", &m); 
  printf("Tamanho = %d\n", m);
  for (i = 0; i < m; i++) { 
    scanf("%d", &b[i]); 
    printf("%d ", b[i]); 
  }
  printf("\n");
  i = 0; 
  achou = 0;
  while (!achou && (i<m)) { 
    constroi(b, m, b[i], v, &nv);
    printf("Elemento = %d\n", b[i]);
    for (k = 0; k < nv; k++) 
      printf("%d ", v[k]);
    printf("\n"); 
    printf("Total = %d\n", nv);
    if (nv == m/2) 
      achou = 1;
    else 
      i = i + 1; 
  } 
  if (achou) {  
    printf("Achou o %d\n", b[i]);
    for (k = 0; k < nv; k++) 
      printf("%d ", b[v[k]]);
    printf("\n");
  } 
  constroi(b, m, 20, v, &nv);
  printf("Elemento = 20\n");
  for (k = 0; k < nv; k++) 
    printf("%d ", v[k]);
  printf("\n"); 
  return 0;
}
```

Dados:
```
6
25 13 18 37 12 10
```

[Implementação em C](../src/h_func_3/ex_21.c)

[Resultado da simulação](../src/h_func_3/ex_21_output.txt)

## 22
(POLI 88) Simule a execução do programa abaixo destacando a sua saída:

```c
#include <stdio.h>
#define max 50

void imprime(int a[][max], int n)
{ 
  int i, j;
  for (i = 0; i < n; i++) { 
    for (j = 0; j < n; j++) 
      printf("%2d ", a[i][j]);
    printf("\n");
  }
}

void soma(int a[][max], int b[][max], int n)
{ 
  int i, j;

  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++) 
      a[i][j] = a[i][j] + b[i][j]; 
}

int main()
{ 
  int i, j, n, a[max][max], b[max][max];

  printf("Digite n: ");
  scanf("%d", &n); 
  printf("n = %d\n", n);
  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++)
      scanf("%d", &a[i][j]);
  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++)
      scanf("%d", &b[i][j]);
  imprime(a, n); 
  imprime(b, n);  
  soma(a, b, n);
  imprime(a, n); 
  imprime(b, n);
  return 0;
}
```

Dados:
```
2
4 1
-2 8
2 -1
5 4
```

[Implementação em C](../src/h_func_3/ex_22.c)

[Resultado da simulação](../src/h_func_3/ex_22_output.txt)

## 23
(POLI 96) Simule a execução do seguinte programa, mostrando todos os valores intermediários gerados
para cada variável e destacando a sua saída.

```c
#include <stdio.h>

int g;

int fa(int m[20][20], int a, int cte, int *p1, int p2)
{ 
  int i, j;

  g = *p1;
  *p1 = p2;
  p2 = g;
  for (i = 0; i < a; i++)
    for (j = 0; j < a; j++)
      m[i][j] = (3*i+j+cte)%5;
  printf("%d %d\n", m[0][0], m[0][1]);
  printf("%d %d\n", m[0][0], m[0][1]);
  printf("%d %d %d\n", g, *p1, p2);
  return(cte);
}

void flin(int m[], int i)
{ 
  int g;
 
  for (g = 0; g < i; g++) 
    printf("%d ", m[g]);
  printf("\n");
}

void fpr(int m[20][20], int a)
{
  int i;

  for (i = 0; i < a; i++) 
    flin(m[i], a);
}

int main()
{ 
  int m[20][20], p1, p2, i, num;
  char c, s[20];
  float x, y;

  g = 0;
  printf("Digite um numero: ");
  scanf("%d", &num);
  printf("num = %d, g = %d\n", num, g);
  p1 = 1;
  p2 = 3;
  m[0][0] = 1;
  m[0][1] = 0;
  m[1][0] = 0;
  m[1][1] = 1;
  fpr(m, 2);
  printf("g = %d\n", g);
  i = fa(m, 2, num, &p1, p2);
  printf("%d %d %d %d\n", g, p1, p2, i);
  printf("%d %d\n", m[0][0], m[0][1]);
  printf("%d %d\n", m[0][0], m[0][1]);
  c = 'a' + num + 1; 
  printf("%c\n", c);
  x = 5;
  p2 = 3;
  x = x/2;
  y = p2/2;
  printf("x = %3.1f, y = %3.1f\n", x, y);
  s[0] = 'a';
  s[1] = 'b';
  s[2] = 'c';
  s[3] = 'd';
  s[4] = 'e';
  s[5] = 'f';
  s[6] = '\0';
  printf("s = %s\n", s);
  s[2+num%3] = '\0';
  printf("s = %s\n", s);  
  return 0;
}
```

Dados:
```
6
```

[Implementação em C](../src/h_func_3/ex_23.c)

[Resultado da simulação](../src/h_func_3/ex_23_output.txt)

## 24
(POLI 87) Simule a execução do programa abaixo destacando a sua saída:
```
#include <stdio.h>
#define max 50

int indmax(float v[], int n)
{ 
  int j, indice;

  indice = 0;
  for (j = 1; j < n; j++)
    if (v[j] > v[indice]) 
      indice = j;
  return(indice);
}

void roda(float v[], int n, int imaior)
{ 
  int j, k; 
  float x[max];

  k = imaior;
  for (j = 0; j < k;   j++) 
    x[j] = v[j];
  for (j = 0; j < n-k; j++) 
    v[j] = v[j+k];
  for (j = 0; j < k;   j++) 
    v[n-k+j] = x[j];
}

int main()
{ 
  int i, m, n, l, c, imaior;
  float v[max], aux[max], a[max][max];

  printf("Digite m e n.\n");
  scanf("%d %d", &m, &n); 
  printf("m = %d   n = %d\n", m, n);
  printf("Digite uma matriz mxn.\n");
  for (l = 0; l < m; l++) { 
    for (c = 0; c < n; c++) { 
      scanf("%f", &a[l][c]); 
      printf("%4.1f ", a[l][c]); 
    }
    printf("\n");
  }
  for (l = 0; l < m; l++) { 
    for (i = 0; i < n; i++) 
      aux[i] = a[l][i];
    imaior = indmax(aux, n); 
    printf("%d\n", imaior);
    roda(aux, n, imaior);
    for (i = 0; i < n; i++)
      a[l][i] = aux[i]; 
    for (c = 0; c < n; c++) 
      printf("%4.1f ", a[l][c]);
    printf("\n");
  }
  for (l = 0; l < m; l++) 
    v[l] = a[l][0];
  imaior = indmax(v, m);
  printf("\n%4.1f\n", a[imaior][0]);
  return 0;
}
```

Dados:
```
3 4
1.9 1.0 -1.7 1.6
0.0 2.5 -2.8 -3.5
-0.5 -2.0 1.3 1.0
```

[Implementação em C](../src/h_func_3/ex_24.c)

[Resultado da simulação](../src/h_func_3/ex_24_output.txt)

## 25
Considere as seguintes declarações:

```
void m(int x[][2], int y[][2], int z[][2])
{ 
  z[0][0] = x[0][0] * y[0][0] + x[0][1] * y[1][0];
  z[0][1] = x[0][0] * y[0][1] + x[0][1] * y[1][1];
  z[1][0] = x[1][0] * y[0][0] + x[1][1] * y[1][0];
  z[1][1] = x[1][0] * y[0][1] + x[1][1] * y[1][1];
}
```

Dados: 

$$
A = 
\begin{bmatrix}
2 & 1 \\
-1 & 3 \\
\end{bmatrix}
\quad
e 
\quad
B = 
\begin{bmatrix}
3 & -1 \\
1 & 2 \\
\end{bmatrix}
$$

Simule as seguintes chamadas da função acima:
- a. `m(A, B, C)`;
- b. `m(A, B, A)`;
- c. `m(A, B, B)`.

---

[Todos os exercícios](../exercicios)
