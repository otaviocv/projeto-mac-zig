// Exercício 6 de https://www.ime.usp.br/~macmulti/exercicios/repetenc/index.html
// Dado um número inteiro positivo, determine a sua decomposição em fatores
// primos calculando também a multiplicidade de cada fator.

const std = @import("std");

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("fatoração em termos primos:\n> ", .{});
    try stdout.flush();
    const n_str = try stdin.takeDelimiterExclusive('\n');
    var n = try std.fmt.parseInt(u32, n_str, 10);
    stdin.toss(1);

    try stdout.print("{d} = ", .{n});
    var divisor: u32 = 2;
    while (n > 1) {
        // Primo força bruta sem Crivo de Eratóstenes
        var primo = true;
        for (2..divisor) |divisor_do_primo| {
            const divisor_do_primo_int: u32 = @intCast(divisor_do_primo);
            if (@mod(divisor, divisor_do_primo_int) == 0) {
                primo = false;
                break;
            }
        }

        var divisor_count: u32 = 0;
        if (primo) {
            while (@mod(n, divisor) == 0) {
                divisor_count += 1;
                n = n/divisor;
            }
            if (divisor_count > 0) {
                try stdout.print("{d}^{d}", .{divisor, divisor_count});
                if (n == 1) {
                    try stdout.print("\n", .{});
                } else {
                    try stdout.print(" + ", .{});
                }
            }
        }
        divisor += 1;
    }
    try stdout.flush();
}
