// Exercício 17 de https://www.ime.usp.br/~macmulti/exercicios/vetores/index.html
// Dada uma seqüência de n números inteiros, determinar um segmento de soma máxima.
// Exemplo: Na seqüência 5, 2, -2, -7, 3, 14, 10, -3, 9, -6, 4, 1, a soma do segmento é 33.
//                                     *   *   *   *  *

const std = @import("std");
const assert = std.debug.assert;
const MAX: usize = 10000;

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("n > ", .{});
    try stdout.flush();
    const n_str = try stdin.takeDelimiterExclusive('\n');
    const n = try std.fmt.parseInt(u32, n_str, 10);
    stdin.toss(1);

    assert (n >= 0 and n <= MAX);
    var nums: [MAX]i32 = undefined;
    for (0..n) |i| {
        try stdout.print("{d} > ", .{i+1});
        try stdout.flush();
        const num_str = try stdin.takeDelimiterExclusive('\n');
        const num = try std.fmt.parseInt(i32, num_str, 10);
        stdin.toss(1);
        nums[i] = num;
    }


    var max_soma: i32 = -100000000;
    for (0..n) |inicio| {
        const sobra = n - inicio;
        for (1..sobra) |tamanho| {
            var soma: i32 = 0;
            for (0..tamanho) |i| {
                soma += nums[inicio + i];
            }
            if (soma > max_soma) {
                max_soma = soma;
            }
        }
    }
    try stdout.print("Maior soma de segmento: {d}\n", .{max_soma});

    try stdout.flush();
}
