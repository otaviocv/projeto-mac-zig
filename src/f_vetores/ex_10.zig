// Exercício 10 de https://www.ime.usp.br/~macmulti/exercicios/vetores/index.html
// Calcule o valor do polinômio p(x)=a0 + a1x + ... + anx^n em k pontos distintos.
// São dados os valores de n (grau do polinômio), de a0, a1, ..., an
// (coeficientes reais do polinômio), de k e dos pontos x1, x2, ..., xk.

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

    try stdout.print("k > ", .{});
    try stdout.flush();
    const k_str = try stdin.takeDelimiterExclusive('\n');
    const k = try std.fmt.parseInt(u32, k_str, 10);
    stdin.toss(1);

    var xs: [MAX]f32 = undefined;
    for (0..k) |i| {
        try stdout.print("arg{d} > ", .{i+1});
        try stdout.flush();
        const d_str = try stdin.takeDelimiterExclusive('\n');
        const d = try std.fmt.parseFloat(f32, d_str);
        stdin.toss(1);

        xs[i] = d;
    }

    try stdout.print("p(x) = ", .{});
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
    try stdout.print("\n", .{});

    for (0..k) |ri| {
        const arg = xs[ri];
        var px: f32 = 0;
        for (0..n) |exp| {
            const coef = coefs[exp];
            const exp_f: f32 = @floatFromInt(exp);
            px += (coef * std.math.pow(f32, arg, exp_f));
        }
        try stdout.print("p({d}) = {d}\n", .{arg, px});
    }

    try stdout.flush();
}
