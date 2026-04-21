// Exercício 22 de https://www.ime.usp.br/~macmulti/exercicios/inteiros/index.html
// (POLI 89) Dados n e uma seqüência de n números inteiros, determinar o comprimento de um segmento crescente de comprimento máximo.
// Exemplos:
//   Na seqüência   5,  10,  3,  2,  4,  7,  9,  8,  5   o comprimento do segmento crescente máximo é 4.
//   Na seqüência   10,  8,  7,  5,  2   o comprimento de um segmento crescente máximo é 1.

const std = @import("std");

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("verificador de maior sequencia crescente:\n   n > ", .{});
    try stdout.flush();
    const n_str = try stdin.takeDelimiterExclusive('\n');
    const n = try std.fmt.parseInt(usize, n_str, 10);
    stdin.toss(1);

    var segmentos: usize = 0;
    var max_segmento: usize = 0;
    var max: usize = 0;
    var ultimo: usize = 0;
    for (1..(n+1)) |i| {
        try stdout.print("{d:4} > ", .{i});
        try stdout.flush();
        const this_str = try stdin.takeDelimiterExclusive('\n');
        const this = try std.fmt.parseInt(usize, this_str, 10);
        stdin.toss(1);
        if (this >= ultimo) {
            segmentos += 1;
            max = this;
        } else {
            max = 0;
            if (segmentos > max_segmento) {
                max_segmento = segmentos;
            }
            segmentos = 1;
        }
        try stdout.print("this: {d} ultimo: {d} segmentos: {d} max: {d} max_segmento: {d}\n", .{this, ultimo, segmentos, max, max_segmento});
        ultimo = this;
    }
    if (segmentos > max_segmento) {
        max_segmento = segmentos;
    }
    try stdout.print("maior segmento crescente tem tamanho {d}\n", .{max_segmento});
    try stdout.flush();
}
