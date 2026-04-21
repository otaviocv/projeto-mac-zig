// Exercício 17 de https://www.ime.usp.br/~macmulti/exercicios/inteiros/index.html
// Dado um número natural na base decimal, transformá-lo para a base binária.
// Exemplo: Dado 18 a saída deverá ser 10010.

const std = @import("std");

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    // n
    try stdout.print("decimal para binário\n> ", .{});
    try stdout.flush();
    const n_str = try stdin.takeDelimiterExclusive('\n');
    var n = try std.fmt.parseInt(i32, n_str, 10);
    stdin.toss(1);


    const max_usize: usize = std.math.maxInt(usize);
    var result: i32 = 0;
    for (0..max_usize) |base_exponent| {
        const last_digit = @mod(n, 2);
        n = @divTrunc(n, 2);
        result += std.math.pow(i32, 10, @intCast(base_exponent)) * last_digit;
        if (n <= 0) {
            break;
        }
    }
    try stdout.print("{d}\n", .{result});
    try stdout.flush();
}
