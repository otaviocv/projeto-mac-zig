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

