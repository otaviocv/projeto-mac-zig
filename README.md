# Lista de exercícios para introdução a computação do Projeto MAC em Zig.

Esse repositório contém as soluções de todos os exercícios da lista de exercícios do
[Projeto MAC](https://www.ime.usp.br/~macmulti/) do
[Instituto de Matemática e Estatística](https://www.ime.usp.br/) da
[Universidade de São Paulo](https://www5.usp.br/) (IME-USP). Eu resolvi primeiro
esses exercícios em 2014 quando eu fiz a minha primeira disciplina de introdução de computação
no segundo semestre do curso de Bacharelado em Física, [MAC115](https://www.ime.usp.br/~yoshi/2014ii/mac115/)
com o professor [Yoshiharu](https://www.ime.usp.br/~yoshi/).

Em 2026 eu decidi aprender a [linguagem de programação Zig](https://ziglang.org/)
e devido a sua similaridade com a
linguagem C, achei que revisistar essa lista seria um jeito divertido e nostálgico de iniciar
minha jornada com Zig.

[Link para a lista original.](https://www.ime.usp.br/~macmulti/exercicios/)

## A Lista

A lista é dividida em nove seções:

1. [Inteiros](./exercicios/a_inteios.md)
2. [Repetições encaixadas](./exercicios/b_repetenc.md)
3. [Reais](./exercicios/c_reais.md)
4. [Funções Parte I](./exercicios/d_func_1.md)
5. [Funções Parte II](./exercicios/e_func_2.md)
6. [Vetores](./exercicios/f_vetores.md)
7. [Matrizes](./exercicios/g_matrizes.md)
8. [Funções Parte III](./h_func_3.md)
9. [Complementares](/i_complementares.md)

Todos os exercícios foram transcritos para os arquivos markdown em ./exercicios/ melhorando
o máximo possível a apresentação usando os recursos do markdown do github.
Cada solução acompanha uma versão simplificada do enunciado no topo do arquivo.
Os arquivos são prefixados com letras de A..I para manter a ordem proposta em ordem
lexicográfica.

## Abordagem

Eu tentei resolver os exercícios como eles foram pensados para resolver, ignorando muitas
formas alternativas de se abordar as mesmas questões. Acredito que essa é uma lista datada
e que requer muitas atualizações, mas o objetivo não é fazer uma crítica à lista, até porque
já existem várias revisões e atualizações do departamento.

Todos os exercícios foram resolvidos usando Zig 0.15.2 entre março e abril de 2026. Inspirado
por alguns estilos Zig eu tentei levemente incorporar conceitos Zig. Essa lista foi a minha
primeira experiência com Zig e ela segue ainda um estilo "C", sem se apropriar extensamente
dos recursos da linguagem.

Minha expectativa é de que depois de resolver os [ziglings](https://codeberg.org/ziglings/exercises)
eu possa voltar e fazer o contraste com o meu primeiro contato com a linguagem.

## Executando as soluções

Para executar cada exercício:
```
zig run <path>
```

Alguns exercícios são de simulação. Alguns desses eu reescrevi em Zig e outros deixei em C,
mas como o compilador Zig foi feito para embarcar C não é necessário mudar nada na forma
de execução.

## Expandindo as soluções

Se você também for um estudante de segundo semestre (ou qualquer semestre) e encontrar um bug
ou achar uma solução mais graciosa ou elegante,
especialmente quanto ao estilo da linguagem e os usos eficientes da linguagem,
será um prazer incluí-la como parte da lista. Para
um exercício eu já coloquei uma solução alternativa e será muito divertido incluir mais!
