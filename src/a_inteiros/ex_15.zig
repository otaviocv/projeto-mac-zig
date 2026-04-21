// Exercício 15 de https://www.ime.usp.br/~macmulti/exercicios/inteiros/index.html
// Dizemos que um número i é congruente módulo m a j se i % m = j % m.
// Exemplo: 35 é congruente módulo 4 a 39, pois 35 % 4 = 3 = 39 % 4.
// Dados inteiros positivos n, j e m, imprimir os n primeiros naturais congruentes a j módulo m.

const std = @import("std");

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    // n
    try stdout.print("congruência a modulo\nn > ", .{});
    try stdout.flush();
    const n_str = try stdin.takeDelimiterExclusive('\n');
    const n = try std.fmt.parseInt(i32, n_str, 10);
    stdin.toss(1);

    // j
    try stdout.print("j > ", .{});
    try stdout.flush();
    const j_str = try stdin.takeDelimiterExclusive('\n');
    const j = try std.fmt.parseInt(i32, j_str, 10);
    stdin.toss(1);

    // m
    try stdout.print("m > ", .{});
    try stdout.flush();
    const m_str = try stdin.takeDelimiterExclusive('\n');
    const m = try std.fmt.parseInt(i32, m_str, 10);
    stdin.toss(1);

    var count: usize = 0;
    const max_usize: usize = std.math.maxInt(usize);
    const congruent_value = @mod(j, m);
    for (1..max_usize) |number| {
        const number_int: i32 = @intCast(number);
        const this_congruent = @mod(number_int, m);
        if (congruent_value == this_congruent) {
            try stdout.print("{d:3}: {d}\n", .{count, number});
            count += 1;
        }
        if (count >= n) {
            break;
        }

    }
    try stdout.flush();

}
