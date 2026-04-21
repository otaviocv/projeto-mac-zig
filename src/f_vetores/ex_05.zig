// Exercício 5 de https://www.ime.usp.br/~macmulti/exercicios/vetores/index.html
// Faça um programa para resolver o seguinte problema:
//
//     São dadas as coordenadas reais x e y de um ponto, um número natural n,
//     e as coordenadas reais de n pontos (1 < n < 100). Deseja-se calcular e
//     imprimir sem repetição os raios das circunferências centradas no ponto
//     (x,y) que passam por pelo menos um dos n pontos dados.
//
// Exemplo : (x,y) = (1.0, 1.0) ; n = 5
// Pontos  : (-1.0, 1.2) , (1.5, 2.0) , (0.0, -2.0) , (0.0, 0.5) , (4.0, 2.0)
// Nesse caso há três circunferências de raios: 1.12,  2.01 e 3.162.
// Observações:
//     - Distância entre os pontos (a,b) e (c,d) é sqrt((a - c)^2 + (b - d)^2)
//     - Dois pontos estão na mesma circunferência se estão à mesma distância do centro.

const std = @import("std");
const assert = std.debug.assert;
const MAX: usize = 10000;

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("centro cx cy > \n", .{});
    try stdout.flush();
    const cx_str = try stdin.takeDelimiterExclusive(' ');
    const cx = try std.fmt.parseFloat(f32, cx_str);
    stdin.toss(1);
    const cy_str = try stdin.takeDelimiterExclusive('\n');
    const cy = try std.fmt.parseFloat(f32, cy_str);
    stdin.toss(1);

    try stdout.print("número de pontos\n> ", .{});
    try stdout.flush();
    const n_str = try stdin.takeDelimiterExclusive('\n');
    const n = try std.fmt.parseInt(u32, n_str, 10);
    stdin.toss(1);

    var raios: [MAX]f32 = undefined;
    var n_raios: usize = 0;

    for (0..n) |_| {
        try stdout.print("x y > ", .{});
        try stdout.flush();
        const x_str = try stdin.takeDelimiterExclusive(' ');
        const x = try std.fmt.parseFloat(f32, x_str);
        stdin.toss(1);
        const y_str = try stdin.takeDelimiterExclusive('\n');
        const y = try std.fmt.parseFloat(f32, y_str);
        stdin.toss(1);

        const raio = @sqrt(std.math.pow(f32, cx - x, 2) + std.math.pow(f32, cy - y, 2));

        var novo: bool = true;
        for (0.. n_raios) |j| {
            if (raio == raios[j]) {
                novo = false;
            }
        }

        if (novo) {
            raios[n_raios] = raio;
            n_raios += 1;
        }
    }

    try stdout.print("raios distintos: \n", .{});
    for (0..n_raios) |i| {
        try stdout.print("{d} ", .{raios[i]});
    }
    try stdout.print("\n", .{});
    try stdout.flush();

}
