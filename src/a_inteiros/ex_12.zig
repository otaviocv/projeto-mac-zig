// Exercício 12 de https://www.ime.usp.br/~macmulti/exercicios/inteiros/index.html
// Dados dois números inteiros positivos, determinar o máximo divisor comum entre eles usando o algoritmo de Euclides.

const std = @import("std");

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("MDC pelo método de Euclides\na > ", .{});
    try stdout.flush();
    const a_str = try stdin.takeDelimiterExclusive('\n');
    var a = try std.fmt.parseInt(i32, a_str, 10);
    stdin.toss(1);
    try stdout.print("b > ", .{});
    try stdout.flush();
    const b_str = try stdin.takeDelimiterExclusive('\n');
    var b = try std.fmt.parseInt(i32, b_str, 10);
    var r: i32 = undefined;

    while (b != 0) {
        r = @mod(a, b);
        a = b;
        b = r;
    }
    try stdout.print("MDC: {d}\n", .{a});
    try stdout.flush();
}
