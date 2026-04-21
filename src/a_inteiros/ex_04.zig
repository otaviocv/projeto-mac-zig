// Exercício 4 de https://www.ime.usp.br/~macmulti/exercicios/inteiros/index.html
// Dados um inteiro x e um inteiro não-negativo n, calcular x^n.

const std = @import("std");

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("função potência\n", .{});
    try stdout.print("base: ", .{});
    try stdout.flush();

    const base_str = try stdin.takeDelimiterExclusive('\n');
    var base: i32 = undefined;
    base = try std.fmt.parseInt(i32, base_str, 10);
    stdin.toss(1);

    try stdout.print("expoente: ", .{});
    try stdout.flush();

    const exponent_str = try stdin.takeDelimiterExclusive('\n');
    var exponent: i32 = undefined;
    exponent = try std.fmt.parseInt(i32, exponent_str, 10);

    try stdout.print("{d}\n", .{std.math.pow(i32, base, exponent)});
    try stdout.flush();
}
