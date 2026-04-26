// Exercício 20 de https://www.ime.usp.br/~macmulti/exercicios/funcoes3/index.html
// Simule a execução do seguinte programa, destacando a sua saída.

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
