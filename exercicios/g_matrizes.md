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
\begin{bmatrix}
0 & 1 & 0 & 0 \\
0 & 0 & 1 & 0 \\
1 & 0 & 0 & 0 \\
0 & 0 & 0 & 1 \\
\end{bmatrix}
$$

Observe que:

$$
\begin{bmatrix}
 2 & -1 & 0 \\
-1 &  2 & 0 \\
 0 &  0 & 1 \\
\end{bmatrix}
$$

Não é de permutação.

Data uma matriz $A_{nxn}$, verificar se $A$ é de permutação.

[Solução](../src/g_matrizes/ex_05.zig)

## 6
Dada uma matriz $A_{mxn}$, imprimir o número de linhas e o número de 
colunas nulas da matriz.

Exemplo: `m = 4` e `n = 4`

$$
\begin{bmatrix}
1 & 0 & 2 & 3 \\
4 & 0 & 5 & 6 \\
0 & 0 & 0 & 0 \\
0 & 0 & 0 & 0 \\
\end{bmatrix}
$$

tem 2 linhas nulas e 1 coluna nula.

[Solução](../src/g_matrizes/ex_06.zig)

## 7
Dizemos que uma matriz $A_{nxn}$ é um _quadrado mágico_ se a soma dos elementos
de cada linha, a soma dos elementos de cada coluna e a soma dos elementos das
diagonais principal e secundária são todas iguais.

Exemplo: A matriz

$$
\begin{bmatrix}
8 &  0 & 7 \\
4 &  5 & 6 \\
3 & 10 & 2 \\
\end{bmatrix}
$$

é um quadrado mágico.

Data uma matriz quadrada $A_{nxn}$, verificar se $A$ é quadrado mágico.

[Solução](../src/g_matrizes/ex_07.zig)

## 8
(MAT 83)

### a
Imprimir as `n` primeiras linhas do triângulo de Pascal.
```
1                                                                                 
1  1                                                                  
1  2  1                                                  
1  3  3  1                                  
1  4  6  4  1                  
1  5 10 10  5  1
```

### b
Imprimir as `n` primeiras linhas do triângulo de Pascal usando apenas um vetor.

[Solução](../src/g_matrizes/ex_08.zig)

## 9
(MAT 89) Um jogo de palavras cruzadas pode ser representado por uma matriz $A_{mxn}$
onde cada posição da matriz corresponde a um quadrado do jogo, sendo que `0` indica um
quadrado branco e `-1` indica um quadrado preto. Indicar na matriz as posições que são
início de palavras horizontais e/ou verticais nos quadrados correspondentes (substituindo
os zeros), considerando que uma palavra deve ter pelo menos duas letras. Para isso,
numere consecutivamente tais posições.

Exemplo: Dada a matriz

$$
\begin{bmatrix}
 0 & -1 &  0 & -1 & -1 &  0 & -1 &  0 \\
 0 &  0 &  0 &  0 & -1 &  0 &  0 &  0 \\
 0 &  0 & -1 & -1 &  0 &  0 & -1 &  0 \\
-1 &  0 &  0 &  0 &  0 & -1 &  0 &  0 \\
 0 &  0 & -1 &  0 &  0 &  0 & -1 & -1 \\
\end{bmatrix}
$$

A saída deverá ser

$$
\begin{bmatrix}
 1 & -1 &  2 & -1 & -1 &  3 & -1 &  4 \\
 5 &  6 &  0 &  0 & -1 &  7 &  0 &  0 \\
 8 &  0 & -1 & -1 &  9 &  0 & -1 &  0 \\
-1 & 10 &  0 & 11 &  0 & -1 & 12 &  0 \\
13 &  0 & -1 & 14 &  0 &  0 & -1 & -1 \\
\end{bmatrix}
$$

[Solução](../src/g_matrizes/ex_09.zig)

## 10
Uma matriz $D_{8x8}$ pode representar a posição atual de um jogo de damas, sendo que `0` indica uma casa
vazia, `1` indica uma casa ocupada por uma peça branca e `-1` indica uma casa ocupada por uma peça preta.
Supondo que as peças pretas estão se movendo no sentido crescente das linhas da matriz $D$, determinar as
posições das peças pretas que:

- a. podem tomar peças brancas;
- b. podem mover-se sem tomar peças;
- c. não podem se mover.

[Solução](../src/g_matrizes/ex_10.zig)

## 11
(FEA 85) Deseja-se atualizar as contas correntes dos clientes de uma agência bancária. É dado o cadastro
de `n` clientes contendo para cada cliente o número de sua conta e o seu saldo; o cadastro está ordenado
pelo número da conta. Em seguida, é dado o número de operações efetuadas no dia e, para cada operação, o
número da conta, uma letra **C** ou **D** indicando se a operação é de crédito ou débito e o valor da
operação . Emitir o cadastro de clientes atualizado.

[Solução](../src/g_matrizes/ex_11.zig)

## 12
(FEA 68) Deseja-se fazer a emissão da folha de pagamento de uma empresa. Para cada um dos `n` funcionários da
empresa são dadas as seguintes informações:

```
NOME
SAL (salário)
HED (horas extras diurnas)
HEN (horas extras noturnas)
ND (número de dependentes)
FAL (faltas em horas)
DE (descontos eventuais)
REF (gastos com refeições feitas na empresa)
VAL (vales retirados durante o mês).
```

Emitir as seguintes informações:

```
nome,
salário,
horas extras = HED * SAL/160 + HEN * 1.2 * SAL/160,
salário família = ND * 0.05 * salário mínimo vigente,
salário bruto = salário + horas extras + salário família.
```

