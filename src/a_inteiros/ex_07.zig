// Exercício 7 de https://www.ime.usp.br/~macmulti/exercicios/inteiros/index.html
// Dados n e uma sequência de n números inteiros, determinar a soma dos números pares.

const std = @import("std");

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("Soma de números pares (números ímpares serão ignorados).\nQuantos números?\n> ", .{});
    try stdout.flush();
    const n_str = try stdin.takeDelimiterExclusive('\n');
    const n = try std.fmt.parseInt(usize, n_str, 10);
    stdin.toss(1);

    var sum: i32 = 0;
    for (1..n+1) |i| {
        try stdout.print("({d:2}/{d:2}): ", .{i, n});
        try stdout.flush();

        const number_str = try stdin.takeDelimiterExclusive('\n');
        const number = try std.fmt.parseInt(i32, number_str, 10);
        stdin.toss(1);

        if (@mod(number, 2) == 0) {
            sum += number;
        }
    }
    try stdout.print("\nSoma dos números pares: {d}\n", .{sum});
    try stdout.flush();
}
