# Exercícios com Funções - Parte II

[Todos os exercícios](../exercicios)
[Link original](https://www.ime.usp.br/~macmulti/exercicios/funcoes2/index.html)

## 1
### a
Escreva uma função que recebe um número inteiro `n > 0` e devolve o número
de dígitos de `n` e o primeiro dígito de `n`.
### b
Escreva um programa que leia uma sequência de `n` inteiros positivos e
imprime o número de dígitos e o primeiro dígito de cada um deles.

[Solução](../src/e_func_2/ex_01.zig)

## 2
### a
Escreva uma função que recebe como parâmetro um inteiro positivo ano e devolve
- `1` se ano for bissexto,
- `0` em caso contrário.

(Um ano é bissexto se `(ano % 4 == 0 && (ano % 100 != 0 || ano % 400 == 0))`.)

### b
Escreva uma função que tem como parâmetros de entrada e saída três números inteiros,
dia, mes e ano, representando uma data, e modifica esses inteiros de forma que
eles representem o dia seguinte.

### c
Escreva um programa que leia um inteiro positivo `n` e uma sequência de `n` datas
e imprime, para cada data, o dia seguinte.

[Solução](../src/e_func_2/ex_02.zig)

## 3
### a
Escreva uma função de cabeçalho `int divide (int *m, int *n, int d)` que recebe 
três inteiros positivos como parâmetros e devolve `1` se `d` divide pelo menos um
entre `*m` e `*n`, `0` caso contrário. Fora isso, se `d` divide `*m`, divide `*m` por `d`,
e o mesmo para o `*n`.

### b
Escreva um programa que lê dois inteiros positivos `m` e `n` e calcula, usando
a função acima, o mínimo múltiplo comum entre `m` e `n`, ou seja, `mmc(m,n)`.

[Solução](../src/e_func_2/ex_03.zig)

## 4
### a
Escreva uma função com protótipo `void somabit (int b1, int b2, int *vaium, int *soma)`;
que recebe três bits (inteiros entre 0 e 1) `b1`, `b2` e `*vaium` e devolve um bit
soma representando a soma dos três e o novo um bit "vai-um" em `*vaium`.

### b
Escreva um programa que leia dois números em binário e calcula um número em
binário que é a soma dos dois números dados. Utilize a função acima.

[Solução](../src/e_func_2/ex_04.zig)

## 5
### a
Escreva uma função com o protótipo
`void converte (char ch, int *tipo, char *valor);`
que recebe um caractere `ch` e devolve em `*tipo` `0`, se o caractere for um
número inteiro, `1` se for uma letra (maiúscula ou minúscula) e `2` caso
contrário; e além disso, no caso de ser uma letra, converte para
maiúscula, senão devolve ch inalterado.

### b
Escreva um programa que leia uma sequência de `n` caracteres e imprima a
sequência convertida para maiúscula, eliminando os caracteres que não
forem letras ou números.

[Solução](../src/e_func_2/ex_05.zig)

## 6
(POLI 94) Considere as seguintes fórmulas de recorrências:
$$
  F_1 = 2;                               G_1 = 1;
  F_2 = 1;                               G_2 = 2;
  F_i = 2 * F_{i-1} + G_{i-2}, i >= 3    G_i = G_{i-1} + 3 * F_{i_2}, i >= 3
$$

Podemos então montar a seguinte tabela:
 ┌────┬───┬───┬───┬────┬────┐
 │ i  │ 1 │ 2 │ 3 │  4 │  5 │
 ├────┼───┼───┼───┼────┼────┤
 │ Fi │ 2 │ 1 │ 3 │  8 │ 24 │
 ├────┼───┼───┼───┼────┼────┤
 │ Gi │ 1 │ 2 │ 8 │ 11 │ 20 │
 └────┴───┴───┴───┴────┴────┘

Este exercício está dividido em três partes.
### a
Só para ver se você entendeu as fórmulas, qual é o valor de $F_6$ e $G_6$?

### b
Faça uma função de nome valor que recebe um inteiro `k > 1` e devolve $F_k e $G_k.
Exemplo:
- Para `k=2`, a função deve devolver os valores `1` e `2`.
- Para `k=3`, a função deve devolver os valores `3` e `8`.
- Para `k=4`, a função deve devolver os valores `8` e `11`.

### c
Faça um programa que lê um inteiro `n > 2` e imprime os valores
$$
   F_{n-2} + G_{n+200}  e F_{n+200} - G_{n-2}
$$

Seu programa deve obrigatoriamente utilizar a função do item anterior, mesmo que
você não a tenha feito.

[Solução](../src/e_func_2/ex_06.zig)
