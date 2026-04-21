// Exercício 3 de https://www.ime.usp.br/~macmulti/exercicios/inteiros/index.html
// Dado um número inteiro positivo n, imprimir os n primeiros naturais ímpares.

const std = @import("std");

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    var integer: usize = undefined;
    try stdout.print("sequência de números ímpares. tamanho:\n> ", .{});
    try stdout.flush();
    const number_str = try stdin.takeDelimiterExclusive('\n');
    integer = try std.fmt.parseInt(usize, number_str, 10);

    for (0..integer) |i| {
        try stdout.print("{d} ", .{i * 2 + 1});
    }
    try stdout.print("\n", .{});
    try stdout.flush();
}
