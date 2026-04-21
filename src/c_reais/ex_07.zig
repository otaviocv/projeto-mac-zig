// Exercício 7 de https://www.ime.usp.br/~macmulti/exercicios/reais/index.html
// Dados x e epsilon reais, epsilon > 0, calcular uma aproximação para sen x através da seguinte série infinita
// sen x = x/1! - x^3/3! + x^5/5! - ... + (-1)^k x^(2k + 1)/(2k + 1)!
// incluindo todos os termos até que
// | x^(2k + 1)| / (2k + 1)! < epsilon
// Compare com os resultados de sua calculadora!


const std = @import("std");
const pow = std.math.pow;
const MAX_ITER = 1000000;

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("Aproximador de sen \nx > ", .{});
    try stdout.flush();
    const x_str = try stdin.takeDelimiterExclusive('\n');
    const x = try std.fmt.parseFloat(f32, x_str);
    stdin.toss(1);

    try stdout.print("tolerancia > ", .{});
    try stdout.flush();
    const eps_str = try stdin.takeDelimiterExclusive('\n');
    const eps = try std.fmt.parseFloat(f32, eps_str);
    stdin.toss(1);

    var soma: f32 = 0;
    for (0..MAX_ITER) |k| {
        const k_float: f32 = @floatFromInt(k);
        
        var fatorial: f32 = 1.0;
        for(1..(2*k+2)) |i| {
            fatorial *= @floatFromInt(i);
        }


        const sinal = pow(f32, -1.0, k_float);
        const expoente: f32 = 2.0 * k_float + 1.0;
        const numerador: f32 = pow(f32, x, expoente);
        const termo: f32 = sinal * numerador/fatorial;

        if (@abs(termo) < eps) {
            break;
        }

        soma += termo;
    }
    try stdout.print("sen(x) = {d:0.20} \n", .{soma});
    try stdout.flush();
}
