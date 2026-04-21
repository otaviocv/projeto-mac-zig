// Exercício 25 de https://www.ime.usp.br/~macmulti/exercicios/inteiros/index.html
// Simule a execução do programa abaixo destacando a sua saída:

#include <stdio.h>

int main() {
    int a, b, total, soma, termo, i;
    printf("Digite um par de numeros: ");
    scanf("%d %d", &a, &b);
    printf("(%d, %d)\n", a, b);
    total = 0; 
    soma  = 0;
    while (a != 0) { 
        total = total + 1; 
        termo = 1;
        for (i = 1; i <= b; i++)
            termo = termo * a;
        printf("Resp = %d\n", termo);
        soma = soma + termo;
        printf("Soma = %d\n", soma);
        printf("Digite um par de numeros: ");
        scanf("%d %d", &a, &b);
        printf("(%d, %d)\n", a, b);
    }
    printf("Total de pares: %d\n", total);
    return 0;
}
