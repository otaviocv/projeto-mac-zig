// Exercício 8 de https://www.ime.usp.br/~macmulti/exercicios/inteiros/index.html
// Dado um inteiro não-negativo n, determinar n!

const std = @import("std");

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("Função fatorial\n> ", .{});
    try stdout.flush();
    const n_str = try stdin.takeDelimiterExclusive('\n');
    const n = try std.fmt.parseInt(usize, n_str, 10);
    stdin.toss(1);

    var sum: u64 = 1;
    for (1..n+1) |i| {
        sum *= @intCast(i);
    }
    try stdout.print("\nFatorial de {d}: {d}\n", .{n, sum});
    try stdout.flush();
}
