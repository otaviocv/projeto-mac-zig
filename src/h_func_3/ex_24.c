// Exercício 24 de https://www.ime.usp.br/~macmulti/exercicios/funcoes3/index.html
// (POLI 87) Simule a execução do programa abaixo destacando a sua saída:
// 
// Dados:
// 3 4
// 1.9 1.0 -1.7 1.6
// 0.0 2.5 -2.8 -3.5
// -0.5 -2.0 1.3 1.0

#include <stdio.h>
#define max 50

int indmax(float v[], int n)
{ 
  int j, indice;

  indice = 0;
  for (j = 1; j < n; j++)
    if (v[j] > v[indice]) 
      indice = j;
  return(indice);
}

void roda(float v[], int n, int imaior)
{ 
  int j, k; 
  float x[max];

  k = imaior;
  for (j = 0; j < k;   j++) 
    x[j] = v[j];
  for (j = 0; j < n-k; j++) 
    v[j] = v[j+k];
  for (j = 0; j < k;   j++) 
    v[n-k+j] = x[j];
}

int main()
{ 
  int i, m, n, l, c, imaior;
  float v[max], aux[max], a[max][max];

  printf("Digite m e n.\n");
  scanf("%d %d", &m, &n); 
  printf("m = %d   n = %d\n", m, n);
  printf("Digite uma matriz mxn.\n");
  for (l = 0; l < m; l++) { 
    for (c = 0; c < n; c++) { 
      scanf("%f", &a[l][c]); 
      printf("%4.1f ", a[l][c]); 
    }
    printf("\n");
  }
  for (l = 0; l < m; l++) { 
    for (i = 0; i < n; i++) 
      aux[i] = a[l][i];
    imaior = indmax(aux, n); 
    printf("%d\n", imaior);
    roda(aux, n, imaior);
    for (i = 0; i < n; i++)
      a[l][i] = aux[i]; 
    for (c = 0; c < n; c++) 
      printf("%4.1f ", a[l][c]);
    printf("\n");
  }
  for (l = 0; l < m; l++) 
    v[l] = a[l][0];
  imaior = indmax(v, m);
  printf("\n%4.1f\n", a[imaior][0]);
  return 0;
}
