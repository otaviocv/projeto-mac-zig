// Exercício 13 de https://www.ime.usp.br/~macmulti/exercicios/vetores/index.html
// Dados dois polinômios reais
// p(x)= a0 + a1x + ... + anx^n
// q(x)= b0 + b1x + ... + bmx^m
// determinar o produto desses polinômios.

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

    var n_coefs: [MAX]f32 = undefined;
    for (0..n) |i| {
        try stdout.print("n coefs{d} > ", .{i});
        try stdout.flush();
        const d_str = try stdin.takeDelimiterExclusive('\n');
        const d = try std.fmt.parseFloat(f32, d_str);
        stdin.toss(1);
        n_coefs[i] = d;
    }

    try stdout.print("m > ", .{});
    try stdout.flush();
    const m_str = try stdin.takeDelimiterExclusive('\n');
    const m = try std.fmt.parseInt(u32, m_str, 10);
    stdin.toss(1);

    assert(n + m < MAX);

    var m_coefs: [MAX]f32 = undefined;
    for (0..m) |i| {
        try stdout.print("m coefs{d} > ", .{i});
        try stdout.flush();
        const d_str = try stdin.takeDelimiterExclusive('\n');
        const d = try std.fmt.parseFloat(f32, d_str);
        stdin.toss(1);
        m_coefs[i] = d;
    }

    var r_coefs: [MAX]f32 = undefined;
    for (0..MAX) |i| {
        r_coefs[i] = 0;
    }

    for (0..n) |ni| {
        for (0..m) |mi| {
            const grau = ni + mi;
            r_coefs[grau] += n_coefs[ni] * m_coefs[mi];
        }
    }
    try stdout.print("\np(x) = ", .{});
    try print_poli(stdout, &n_coefs, n);
    try stdout.print("\n", .{});
    try stdout.print("q(x) = ", .{});
    try print_poli(stdout, &m_coefs, m);
    try stdout.print("\n", .{});
    try stdout.print("r(x) = ", .{});
    try print_poli(stdout, &r_coefs, n+m-1);
    try stdout.print("\n", .{});
    try stdout.flush();
}

fn print_poli(stdout: *std.Io.Writer, coefs: []f32, max_grau: u32) !void {
    for (0..max_grau) |i| {
        if (coefs[i] == 0) {
            continue;
        }
        if (i == 0) {
            try stdout.print("{d}", .{coefs[i]});
        } else {
            try stdout.print("{d}x^{d}", .{coefs[i], i});
        }

        if (i < max_grau-1) {
            try stdout.print(" + ", .{});
        }
    }
}
