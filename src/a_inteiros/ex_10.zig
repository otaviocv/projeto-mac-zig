// Exercício 10 de https://www.ime.usp.br/~macmulti/exercicios/inteiros/index.html
// Dizemos que um número natural é triangular se ele é produto de três números naturais consecutivos.
// Dado um inteiro não-negativo n, verificar se n é triangular.

const std = @import("std");

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("Verificador de number triangular\n> ", .{});
    try stdout.flush();
    const n_str = try stdin.takeDelimiterExclusive('\n');
    const n = try std.fmt.parseInt(i32, n_str, 10);
    stdin.toss(1);

    const max_usize: usize = std.math.maxInt(usize);
    for (1..max_usize) |number| {
        const number_int: i32 = @intCast(number);
        if (number_int * (number_int + 1) * (number_int + 2) == n) {
            try stdout.print("{} é triangular: {d} * {d} * {d}\n", .{n, number, number + 1, number + 2});
            break;
        }
        if (number_int * (number_int + 1) * (number_int + 2) < n) {
            continue;
        }
        if (number_int * (number_int + 1) * (number_int + 2) > n) {
            try stdout.print("{} não é triangular\n", .{n});
            break;
        }
    }
    try stdout.flush();
}
