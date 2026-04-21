# Exercícios com repetições encaixadas

[Link original](https://www.ime.usp.br/~macmulti/exercicios/repetenc/index.html)

## 1
Dados `n` e `n` sequências de números inteiros não-nulos, cada qual seguida por um 0,
calcular a soma dos números pares de cada sequência.

[Solução](../src/b_repetenc/ex_01.zig)

## 2
Dado um número inteiro positivo `n`, determinar todos os inteiros entre `1` e `n` que
são comprimento da hipotenusa de um triângulo retângulo com catetos inteiros.

[Solução](../src/b_repetenc/ex_02.zig)

## 3
Dados dois naturais `m` e `n` determinar, entre todos os pares de números naturais
$(x,y)$ tais que $x < m$ e $y < n$,
um par para o qual o valor da expressão $xy - x^2 + y$ seja máximo e calcular
também esse máximo.

[Solução](../src/b_repetenc/ex_03.zig)

## 4
Dados `n` números inteiros positivos, calcular a soma dos que são primos.

[Solução](../src/b_repetenc/ex_04.zig)

## 5
Sabe-se que um número da forma $n^3$ é igual a soma de `n` ímpares consecutivos.

Exemplo:
- $1^3 = 1$, $2^3 = 3+5$, $3^3 = 7+9+11$,  $4^3= 13+15+17+19$, ...

Dado `m`, determine os ímpares consecutivos cuja soma é igual a $n^3$ para `n` assumindo valores de `1` a `m`.

[Solução](../src/b_repetenc/ex_05.zig)

## 6
Dado um número inteiro positivo, determine a sua decomposição em fatores
primos calculando também a multiplicidade de cada fator.

[Solução](../src/b_repetenc/ex_06.zig)

## 7
Dados um inteiro positivo `n` e uma sequência de `n` inteiros positivos,
determinar o máximo divisor comum a todos eles.

[Solução](../src/b_repetenc/ex_07.zig)

## 8
(POLI 97) Dizemos que uma sequência de inteiros positivos é `k`-alternante 
se for composta alternadamente por segmentos de números pares de tamanho `k`
e segmentos de números ímpares de tamanho `k`.

Exemplos:
1. A sequência `1 3 6 8 9 11 2 4 1 7 6 8` é `2`-alternante.
2. A sequência `2 1 4 7 8 9 12` é `1`-alternante.
3. A sequência `4 2 3 1 6 4 2 9 3` não é alternante.
4. A sequência `1 3 5` é `3`-alternante.

Dado `n > 1` e uma seqüência com `n` inteiros, verificar se existe um inteiro `k > 1`
tal que a sequência é `k`-alternante. Dê como saída também o valor de `k` caso
a sequência seja alternante.
