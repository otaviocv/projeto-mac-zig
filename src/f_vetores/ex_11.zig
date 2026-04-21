// Exercício 11 de https://www.ime.usp.br/~macmulti/exercicios/vetores/index.html
// Dado o polinômio p(x)=a0 + a1x +...+ anx^n, isto é, os valores de n e
// de a0, a1, ..., an  , determine os coeficientes reais da primeira derivada
// de p(x).

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

    try stdout.print("p'(x) = ", .{});
    for (1..n) |i| {
        const i_f: f32 = @floatFromInt(i);
        const d_coef: f32 =  i_f * coefs[i];
        const new_exp = i - 1;
        if (i == 1) {
            try stdout.print("{d}", .{d_coef});
        } else {
            try stdout.print("{d}x^{d}", .{d_coef, new_exp});
        }

        if (i < n-1) {
            try stdout.print(" + ", .{});
        }
    }
    try stdout.print("\n", .{});
    try stdout.flush();
}
