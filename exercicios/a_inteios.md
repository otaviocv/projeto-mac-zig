# Exercícios com Inteiros

[Todos os exercícios](../exercicios)

[Link original](https://www.ime.usp.br/~macmulti/exercicios/inteiros/index.html)

## 1
Dada uma sequência de números inteiros não-nulos (diferente de zero), seguida por 0, imprimir seus quadrados. 

[Solução](../src/a_inteiros/ex_01.zig)

## 2
Dado um número inteiro positivo n, calcular a soma dos n primeiros números inteiros positivos.

[Solução](../src/a_inteiros/ex_02.zig)

## 3
Dado um número inteiro positivo n, imprimir os n primeiros naturais ímpares.

Exemplo: Para `n=4` a saída deverá ser `1, 3, 5, 7`.

[Solução](../src/a_inteiros/ex_03.zig)

## 4
Dados um inteiro `x` e um inteiro não-negativo `n`, calcular $x^n$.

[Solução](../src/a_inteiros/ex_04.zig)

## 5
Uma loja de discos anota diariamente durante o mês de março a quantidade de discos vendidos.
Determinar em que dia desse mês ocorreu a maior venda e qual foi a quantidade de discos vendida nesse dia.

[Solução](../src/a_inteiros/ex_05.zig)

## 6
Dados o número n de alunos de uma turma de Introdução aos Autômatos a Pilha
([MAC0414](https://uspdigital.usp.br/jupiterweb/obterDisciplina?sgldis=MAC0414&verdis=5))
e suas notas da primeira prova, determinar a maior e a menor nota obtidas por essa turma
(Nota máxima = 100 e nota mínima = 0).

[Solução](../src/a_inteiros/ex_06.zig)

## 7
Dados `n` e uma sequência de `n` números inteiros, determinar a soma dos números pares.

[Solução](../src/a_inteiros/ex_07.zig)

## 8
Dado um inteiro não-negativo `n`, determinar `n!`

[Solução](../src/a_inteiros/ex_08.zig)


## 9
Dados `n` e dois números inteiros positivos `i` e `j` diferentes de `0`,
imprimir em ordem crescente os `n` primeiros naturais que são múltiplos de `i` ou de `j` e ou de ambos.

[Solução](../src/a_inteiros/ex_09.zig)

## 10
Dizemos que um número natural é triangular se ele é produto de três números naturais consecutivos.
Dado um inteiro não-negativo `n`, verificar se `n` é triangular.

[Solução](../src/a_inteiros/ex_10.zig)

## 11
Dado um inteiro positivo `n`, verificar se `n` é primo.

[Solução](../src/a_inteiros/ex_11.zig)

## 12
Dados dois números inteiros positivos, determinar o máximo divisor comum entre eles usando o algoritmo de Euclides.

[Solução](../src/a_inteiros/ex_12.zig)

## 13
Dizemos que um inteiro positivo `n` é perfeito se for igual à soma de seus divisores positivos diferentes de `n`.
Dado um inteiro positivo `n`, verificar se `n` é perfeito.

[Solução](../src/a_inteiros/ex_13.zig)

## 14
Um matemático italiano da idade média conseguiu modelar o ritmo de crescimento da população de coelhos (1)
através de uma sequência de números naturais que passou a ser conhecida como sequência de Fibonacci (2).
O `n`-ésimo número da sequência de Fibonacci $F_n$ é dado pela seguinte fórmula de recorrência:
$$
F_1 = 1
F_2 = 1
F_i = F_i-1 + F_i-2 para i >= 3
$$
Faça um programa que, dado `n`, calcula $F_n$.

[Solução](../src/a_inteiros/ex_14.zig)

## 15
Dizemos que um número `i` é congruente módulo `m` a `j` se `i % m = j % m`.
Exemplo: 35 é congruente módulo 4 a 39, pois `35 % 4 = 3 = 39 % 4`.
Dados inteiros positivos `n`, `j` e `m`, imprimir os `n` primeiros naturais congruentes a `j` módulo `m`.

[Solução](../src/a_inteiros/ex_15.zig)

## 16
Dado um número natural na base binária, transformá-lo para a base decimal.
Exemplo: Dado 10010 a saída será 18, pois `1 * 2^4 + 0 * 2^3 + 0 * 2^2 + 1 * 2^1 + 0 * 2^0 = 18`.

[Solução](../src/a_inteiros/ex_16.zig)

## 17
Dado um número natural na base decimal, transformá-lo para a base binária.
Exemplo: Dado 18 a saída deverá ser 10010.

[Solução](../src/a_inteiros/ex_17.zig)

## 18
Dados três números naturais, verificar se eles formam os lados de um triângulo retângulo.

[Solução](../src/a_inteiros/ex_18.zig)

## 19
Dados três números, imprimi-los em ordem crescente.

[Solução](../src/a_inteiros/ex_19.zig)

## 20
(FIS 88) Qualquer número natural de quatro algarismos pode ser dividido em duas dezenas formadas pelos seus dois primeiros e dois últimos dígitos.

Exemplos:
- 1297: 12 e 97.
- 5314: 53 e 14.

Escreva um programa que imprime todos os milhares (4 algarismos) cuja raiz quadrada seja a soma das dezenas formadas pela divisão acima.

Exemplo: raiz de 9801 = 99 = 98 + 01.
Portanto 9801 é um dos números a ser impresso.

[Solução](../src/a_inteiros/ex_20.zig)

## 21
(POLI 87) Dados `n` e uma sequência de `n` números inteiros, determinar quantos segmentos
de números iguais consecutivos compõem essa sequência.

Exemplo: A seguinte sequência é formada por 5 segmentos de números iguais: `5,  2,  2,  3,  4,  4,  4,  4,  1,  1`.

[Solução](../src/a_inteiros/ex_21.zig)

## 22
(POLI 89) Dados `n` e uma sequência de `n` números inteiros, determinar o comprimento de um segmento crescente de comprimento máximo.
Exemplos:
- Na sequência 5,  10,  3,  **2,  4,  7,  9**,  8,  5 o comprimento do segmento crescente máximo é 4.
- Na sequência **10**,  8,  7,  5,  2 o comprimento de um segmento crescente máximo é 1.

[Solução](../src/a_inteiros/ex_22.zig)

## 23
Dizemos que um número natural n é palíndromo (3) se
- o 1º algarismo de n é igual ao seu último algarismo,
- o 2º algarismo de n é igual ao penúltimo algarismo,
e assim sucessivamente.

Exemplos:
- 567765 e 32423 são palíndromos.
- 567675 não é palíndromo.

Dado um número natural `n > 10`, verificar se `n` é palíndrome.

[Solução](../src/a_inteiros/ex_23.zig)

## 24
São dados dois números inteiros positivos `p` e `q`, sendo que o número de dígitos de `p`
é menor ou igual ao número de dígitos de `q`. Verificar se `p`é um subnúmero de `q`.
Exemplos:
- `p = 23`, `q = 57238`,  `p` é subnúmero de `q`.
- `p = 23`, `q = 258347`, `p` não é subnúmero de `q`.

[Solução](../src/a_inteiros/ex_24.zig)

## 25
Simule a execução do programa abaixo destacando a sua saída:
```
int main() {
    int a, b, total, soma, termo, i;
    printf("Digite um par de numeros: ");
    scanf("%d %d", &a, &b);
    printf("(%d, %d)\n", a, b);
    total = 0; 
    soma  = 0;
    while (a != 0) { 
        total = total + 1; 
        termo = 1;
        for (i = 1; i <= b; i++)
            termo = termo * a;
        printf("Resp = %d\n", termo);
        soma = soma + termo;
        printf("Soma = %d\n", soma);
        printf("Digite um par de numeros: ");
        scanf("%d %d", &a, &b);
        printf("(%d, %d)\n", a, b);
    }
    printf("Total de pares: %d\n", total);
    return 0;
}
```

Dados:
```
2 3
5 2
7 1
0 5
3 2
```

[Implementação em C](../src/a_inteiros/ex_25.c)

[Implementação em Zig](../src/a_inteiros/ex_25.zig)

[Resultado da simulação](../src/a_inteiros/ex_25_output.txt)

<br>

[Todos os exercícios](../exercicios)
