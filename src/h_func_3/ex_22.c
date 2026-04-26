// Exercício 22 de https://www.ime.usp.br/~macmulti/exercicios/funcoes3/index.html
// (POLI 88) Simule a execução do programa abaixo destacando a sua saída:
//
// Dados:
// 2
// 4 1
// -2 8
// 2 -1
// 5 4

#include <stdio.h>
#define max 50

void imprime(int a[][max], int n)
{ 
  int i, j;
  for (i = 0; i < n; i++) { 
    for (j = 0; j < n; j++) 
      printf("%2d ", a[i][j]);
    printf("\n");
  }
}

void soma(int a[][max], int b[][max], int n)
{ 
  int i, j;

  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++) 
      a[i][j] = a[i][j] + b[i][j]; 
}

int main()
{ 
  int i, j, n, a[max][max], b[max][max];

  printf("Digite n: ");
  scanf("%d", &n); 
  printf("n = %d\n", n);
  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++)
      scanf("%d", &a[i][j]);
  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++)
      scanf("%d", &b[i][j]);
  imprime(a, n); 
  imprime(b, n);  
  soma(a, b, n);
  imprime(a, n); 
  imprime(b, n);
  return 0;
}
