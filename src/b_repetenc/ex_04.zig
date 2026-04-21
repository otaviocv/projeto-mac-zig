// Exercício 4 de https://www.ime.usp.br/~macmulti/exercicios/repetenc/index.html
// Dados n números inteiros positivos, calcular a soma dos que são primos.

const std = @import("std");

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("soma só dos números primos\nn > ", .{});
    try stdout.flush();
    const n_str = try stdin.takeDelimiterExclusive('\n');
    const n = try std.fmt.parseInt(u32, n_str, 10);
    stdin.toss(1);
    var soma: u32 = 0;

    for (1..(n+1)) |i| {
        try stdout.print("{d:2}/{d:2} > ", .{i, n});
        try stdout.flush();
        const valor_str = try stdin.takeDelimiterExclusive('\n');
        const valor = try std.fmt.parseInt(u32, valor_str, 10);
        stdin.toss(1);


        // Primo força bruta sem Crivo de Eratóstenes
        var primo = true;
        for (2..valor) |divisor| {
            const divisor_int: u32 = @intCast(divisor);
            if (@mod(valor, divisor_int) == 0) {
                primo = false;
                break;
            }
        }

        if (primo) {
            soma += valor;
        }
    }
    try stdout.print("soma: {d}\n", .{soma});
    try stdout.flush();
}
