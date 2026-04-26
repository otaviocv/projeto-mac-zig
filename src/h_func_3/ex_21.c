// Exercício 21 de https://www.ime.usp.br/~macmulti/exercicios/funcoes3/index.html
// (POLI 87) Simule a execução do programa abaixo destacando a sua saída:
//
// Dados:
// 6
// 25 13 18 37 12 10

#include <stdio.h>

int main()
{ 
  int m, x, nv, i, k, achou, b[50], v[50];

  printf("Digite o tamanho da sequencia: ");
  scanf("%d", &m); 
  printf("Tamanho = %d\n", m);
  for (i = 0; i < m; i++) { 
    scanf("%d", &b[i]); 
    printf("%d ", b[i]); 
  }
  printf("\n");
  i = 0; 
  achou = 0;
  while (!achou && (i<m)) { 
    constroi(b, m, b[i], v, &nv);
    printf("Elemento = %d\n", b[i]);
    for (k = 0; k < nv; k++) 
      printf("%d ", v[k]);
    printf("\n"); 
    printf("Total = %d\n", nv);
    if (nv == m/2) 
      achou = 1;
    else 
      i = i + 1; 
  } 
  if (achou) {  
    printf("Achou o %d\n", b[i]);
    for (k = 0; k < nv; k++) 
      printf("%d ", b[v[k]]);
    printf("\n");
  } 
  constroi(b, m, 20, v, &nv);
  printf("Elemento = 20\n");
  for (k = 0; k < nv; k++) 
    printf("%d ", v[k]);
  printf("\n"); 
  return 0;
}
