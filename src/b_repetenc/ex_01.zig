// Exercício 1 de https://www.ime.usp.br/~macmulti/exercicios/repetenc/index.html
// Dados n e n sequências de números inteiros não-nulos,
// cada qual seguida por um 0,
// calcular a soma dos números pares de cada sequência.

const std = @import("std");

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("soma de números pares de n sequências\nn > ", .{});
    try stdout.flush();
    const n_str = try stdin.takeDelimiterExclusive('\n');
    const n = try std.fmt.parseInt(u32, n_str, 10);
    stdin.toss(1);

    for(1..(n+1)) |line| {
        try stdout.print("{d}/{d}:\n", .{line, n});
        try stdout.flush();
        var soma: u32 = 0;
        var valor: u32 = undefined;
        while (valor != 0) {
            const valor_str = try stdin.takeDelimiterExclusive('\n');
            stdin.toss(1);
            valor = try std.fmt.parseInt(u32, valor_str, 10);
            if (@mod(valor, 2) == 0) {
                soma += valor;
            }
        }
        try stdout.print("soma: {d}\n", .{soma});
    }
}
