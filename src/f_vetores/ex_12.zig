// Exercício 12 de https://www.ime.usp.br/~macmulti/exercicios/vetores/index.html
// Dado um polinômio p(x) = a0 + a1x + ... + anx^n, calcular o polinômio
// q(x) tal que p(x)= (x-a)q(x) + p(a), para m valores distintos de a
// (Usar o método de Briot-Ruffini)
//
// Nota do resolvedor: esse m tá mal definido. Eu devo resolver entre 0,1 e m?
// Ou eu devo resolver entre -m/2 e +m/2? Se eu receber m como input eu faço
// o que com isso?
//
// Eu vou receber m como input. Se for par vou resolver para os valores de
// -m/2 até +m/2. Se for impar vou resolve para o valores de
// -floor(m/2) até ceil(m/2)
//
// Para m = 6: -2, -1, 0, 1, 2, 3
// Para m = 5: -2, -1, 1, 2

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

    try stdout.print("n > ", .{});
    try stdout.flush();
    const n_str = try stdin.takeDelimiterExclusive('\n');
    const n = try std.fmt.parseInt(u32, n_str, 10);
    stdin.toss(1);

    var coefs: [MAX]f32 = undefined;
    for (0..n) |i| {
        try stdout.print("coefs{d} > ", .{i});
        try stdout.flush();
        const d_str = try stdin.takeDelimiterExclusive('\n');
        const d = try std.fmt.parseFloat(f32, d_str);
        stdin.toss(1);
        coefs[i] = d;
    }

    try stdout.print("m > ", .{});
    try stdout.flush();
    const m_str = try stdin.takeDelimiterExclusive('\n');
    const m = try std.fmt.parseInt(u32, m_str, 10);
    stdin.toss(1);

    try stdout.print("\n\np(x) = ", .{});
    for (0..n) |i| {
        if (i == 0) {
            try stdout.print("{d}", .{coefs[i]});
        } else {
            try stdout.print("{d}x^{d}", .{coefs[i], i});
        }
        if (i < n-1) {
            try stdout.print(" + ", .{});
        }
    }
    try stdout.print("\n\n", .{});

    const m_f: f32 = @floatFromInt(m);
    for (0..m) |i| {

        const i_f: f32 = @floatFromInt(i);
        const a: f32 = @floor(m_f/2 - i_f);
        try stdout.print("a = {d} ", .{a});
        var div_coefs: [MAX]f32 = undefined;

        for (0..n) |coef_i| {
            const inverse_coef_i = n - coef_i - 1;
            if (inverse_coef_i == n-1) {
                div_coefs[inverse_coef_i] = coefs[inverse_coef_i];
            } else {
                const div_coef = div_coefs[inverse_coef_i+1] * a + coefs[inverse_coef_i];
                div_coefs[inverse_coef_i] = div_coef;
            }
        }

        try stdout.print("p(x) = (x - ({d:2})) (", .{a});
        for (1..n) |coef_i| {
            if (coef_i == 1) {
                try stdout.print("{d}", .{div_coefs[coef_i]});
            } else {
                try stdout.print("{d}x^{d}", .{div_coefs[coef_i], coef_i-1});
            }
            if (coef_i < n-1) {
                try stdout.print(" + ", .{});
            }
        }
        try stdout.print(") + ({d})\n", .{div_coefs[0]});

    }
    try stdout.flush();
}
