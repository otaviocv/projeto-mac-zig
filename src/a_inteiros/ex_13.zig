// Exercício 13 de https://www.ime.usp.br/~macmulti/exercicios/inteiros/index.html
// Dizemos que um inteiro positivo n é perfeito se for igual à soma de seus divisores positivos diferentes de n.
// Dado um inteiro positivo n, verificar se n é perfeito.

const std = @import("std");

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("Verificador de número perfeito\n> ", .{});
    try stdout.flush();
    const n_str = try stdin.takeDelimiterExclusive('\n');
    const n = try std.fmt.parseInt(usize, n_str, 10);

    var sum: usize = 0;
    for (1..n) |divisor| {
        if (@mod(n, divisor) == 0) {
            sum += divisor;
        }
    }

    if (sum == n) {
        try stdout.print("{d} é perfeito\n", .{n});
    } else {
        try stdout.print("{d} não é perfeito\n", .{n});
    }
    try stdout.flush();

}