Descontos efetuados:

```
INAMPS = 0.08 * SAL,
faltas = FAL * SAL/160,
refeições,
vales,
descontos eventuais,
imposto de renda = 0.08 * salário bruto.
Salário líquido = salário bruto - desconto total.
```

[Solução](../src/g_matrizes/ex_12.zig)

## 13
Um campeonato de futebol foi disputado por `n` times identificados pelos seus nomes. Para cada
time são considerados os seguintes dados:

```
PG - número de pontos ganhos (2 por vitória, 1 por empate, 0 por derrota) 
GM - número de gols marcados 
GS - número de gols sofridos (gols difíceis de marcar) 
S  - saldo de gols (GM - GS para os não atletas) 
V  - número de vitórias 
GA - gol average (GM / GS, cuidado se GS = 0 )
```

### a
Dados os resultados de `m` jogos, imprima uma tabela com todos os dados (`PG`, `GM`, `GS`, `S`, `V`, `GA`,
igual àquela que sai no jornal) dos `n` times. Cada resultado é representado na forma
($t_1$, $t_2$, $n_1$, $n_2$) cuja interpretação é a seguinte: no jogo $t_1$ x $t_2$ o resultado foi $n_1$ x $n_2$.

Exemplo: (`São Paulo`, `Milan`, `3`, `2`) que foi o placar da vitória que deu ao `São Paulo` o BICAMPEONATO MUNDIAL.

### b
Com os mesmos dados do item (a), imprima a classificação dos times no campeonato (do primeiro para o último).
A classificação é pelo número de pontos ganhos (PG) e em segundo lugar pelo saldo de gols (S).
Se houver empate segundo os dois critérios, classifique os times envolvidos como quiser (por exemplo,
pelas regras do campeonato paulista de [1975](https://pt.wikipedia.org/wiki/Campeonato_Paulista_de_Futebol_de_1975)).

### c
Um grupo de torcedores organizou um bolo sobre os resultados dos `m` jogos. Cada resultado certo vale `5` pontos
(inclusive o placar) ou `3` pontos (apenas o vencedor ou empate). Com os dados do item (a) e mais os palpites que são
compostos de `m` pares de números inteiros, onde o par representa o palpite do `i`-ésimo jogo, descubra o nome do
ganhador do bolão.

[Solução](../src/g_matrizes/ex_13.zig)

## 14
(POLI 94) Os elementos $a_{ij}$ de uma matriz inteira $A_{nxn}$ representam os custos de transporte da cidade `i` para
a cidade `j`. Dados `n` itinerários, cada um com `k` cidades, calcular o custo total para cada itinerário.

Exemplo:

$$
\begin{bmatrix}
 4 & 1 &  2 &   3 \\
 5 & 2 &  1 & 400 \\
 2 & 1 &  3 &   8 \\
 7 & 1 &  2 &   5 \\
\end{bmatrix}
$$

O custo do itinerário `0 3 1 3 3 2 1 0` é

$$
a_{03} + a_{31} + a_{13} + a_{33} + a_{32} + a_{21} + a_{10} = 3 + 1 + 400 + 5 + 2 + 1 + 5 = 417
$$

[Solução](../src/g_matrizes/ex_14.zig)

## 15
Considere `n` cidades numeradas de `0` a `n-1` que estão interligadas por uma série de estradas de mão única.
As ligações entre as cidades são representadas pelos elementos de uma matriz quadrada $L_{nxn}$, cujos elementos
$l_{ij}$ assumem o valor `1` ou `0`, conforme exista ou não estrada direta que saia da cidade $i$ e chegue à
cidade $j$. Assim, os elementos da linha $i$ indicam as estradas que saem da cidade $i$, e os elementos da
coluna $j$ indicam as estradas que chegam à cidade $j$.

Por convenção $l_{ii} = 1$. A figura mostra um exemplo para `n = 4`.

$$
\begin{bmatrix}
 1 & 1 &  1 & 0 \\
 0 & 1 &  1 & 0 \\
 1 & 0 &  1 & 1 \\
 0 & 0 &  1 & 1 \\
\end{bmatrix}
$$

```mermaid
graph LR;
    ((0)) --> ((1));
    ((0)) --> ((2));
    ((1)) --> ((2));
    ((2)) --> ((0));
    ((2)) --> ((3));
    ((3)) --> ((2));
```

### a
Dado `k`, determinar quantas estradas saem e quantas chegam à cidade `k`.

### b
A qual das cidades chega o maior número de estradas?

### c
Dado `k`, verificar se todas as ligações diretas entre a cidade `k` e outras são de mão dupla.

### d
Relacionar as cidades que possuem saídas diretas para a cidade `k`.

### e
Relacionar, se existirem:

1. As cidades isoladas, isto é, as que não têm ligação com nenhuma outra;
2. As cidades das quais não há saída, apesar de haver entrada;
3. As cidades das quais há saída sem haver entrada.

### f
Dada uma sequência de `m` inteiros cujos valores estão entre `0` e `n-1`, verificar se é possível realizar o roteiro
correspondente. No exemplo dado, o roteiro representado pela sequência `(m=5) 2 3 2 1 0` é impossível.

### g
Dados `k` e `p`, determinar se é possível ir da cidade `k` para a cidade `p` pelas estradas existentes. Você consegue
encontrar o menor caminho entre as duas cidades?

### h
Dado `k`, determinar se é possível, partindo de `k`, passar por todas as outras cidades apenas uma vez e retornar a `k`.

1. Pule esse item.
2. Teste todas as possibilidades.

---

[Todos os exercícios](../exercicios)
