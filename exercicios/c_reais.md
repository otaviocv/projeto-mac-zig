# Exercícios com Reais

[Todos os exercícios](../exercicios)

[Link original](https://www.ime.usp.br/~macmulti/exercicios/reais/index.html)


## 1
Uma pessoa aplicou um capital de `x` reais a juros mensais de `z` durante 1 ano.
Determinar o montante de cada mês durante este período.

[Solução](../src/c_reais/ex_01.zig)

## 2
Dado um natural `n`, determine o número harmônico $H_n$ definido por:

$$ H_n = sum_{k=1}_{n} 1/k $$

[Solução](../src/c_reais/ex_02.zig)

## 3
Os pontos `(x,y)` que pertencem à figura `H` (abaixo) são tais que
$x >= 0$, $y >= 0$ e $x^2 + y^2 <= 1$.

![Semi círculo H](./.svg/c_reais_3_semicirculo_h.svg)

Dados `n` pontos reais `(x,y)`, verifique se cada ponto pertence ou não a `H`.

[Solução](../src/c_reais/ex_03.zig)

## 4
(GEO 84) Considere o conjunto $H = H1 \uplus H2$ de pontos reais, onde

$$ H1 = {(x, y) | x <= 0, y <= 0, y + x^2 + 2x - 3 <= 0} $$

$$   H2 = {(x, y) | x >= 0, y + x^2 - 2x - 3 <= 0} $$

Faça um programa que lê uma seqüência de `n` pontos reais `(x,y)`
e verifica se cada ponto pertence ou não ao conjunto $H$.
O programa deve também contar o número de pontos da sequência que pertencem a $H$.

[Solução](../src/c_reais/ex_04.zig)

## 5
Dados números reais a, b e c, calcular as raízes de uma equação do 2o grau
da forma $ax^2 + bx + c = 0$. Imprimir a solução em uma das seguintes formas:

| a.DUPLA | b.REAIS DISTINTAS | c.COMPLEXAS      |
|---------|-------------------|------------------|
| raiz    | raiz 1            | parte real       |
|         | raiz 2            | parte imaginária |

[Solução](../src/c_reais/ex_05.zig)

## 6
Dados `x` real e `n` natural, calcular uma aproximação para $cos(x)$
através dos `n` primeiros termos da seguinte série:

$$ cos(x) = 1 - x^2/2! + x^4/4! - x^6/6! + ... + (-1)^k x^2k/(2k)! $$

Compare com os resultados de sua calculadora!

[Solução](../src/c_reais/ex_06.zig)

## 7
Dados `x` e $\epsilon$ reais, $\epsilon > 0$, calcular uma aproximação para sen x através da seguinte série infinita

$$ sen x = x/1! - x^3/3! + x^5/5! - ... + (-1)^k x^{2k + 1}/(2k + 1)! $$

incluindo todos os termos até que

$$ | x^{2k + 1}| / (2k + 1)! < \epsilon $$

Compare com os resultados de sua calculadora!

[Solução](../src/c_reais/ex_07.zig)

## 8 
Para `n` alunos de uma determinada classe são dadas as 3 notas das provas.
Calcular a média aritmética das provas de cada aluno, a média da classe,
o número de aprovados e o número de reprovados
(critério de aprovação: média maior ou igual a cinco).

[Solução](../src/c_reais/ex_08.zig)

## 9
Dadas `n` triplas compostas por um símbolo de operação (`+`, `-`, `*` ou `/`)
e dois números reais, calcule o resultado ao efetuar a operação indicada
para os dois números (Sugestão: use switch).

[Solução](../src/c_reais/ex_09.zig)

## 10
Dadas as populações de [Uauá (BA)](https://pt.wikipedia.org/wiki/Uau%C3%A1) e
[Nova York (MA)](https://pt.wikipedia.org/wiki/Nova_Iorque_(Maranh%C3%A3o)) e
sabendo que a população de Uauá tem um crescimento anual de `x` e a
população de Nova York tem um crescimento anual de `y` determine:
1. Se a população da cidade menor ultrapassa a da maior.
2. Quantos anos passarão antes que isso ocorra.
  
[Solução](../src/c_reais/ex_10.zig)

## 11
Dado um inteiro positivo `n`, calcular e imprimir o valor da seguinte soma:

$$ 1/n + 2/(n-1) + 3/(n-2) ... + n/1 $$

[Solução](../src/c_reais/ex_11.zig)

## 12
Faça um programa que calcula a soma

$$  1 -1/2 + 1/3 - 1/4 ... 1/9999 - 1/10000 $$

pelas seguintes maneiras:
- adição dos termos da direita para a esquerda;
- adição dos termos da esquerda para a direita;
- adição separada dos termos positivos e dos termos negativos da esquerda para a direita;
- adição separada dos termos positivos e dos termos negativos da direita para a esquerda.

[Solução](../src/c_reais/ex_12.zig)

<br>

[Todos os exercícios](../exercicios)
