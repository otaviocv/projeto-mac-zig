// Exercício 6 de https://www.ime.usp.br/~macmulti/exercicios/reais/index.html
// Dados x real e n natural, calcular uma aproximação para cos x através dos n primeiros termos da seguinte série:
// cos x = 1 - x^2/2! + x^4/4! - x^6/6! ... + (-1)^k x^2k/(2k)!
// Compare com os resultados de sua calculadora!


const std = @import("std");
const pow = std.math.pow;

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("Aproximador de cos \nx > ", .{});
    try stdout.flush();
    const x_str = try stdin.takeDelimiterExclusive('\n');
    const x = try std.fmt.parseFloat(f32, x_str);
    stdin.toss(1);

    try stdout.print("n > ", .{});
    try stdout.flush();
    const n_str = try stdin.takeDelimiterExclusive('\n');
    const n = try std.fmt.parseInt(usize, n_str, 10);
    stdin.toss(1);

    var soma: f32 = 1;
    for (1..(n+1)) |k| {
        const k_float: f32 = @floatFromInt(k);
        
        var fatorial: f32 = 1.0;
        for(1..(2*k+1)) |i| {
            fatorial *= @floatFromInt(i);
        }

        const sinal = pow(f32, -1.0, k_float);
        const expoente: f32 = 2.0 * k_float;
        const numerador: f32 = pow(f32, x, expoente);
        const termo: f32 = sinal * numerador/fatorial;
        soma += termo;
    }
    try stdout.print("cos(x) = {d:0.20} \n", .{soma});
    try stdout.flush();
}
