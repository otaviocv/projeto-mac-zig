// Exercício 17 de https://www.ime.usp.br/~macmulti/exercicios/vetores/index.html
// (POLI 88) Simule a execução do programa abaixo.

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
