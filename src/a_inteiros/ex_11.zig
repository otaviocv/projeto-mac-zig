// Exercício 11 de https://www.ime.usp.br/~macmulti/exercicios/inteiros/index.html
// Dado um inteiro positivo n, verificar se n é primo.

const std = @import("std");

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("Verificador de número primo\n> ", .{});
    try stdout.flush();
    const n_str = try stdin.takeDelimiterExclusive('\n');
    const n = try std.fmt.parseInt(usize, n_str, 10);
    stdin.toss(1);

    var count: usize = 0;
    for (1..n+1) |factor| {
        if (@mod(n, factor) == 0) {
            count += 1;
        }
    }
    if (count == 2) {
        try stdout.print("{d} é primo", .{n});
    } else {
        try stdout.print("{d} não é primo", .{n});
    }
    try stdout.print("\n", .{});
    try stdout.flush();
}
