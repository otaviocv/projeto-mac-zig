// Exercício 11 de https://www.ime.usp.br/~macmulti/exercicios/reais/index.html
// Dado um inteiro positivo n, calcular e imprimir o valor da seguinte soma:
// 1/n + 2/(n-1) + 3/(n-2) ... + n/1


const std = @import("std");
const MAX_ITER = 1000000;

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("n > ", .{});
    try stdout.flush();
    const n_str = try stdin.takeDelimiterExclusive('\n');
    const n = try std.fmt.parseInt(u32, n_str, 10);
    stdin.toss(1);

    var soma: f32 = 0;
    const n_float: f32 = @floatFromInt(n);
    for (1..(n+1)) |i| {
        const i_float: f32 = @floatFromInt(i);
        const numerador = i_float;
        const denominador = n_float - (i_float - 1);
        const termo = numerador/denominador;
        soma += termo;
    }

    try stdout.print("total: {d}\n", .{soma});
    try stdout.flush();
}
