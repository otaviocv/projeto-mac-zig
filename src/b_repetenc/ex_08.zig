// Exercício 8 de https://www.ime.usp.br/~macmulti/exercicios/repetenc/index.html
// (POLI 97) Dizemos que uma seqüência de inteiros positivos é k-alternante 
// se for composta alternadamente por segmentos de números pares de tamanho k
// e segmentos de números ímpares de tamanho k.
//
// Exemplos:
//   1. A seqüência   1 3 6 8 9 11 2 4 1 7 6 8 é 2-alternante.
//   2. A seqüência   2 1 4 7 8 9 12 é 1-alternante.
//   3. A seqüência   4 2 3 1 6 4 2 9 3 não é alternante.
//   4. A seqüência   1 3 5 é 3-alternante.
//
// Dado n > 1 e uma seqüência com n inteiros, verificar se existe um inteiro k > 1
// tal que a seqüência é k-alternante. Dê como saída também o valor de k caso
// a seqüência seja alternante.

const std = @import("std");

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("sequencia k-alternante:\nn > ", .{});
    try stdout.flush();
    const n_str = try stdin.takeDelimiterExclusive('\n');
    const n = try std.fmt.parseInt(u32, n_str, 10);
    stdin.toss(1);

    var kalternancia: u32 = 0;
    var contador_segmento: u32 = 0;
    var paridade_anterior: u32 = undefined;
    var primeira_troca = true;
    var k_alternante = true;
    for (0..n) |i| {
        try stdout.print("> ", .{});
        try stdout.flush();
        const current_str = try stdin.takeDelimiterExclusive('\n');
        const current = try std.fmt.parseInt(u32, current_str, 10);
        stdin.toss(1);

        const paridade_atual: u32 = @mod(current, 2);
        if (i == 0) {
            paridade_anterior = paridade_atual;
            kalternancia += 1;
            contador_segmento += 1;
        } else if ((paridade_atual == paridade_anterior) and primeira_troca) {
            kalternancia += 1;
            contador_segmento += 1;
        } else if ((paridade_atual == paridade_anterior) and !primeira_troca) {
            contador_segmento += 1;
        } else if ((paridade_atual != paridade_anterior) and primeira_troca) {
            contador_segmento = 1;
            primeira_troca = false;
        } else {
            if (contador_segmento != kalternancia) {
                k_alternante = false;
            }
            contador_segmento = 1;
        }
        paridade_anterior = paridade_atual;
    }

    if (k_alternante) {
        try stdout.print("{d}-alternante\n", .{kalternancia});
    } else {
        try stdout.print("não alternante\n", .{});
    }

    try stdout.flush();
}
