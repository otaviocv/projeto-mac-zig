// Exercício 2 de https://www.ime.usp.br/~macmulti/exercicios/inteiros/index.html
// Dado um número inteiro positivo n, calcular a soma dos n primeiros números inteiros positivos.

const std = @import("std");

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    var integer: usize = undefined;
    try stdout.print("soma triangular:\n> ", .{});
    try stdout.flush();
    const number_str = try stdin.takeDelimiterExclusive('\n');
    integer = (try std.fmt.parseInt(usize, number_str, 10)) + 1;

    var result: i32 = 0;
    for (1..integer) |i| {
        result += @intCast(i);
    }

    try stdout.print("{d}\n", .{result});
    try stdout.flush();
}
