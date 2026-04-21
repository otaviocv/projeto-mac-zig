// Exercício 3 de https://www.ime.usp.br/~macmulti/exercicios/funcoes1/index.html
// (MAT - 94) Uma seqüência de n números inteiros não nulos é dita piramidal
// m-alternante se é constituída por m segmentos: o primeiro com um elemento,
// o segundo com dois elementos e assim por diante até o m-ésimo, com m elementos.
// Além disso, os elementos de um mesmo segmento devem ser todos pares ou todos ímpares
// e para cada segmento, se seus elementos forem todos pares (ímpares),
// os elementos do segmento seguinte devem ser todos ímpares (pares).
//
// Por exemplo, a seqüência com n = 10 elementos:
// 12      3  7         2  10  4        5  13  5  11
// é piramidal 4-alternante.
//
// A seqüência com n = 3 elementos:
// 7         10  2
// é   piramidal 2-alternante.
//
// A seqüência com n = 8 elementos:
// 1     12   4        3  13  5       12  6
// não é piramidal alternante pois o último segmento não tem tamanho 4.
//
// (a) Escreva uma função bloco que recebe como parâmetro um inteiro n e
// lê n inteiros do teclado, devolvendo um dos seguintes valores:
//      0,  se os n números lidos forem pares;
//      1,  se os n números lidos forem ímpares;
//     -1,  se entre os n números lidos há números com paridades diferentes.
//
// (b) usando a função do item anterior, escreva um programa que,
// dados um inteiro n > 1 e uma seqüência de n números inteiros,
// verifica se ela é piramidal m-alternante.
//
// O programa deve imprimir o valor de m ou dar a resposta não.
//
// Notas do resolvedor:
// - Se n não for triangular, (n = 1 + 2 + 3 .. k para algum k)
// a seq nunca vai ser m-alternante. Mas vou ignorar isso.
// - Não sei se o jeito sugerido pelo enunciado é o melhor jeito de resolver
// o problemas mas vou seguir da forma sugerida.

const std = @import("std");

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("seq m-alternante?\nn > ", .{});
    try stdout.flush();
    const n_str = try stdin.takeDelimiterExclusive('\n');
    const n = try std.fmt.parseInt(usize, n_str, 10);
    stdin.toss(1);

    var levels: usize = 1;
    var remaining = n;
    var paridade_anterior: i32 = undefined;
    var malt = true;
    while (remaining > 0) {
        if (levels <= remaining and levels == 1) {
            paridade_anterior = try todos_mesma_paridade_com_leitura(stdin, stdout, levels);
        } else if (levels <= remaining) {
            const paridade_atual = try todos_mesma_paridade_com_leitura(stdin, stdout, levels);
            if (paridade_atual == -1 or (paridade_atual == paridade_anterior)) {
                malt = false;
            } else {
                paridade_anterior = paridade_atual;
            }
        } else {
            malt = false;
            _ = try todos_mesma_paridade_com_leitura(stdin, stdout, remaining);
            break;
        }
        remaining -= levels;
        levels += 1;
    }

    if (malt) {
        try stdout.print("a seq é {d}-alternante\n", .{levels - 1});
    } else {
        try stdout.print("a seq não é m-alternante\n", .{});
    }

    try stdout.flush();
}

fn todos_mesma_paridade_com_leitura(stdin: *std.Io.Reader, stdout: *std.Io.Writer, n: usize) !i32 {
    var paridade: i32 = undefined;
    for (0..n) |i| {
        try stdout.print("> ", .{});
        try stdout.flush();
        const number_str = try stdin.takeDelimiterExclusive('\n');
        const number = try std.fmt.parseInt(usize, number_str, 10);
        stdin.toss(1);

        const number_paridade: i32 = @intCast(@mod(number, 2));

        if (i == 0) {
            paridade = number_paridade;
        } else if (number_paridade != paridade) {
            return -1;
        }
    }
    return paridade;
}
