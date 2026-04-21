// Exercício 3 de https://www.ime.usp.br/~macmulti/exercicios/matrizes/index.html
// Dadas duas matrizes reais A_mxn e B_nxp, calcular o produto de A por B.

const std = @import("std");
const assert = std.debug.assert;
const MAX: usize = 1000;


pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("m n p > ", .{});
    try stdout.flush();

    const m_str = try stdin.takeDelimiterExclusive(' ');
    const m = try std.fmt.parseInt(u32, m_str, 10);
    stdin.toss(1);
    assert(m <= MAX);

    const n_str = try stdin.takeDelimiterExclusive(' ');
    const n = try std.fmt.parseInt(u32, n_str, 10);
    stdin.toss(1);
    assert(n <= MAX);

    const p_str = try stdin.takeDelimiterExclusive('\n');
    const p = try std.fmt.parseInt(u32, p_str, 10);
    stdin.toss(1);
    assert(p <= MAX);

    try stdout.print("matriz m n >\n", .{});
    try stdout.flush();

    var A: [MAX][MAX]i32 = undefined;
    for (0..m) |i| {
        for (0..(n-1)) |j| {
            const num_str = try stdin.takeDelimiterExclusive(' ');
            const num = try std.fmt.parseInt(i32, num_str, 10);
            stdin.toss(1);
            A[i][j] = num;
        }
        const num_str = try stdin.takeDelimiterExclusive('\n');
        const num = try std.fmt.parseInt(i32, num_str, 10);
        stdin.toss(1);
        A[i][n-1] = num;
    }

    try stdout.print("matriz n p >\n", .{});
    try stdout.flush();

    var B: [MAX][MAX]i32 = undefined;
    for (0..n) |i| {
        for (0..(p-1)) |j| {
            const num_str = try stdin.takeDelimiterExclusive(' ');
            const num = try std.fmt.parseInt(i32, num_str, 10);
            stdin.toss(1);
            B[i][j] = num;
        }
        const num_str = try stdin.takeDelimiterExclusive('\n');
        const num = try std.fmt.parseInt(i32, num_str, 10);
        stdin.toss(1);
        B[i][p-1] = num;
    }


    try stdout.print("matriz m p >\n", .{});
    for (0..m) |i| {
        for (0..p) |j| {
            var soma: i32 = 0;
            for (0..n) |k| {
                soma += A[i][k] * B[k][j];
            }
            try stdout.print("{d} ", .{soma});
        }
        try stdout.print("\n", .{});
    }

    try stdout.flush();
}
