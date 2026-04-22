// Exercício 16 de https://www.ime.usp.br/~macmulti/exercicios/vetores/index.html
// (QUIM 84) Dada uma sequência x1, x2, ..., xk de números inteiros, verifique se
// existem dois segmentos consecutivos iguais nesta sequência, isto é, se existem
// i e m tais que:
//     xi, xi+1, ..., xi+m-1 = xi+m, xi+m+1, ..., xi+2m-1
//
// Imprima, caso existam, os valores de i e m.
// Exemplo: Na sequência  7, 9, 5, 4, 5, 4, 8, 6 existem i=3 e m=2.
//                             *1 *2 *1 *2

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
    var nums: [MAX]u32 = undefined;
    for (0..n) |i| {
        try stdout.print("{d} > ", .{i+1});
        try stdout.flush();
        const num_str = try stdin.takeDelimiterExclusive('\n');
        const num = try std.fmt.parseInt(u32, num_str, 10);
        stdin.toss(1);
        nums[i] = num;
    }

    const metade = @divFloor(n, 2);
    for (0..n) |inicio| {

        for (1..(metade+1)) |tamanho| {
            var iguais = true;
            for (0..tamanho) |i| {
                if (nums[inicio + i] != nums[inicio + tamanho + i]) {
                    iguais = false;
                    break;
                }
            }

            if (iguais) {
                try stdout.print("Solução com início em {d} e tamanho {d}\n", .{inicio+1, tamanho});
            }
        }
    }

    try stdout.flush();
}
