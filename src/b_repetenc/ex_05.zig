// Exercício 5 de https://www.ime.usp.br/~macmulti/exercicios/repetenc/index.html
// Sabe-se que um número da forma n^3 é igual a soma de n ímpares consecutivos.
//   Exemplo: 1^3= 1, 2^3= 3+5, 3^3= 7+9+11,  4^3= 13+15+17+19,...
// Dado m, determine os ímpares consecutivos cuja soma é igual a n^3 para n assumindo valores de 1 a m.

const std = @import("std");

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("soma só dos números primos\nn > ", .{});
    try stdout.flush();
    const n_str = try stdin.takeDelimiterExclusive('\n');
    const n = try std.fmt.parseInt(u32, n_str, 10);
    stdin.toss(1);

    for (1..(n+1)) |n_cube| {
        try stdout.print("{d}^3 = ", .{n_cube});
        const start = 2 * (n_cube - 1) + 1;
        for (0..n_cube) |termo_i| {
            const impar_i = start + termo_i * 2;
            try stdout.print("{d} ", .{impar_i});
            if (termo_i != n_cube - 1) {
                try stdout.print("+ ", .{});
            }
        }
        try stdout.print("\n", .{});
    }
    try stdout.flush();
}
