// Exercício 4 de https://www.ime.usp.br/~macmulti/exercicios/funcoes1/index.html
// (POLI 97)
//
// (a) Faça uma função arctan que recebe o número real x ∈ [0,1] e devolve uma
// aproximação do arco tangente de x (em radianos) através da série incluindo todos
// os termos da série:
//
//  arctan(x) = x - x^3/3 + x^5/5 + x^7/7 ...
//
// incluindo todos os termos da série até
//     |x^k/k| < 0.0001
//
// (b) Faça uma função angulo que recebe um ponto de coordenadas cartesianas reais (x,y),
// com x > 0 e y > 0 e devolve o ângulo formado pelo vetor (x,y) e o eixo horizontal.
//
// Exemplos: Observe a figura abaixo e verifique que os ângulos correspondentes aos pontos
// marcados é aproximadamente
//
//  ┌────────┬──────────┐
//  │ Ponto  │  Angulo  │
//  ├────────┼──────────┤
//  │ (0,1)  │ 90 graus │
//  │ (2,2)  │ 45 graus │
//  │ (1,4)  │ 75 graus │
//  │ (5,1)  │ 11 graus │
//  └────────┴──────────┘
//
// Use a função do item anterior mesmo que você não a tenha feito. Note que a função só calcula
// o arco tangente de números entre 0 e 1, e o valor devolvido é o ângulo em radianos
// (use o valor π = 3.14 radianos = 180 graus).
// Para calcular o valor do ângulo α pedido, use a seguinte fórmula:
//
//      α = arctan(y/x)         caso y < x,
//          π/2 - arctan(x/y)   caso x>= y
//
// (c) Faça um programa que, dados n pontos do primeiro quadrante (x >= 0 e y >= 0) através de suas
// coordenadas cartesianas, determina o ponto que forma o menor ângulo com o eixo horizontal.
// Use a função do item anterior, mesmo que você não a tenha feito.


const std = @import("std");
const assert = std.debug.assert;

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("Qual é o angulo mínimo?\nn > ", .{});
    try stdout.flush();
    const n_str = try stdin.takeDelimiterExclusive('\n');
    const n = try std.fmt.parseInt(usize, n_str, 10);
    stdin.toss(1);

    var min_angulo: f32 = 1e32;
    var arg_x: f32 = undefined;
    var arg_y: f32 = undefined;
    for (0..n) |_| {
        try stdout.print("(x,y) > ", .{});
        try stdout.flush();
        const x_str = try stdin.takeDelimiterExclusive(' ');
        const x = try std.fmt.parseFloat(f32, x_str);
        stdin.toss(1);
        const y_str = try stdin.takeDelimiterExclusive('\n');
        const y = try std.fmt.parseFloat(f32, y_str);
        stdin.toss(1);

        assert(x >= 0.0);
        assert(y >= 0.0);

        const esse_angulo = angulo(x,y);
        try stdout.print("({d}, {d}) -> {d} rad, {d} deg\n", .{x, y, esse_angulo, rad_deg(esse_angulo)});
        if (esse_angulo < min_angulo) {
            min_angulo = esse_angulo;
            arg_x = x;
            arg_y = y;
        }

    }
    try stdout.print("O ponto com o menor angulo com o eixo horizontal é o ponto ({d}, {d}) com o angulo {d} rad ({d} deg)\n", .{arg_x, arg_y, min_angulo, rad_deg(min_angulo)});
    try stdout.flush();
}

const TOLERAN = 0.0001;
//  arctan(x) = x - x^3/3 + x^5/5 - x^7/7 ...
//  até (incluindo)
//  |x^k/k| < 0.0001
fn arctan(tangente: f32) f32 {
    assert(tangente <= 1.0);
    assert(tangente >= 0.0);
    var sign: f32 = 1;
    var approx: f32 = 0.0;
    for (0..10000000) |i| {
        const b: f32 = @floatFromInt(2*i + 1);
        const termo = std.math.pow(f32, tangente, b)/b;
        approx += sign * termo;
        if (termo < TOLERAN) {
            break;
        }
        sign *= -1;
    }
    return approx;
}

const PI = 3.14;

fn angulo(x: f32, y: f32) f32 {
    if (y < x) {
        return arctan(y/x);
    } else {
        return PI/2.0 - arctan(x/y);

    }
}

fn rad_deg(a: f32) f32 {
    return (360.0/(2 * PI)) * a;
}
