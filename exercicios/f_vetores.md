# Exercícios com Vetores

[Todos os exercícios](../exercicios)

[Link original](https://www.ime.usp.br/~macmulti/exercicios/vetores/index.html)

## 1
Dada uma sequência de `n` números, imprimi-la na ordem inversa à da leitura.

[Solução](../src/f_vetores/ex_01.zig)

## 2
Deseja-se publicar o número de acertos de cada aluno em uma prova em forma de testes.
A prova consta de 30 questões, cada uma com cinco alternativas identificadas
por A, B, C, D e E. Para isso são dados:

- o cartão gabarito;
- o número de alunos da turma;
- o cartão de respostas para cada aluno, contendo o seu número e suas respostas.

Dada uma sequência de `n` números, imprimi-la na ordem inversa à da leitura.

[Solução](../src/f_vetores/ex_02.zig)

## 3
Tentando descobrir se um dado era viciado, um dono de cassino honesto (ha! ha! ha! ha!)
o lançou `n` vezes. Dados os `n` resultados dos lançamentos, determinar o número de
ocorrências de cada face.

[Solução](../src/f_vetores/ex_03.zig)

## 4
Dados dois vetores `x` e `y`, ambos com `n` elementos,
determinar o [produto escalar](https://pt.wikipedia.org/wiki/Produto_escalar)
desses vetores.

[Solução](../src/f_vetores/ex_04.zig)

## 5
Faça um programa para resolver o seguinte problema:

> São dadas as coordenadas reais `x` e `y` de um ponto, um número natural `n`,
> e as coordenadas reais de `n` pontos (`1 < n < 100`). Deseja-se calcular e
> imprimir sem repetição os raios das circunferências centradas no ponto
> `(x,y)` que passam por pelo menos um dos `n` pontos dados.

Exemplo: `(x,y) = (1.0, 1.0)`; `n = 5`
Pontos: `(-1.0, 1.2)`, `(1.5, 2.0)`, `(0.0, -2.0)`, `(0.0, 0.5)`, `(4.0, 2.0)`
Nesse caso há três circunferências de raios: `1.12`, `2.01` e `3.162`.

Observações:
- Distância entre os pontos `(a,b)` e `(c,d)` é $\sqrt{(a - c)^2 + (b - d)^2}$
- Dois pontos estão na mesma circunferência se estão à mesma distância do centro.

[Solução](../src/f_vetores/ex_05.zig)

## 6
(COMP 89) Dados dois strings (um contendo uma frase e outro contendo uma palavra),
determine o número de vezes que a palavra ocorre na frase.

Exemplo:
Para a palavra ANA e a frase :
```
   ANA E MARIANA GOSTAM DE BANANA
   ---       ---            -----
```
Temos que a palavra ocorre 4 vezes na frase.

[Solução](../src/f_vetores/ex_06.zig)

## 7
(MAT 88) Dada uma sequência de `n` números reais, determinar os números que
compõem a sequência e o número de vezes que cada um deles ocorre na mesma.

Exemplo: `n = 8`

Sequência: `-1.7,  3.0,  0.0,  1.5,  0.0, -1.7,  2.3, -1,7`

Saída:

1. -1.7 ocorre 3 vezes
2. 3.0 ocorre 1 vez
3. 0.0 ocorre 2 vezes
4. 1.5 ocorre 1 vez
5. 2.3 ocorre 1 vez

[Solução](../src/f_vetores/ex_07.zig)

## 8
Dados dois números naturais `m` e `n` e duas sequências ordenadas com `m` e `n`
números inteiros, obter uma única sequência ordenada contendo todos os
elementos das sequências originais sem repetição.

Sugestão: Imagine uma situação real, por exemplo, dois fichários de uma biblioteca.

[Solução](../src/f_vetores/ex_08.zig)

## 9
Dadas duas sequências com `n` números inteiros entre `0` e `9`, interpretadas como
dois números inteiros de `n` algarismos, calcular a sequência de números que
representa a soma dos dois inteiros.

Exemplo: `n = 8`,

```
    1a  sequência:      8 2 4 3 4 2 5 1
    2ª  sequência:    + 3 3 7 5 2 3 3 7
                      1 1 6 1 8 6 5 8 8
```

[Solução](../src/f_vetores/ex_09.zig)

## 10
Calcule o valor do polinômio $p(x) = a_0 + a_1x + ... + a_nx^n$ em `k` pontos distintos.
São dados os valores de `n` (grau do polinômio), de $a_0, a_1, ..., a_n$
(coeficientes reais do polinômio), de `k` e dos pontos $x_1, x_2, ..., x_k$.

[Solução](../src/f_vetores/ex_10.zig)


## 11
Dado o polinômio $p(x) = a_0 + a_1x +...+ a_nx^n$, isto é, os valores de `n` e
de $a_0, a_1, ..., a_n$ determine os coeficientes reais da primeira derivada
de $p(x)$.

[Solução](../src/f_vetores/ex_11.zig)

## 12
Dado um polinômio $p(x) = a_0 + a_1x + ... + a_nx^n$, calcular o polinômio
$q(x)$ tal que $p(x) = (x-a)q(x) + p(a)$, para `m` valores distintos de a
(Usar o método de [Briot-Ruffini](https://pt.wikipedia.org/wiki/Algoritmo_de_Briot-Ruffini))

[Solução](../src/f_vetores/ex_12.zig)

## 13
Dados dois polinômios reais,
$p(x) = a_0 + a_1x + ... + a_nx^n$ e 
$q(x) = b_0 + b_1x + ... + b_mx^m$,
determinar o produto desses polinômios.

[Solução](../src/f_vetores/ex_13.zig)

## 14
(POLI 82) Chama-se sequência de Farey relativa a `n`, a sequência das frações
racionais irredutíveis, dispostas em ordem crescente, com denominadores
positivos e não maiores que `n`.

Exemplo:

> Se `n=5`, os termos a da sequência de Farey, tais que `0 <= a <= 1` são:
> 
> `0/1, 1/5, 1/4, 1/3, 2/5, 1/2, 3/5, 2/3, 3/4, 4/5, 1/1`

Para gerarmos os termos a de uma sequência de Farey tais que `0 <= a <= 1`,
podemos usar o seguinte processo. Começamos com as frações `0/1` e `1/1`
e entre cada duas frações consecutivas `i/j` e `k/m` introduzimos a fração
`(i + k)/(j + m)` e assim sucessivamente enquanto `j + m <= n`.
Quando não for mais possível introduzir novas frações teremos gerado
todos os termos da sequência de Farey relativa a `n`, tais que `0 <= a <= 1`.

Usando o processo descrito, determine os termos `a`, `0 <= a <= 1`,
da sequência de Farey relativa a `n`, `n` inteiro positivo.

Sugestão: Gere os numeradores e os denominadores em dois vetores.

[Solução](../src/f_vetores/ex_14.zig)

## 15
Em uma classe há `n` alunos, cada um dos quais realizou `k` provas com pesos distintos.
Dados `n`, `k`, os pesos das `k` provas e as notas de cada aluno, calcular
a média ponderada das provas para cada aluno e a média aritmética da classe
em cada uma das provas.

[Solução](../src/f_vetores/ex_15.zig)

## 16
(QUIM 84) Dada uma sequência $x_1, x_2, ..., x_k$ de números inteiros, verifique se
existem dois segmentos consecutivos iguais nesta sequência, isto é, se existem
`i` e `m` tais que:

$$    x_i, x_{i+1}, ..., x_{i+m-1} = x_{i+m}, x_{i+m+1}, ..., x_{i+2m-1} $$

Imprima, caso existam, os valores de `i` e `m`.

Exemplo: Na sequência
```
7, 9, 5, 4, 5, 4, 8, 6
     *1 *2 *1 *2
```
existem i=3 e m=2.

[Solução](../src/f_vetores/ex_16.zig)

## 17
Dada uma sequência de `n` números inteiros, determinar um segmento de soma máxima.

Exemplo: Na sequência
```
5, 2, -2, -7, 3, 14, 10, -3, 9, -6, 4, 1
              *   *   *   *  *
```
a soma do segmento é 33.

[Solução](../src/f_vetores/ex_17.zig)

## 18
(POLI 88) Simule a execução do programa abaixo.

```c
#include <stdio.h>
int main()
{ 
  int n, inic, fim, i, aux, para, a[100];

  printf("Digite n: ");
  scanf("%d", &n); 
  printf("n = %d\n", n);
  printf("Digite uma sequencia de %d numeros.\n", n);
  for (i = 0; i < n; i++) { 
    scanf("%d", &a[i]); 
    printf("%d ", a[i]); 
  }
  printf("\n");
  inic = 0; 
  fim  = n - 1; 
  aux  = a[inic];
  while (inic < fim) { 
    para = 0;
    while ((inic < fim) && !para) { 
      if (a[fim] <= aux) 
        para = 1;
      else 
        fim = fim - 1;
    }
    if (para) {
      a[inic] = a[fim]; 
      inic = inic + 1; 
      para = 0;
      while ((inic < fim) && !para) { 
        if (a[inic] <= aux) 
          inic = inic + 1;
        else 
          para = 1;
      }
      if (para) {
        a[fim] = a[inic]; 
        fim = fim - 1;
      }
    }
    for (i = 0; i < n; i++) 
      printf("%d ", a[i]);
    printf("\n");
  } 
  a[inic] = aux;
  for (i = 0; i < n; i++) 
    printf("%d ", a[i]);
  printf("\n");
  return 0;
}
```

Dados:
```
7
10 3 6 12 13 7 15
```

[Implementação em C](../src/f_vetores/ex_18.c)

[Resultado da simulação](../src/f_vetores/ex_18_output.txt)

---

[Todos os exercícios](../exercicios)
