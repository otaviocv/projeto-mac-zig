# Exercícios com Funções - Parte I

[Todos os exercícios](../exercicios)

[Link original](https://www.ime.usp.br/~macmulti/exercicios/funcoes1/index.html)

## 1
Um número `a` é dito _permutação_ de um número `b` se os dígitos de `a` formam uma
permutação dos dígitos de `b`.
Exemplo: `5412434` é uma permutação de `4321445`, mas não é uma permutação de `4312455`.

Obs.: Considere que o dígito 0 (zero) não aparece nos números.

### a
Faça uma função _contadígitos_ que dados um inteiro `n` e um inteiro `d`, $0 < d < 9$,
devolve quantas vezes o dígito `d` aparece em `n`.
### b
Usando a função do item anterior, faça um programa que lê dois inteiros positivos
`a` e `b` e responda se `a` é permutação de `b`.

[Solução](../src/d_func_1/ex_01.zig)

## 2
### a
Construa uma função encaixa que dados dois inteiros positivos `a` e `b` verifica se `b`
corresponde aos últimos dígitos de `a`.

Exemplo:
```
  a       b
567890   890 => encaixa
  1243  1243 => encaixa 
  2457   245 => não encaixa
   457  2457 => não encaixa
```

### b
Usando a função do item anterior, faça um programa que lê dois inteiros positivos
`a` e `b` e verifica se o menor deles é segmento do outro.

Exemplo:
```
   a        b
567890     678 => b é segmento de a
  1243 2212435 => a é segmento de b
   235     236 => um não é segmento do outro
```

[Solução](../src/d_func_1/ex_02.zig)

## 3
(MAT - 94) Uma sequência de n números inteiros não nulos é dita piramidal
`m`-alternante se é constituída por `m` segmentos: o primeiro com um elemento,
o segundo com dois elementos e assim por diante até o `m`-ésimo, com `m` elementos.

Além disso, os elementos de um mesmo segmento devem ser todos pares ou todos ímpares
e para cada segmento, se seus elementos forem todos pares (ímpares),
os elementos do segmento seguinte devem ser todos ímpares (pares).

Por exemplo, a sequência com `n = 10` elementos:
```
12      3  7         2  10  4        5  13  5  11
s1      s2           s3              s4
```
é piramidal `4`-alternante.

A sequência com `n = 3` elementos:
```
7       10  2
s1      s2
```
é piramidal `2`-alternante.

A sequência com `n = 8` elementos:
```
1       12   4       3  13  5        12  6
s1      s2           s3              s4
```
não é piramidal alternante pois o último segmento não tem tamanho `4`.

### a
Escreva uma função bloco que recebe como parâmetro um inteiro `n` e
lê `n` inteiros do teclado, devolvendo um dos seguintes valores:
- ` 0`, se os `n` números lidos forem pares;
- ` 1`, se os `n` números lidos forem ímpares;
- `-1`, se entre os `n` números lidos há números com paridades diferentes.

### b
Usando a função do item anterior, escreva um programa que,
dados um inteiro `n > 1` e uma sequência de `n` números inteiros,
verifica se ela é piramidal `m`-alternante.

O programa deve imprimir o valor de `m` ou dar a resposta não.

[Solução](../src/d_func_1/ex_03.zig)

## 4
(POLI 97)

### a
Faça uma função `arctan` que recebe o número real $x \in [0,1]$ e devolve uma
aproximação do arco tangente de `x` (em radianos) através da série incluindo todos
os termos da série:

$$ arctan(x) = x - x^3/3 + x^5/5 + x^7/7 ... $$

incluindo todos os termos da série até

$$ |x^k/k| < 0.0001 $$

### b
Faça uma função angulo que recebe um ponto de coordenadas cartesianas reais `(x,y)`,
com `x > 0` e `y > 0` e devolve o ângulo formado pelo vetor `(x,y)` e o eixo horizontal.

Exemplos: Observe a figura abaixo e verifique que os ângulos correspondentes aos pontos
marcados é aproximadamente
```
┌────────┬──────────┐
│ Ponto  │  Ângulo  │
├────────┼──────────┤
│ (0,1)  │ 90 graus │
│ (2,2)  │ 45 graus │
│ (1,4)  │ 75 graus │
│ (5,1)  │ 11 graus │
└────────┴──────────┘
```

![Pontos no plano cartesiano](./.svg/d_func_1_4b_pontos_no_plano.svg)

Use a função do item anterior mesmo que você não a tenha feito. Note que a função só calcula
o arco tangente de números entre 0 e 1, e o valor devolvido é o ângulo em radianos
(use o valor $\pi = 3.14 radianos = 180 graus$).

Para calcular o valor do ângulo α pedido, use a seguinte fórmula:
$$
     \alpha = arctan(y/x)  caso y < x,
     \pi/2 - arctan(x/y)   caso x>= y
$$

### c
Faça um programa que, dados `n` pontos do primeiro quadrante (`x >= 0` e `y >= 0`) através de suas
coordenadas cartesianas, determina o ponto que forma o menor ângulo com o eixo horizontal.
Use a função do item anterior, mesmo que você não a tenha feito.

[Solução](../src/d_func_1/ex_04.zig)

## 5
### a
Escreva uma função que recebe um inteiro positivo `m` e devolve 1 se `m` é primo, 0 em caso contrário.

### b
Escreva um programa que leia um inteiro não-negativo `n` e imprima a soma dos `n` primeiros números primos.

[Solução](../src/d_func_1/ex_05.zig)

## 6
### a
Escreva uma função que recebe como parâmetros dois números `a` e `b` e devolve
o _mdc_ (máximo divisor comum) de `a` e `b`, calculado por meio do
[algoritmo de Euclides](https://pt.wikipedia.org/wiki/Algoritmo_de_Euclides).

### b
Escreva um programa que leia um inteiro positivo `n` e uma sequência de `n`
inteiros não-negativos e imprime o _mdc_ de todos os números da sequência.

[Solução](../src/d_func_1/ex_06.zig)

## 7
(POLI 97) Simule a execução do programa seguinte. Faça suas contas com duas
casas de precisão. Não se preocupe com o formato da saída.

```
#include <stdio.h>

float f1 (int x, int y) {
  float res;

  if (y != 0) 
    res = (float) x / y;
  else 
    res = (float) 1 / x;
  
  while (x > y) {
    res = res + (float) y / x;
    x = x - 1;
  }
  return(res);
}

int main() {
  int a, b;
  float c, d;

  printf("Digite quatro numeros.\n");
  scanf("%d %d %f %f", &a, &b, &c, &d);
  printf("a = %d  b = %d  c = %f  d = %f\n", a, b, c, d);
  while (a < b) {
    if (c > d) { 
      d = f1(b,a);
      b = b - 1;
    }
    else{
      c = 1 / f1(a,b);
      a = a + 1;
    }
    printf("a = %d  b = %d  c = %f  d = %f\n", a, b, c, d);
  }
  return 0;
}
```

Dados:
```
2 5 3.0 2.0
```

[Implementação em C](../src/d_func_1/ex_07.c)

[Implementação em Zig](../src/d_func_1/ex_07.zig)

[Resultado da simulação](../src/d_func_1/ex_07_output.txt)

<br>

[Todos os exercícios](../exercicios)
