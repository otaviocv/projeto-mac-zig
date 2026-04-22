// Exercício 21 de https://www.ime.usp.br/~macmulti/exercicios/inteiros/index.html
// (POLI 87) Dados n e uma sequência de n números inteiros, determinar quantos segmentos de números iguais consecutivos compõem essa sequência.
// Exemplo: A seguinte sequência é formada por 5 segmentos de números iguais:   5,  2,  2,  3,  4,  4,  4,  4,  1,  1

const std = @import("std");

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("verificador de sequencia com números consecutivos iguais:\n   n > ", .{});
    try stdout.flush();
    const n_str = try stdin.takeDelimiterExclusive('\n');
    const n = try std.fmt.parseInt(usize, n_str, 10);
    stdin.toss(1);

    var segmentos: usize = 0;
    var ultimo: usize = undefined;
    for (1..(n+1)) |i| {
        try stdout.print("{d:4} > ", .{i});
        try stdout.flush();
        const this_str = try stdin.takeDelimiterExclusive('\n');
        const this = try std.fmt.parseInt(usize, this_str, 10);
        stdin.toss(1);
        if (this != ultimo) {
            segmentos += 1;
            ultimo = this;
        }
    }
    try stdout.print("há {d} segmentos\n", .{segmentos});
    try stdout.flush();
}
