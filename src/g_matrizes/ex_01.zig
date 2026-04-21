// Exercício 1 de https://www.ime.usp.br/~macmulti/exercicios/matrizes/index.html
// Dada uma matriz real A com m linhas e n colunas e um vetor real V com n elementos,
// determinar o produto de A por V.
//
// Nota do resolvedor: produto de A por V significa A * V ou V * A?

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

    try stdout.print("n m > ", .{});
    try stdout.flush();
    const n_str = try stdin.takeDelimiterExclusive(' ');
    const n = try std.fmt.parseInt(u32, n_str, 10);
    stdin.toss(1);
    assert(n <= MAX);

    const m_str = try stdin.takeDelimiterExclusive('\n');
    const m = try std.fmt.parseInt(u32, m_str, 10);
    stdin.toss(1);
    assert(m <= MAX);
    try stdout.print("valores da matriz n m >\n", .{});
    try stdout.flush();

    var matriz: [MAX][MAX]i32 = undefined;
    for (0..n) |i| {
        for (0..(m-1)) |j| {
            const num_str = try stdin.takeDelimiterExclusive(' ');
            const num = try std.fmt.parseInt(i32, num_str, 10);
            stdin.toss(1);
            matriz[i][j] = num;
        }
        const num_str = try stdin.takeDelimiterExclusive('\n');
        const num = try std.fmt.parseInt(i32, num_str, 10);
        stdin.toss(1);
        matriz[i][m-1] = num;
    }

    try stdout.print("valores do vetor n >\n", .{});
    try stdout.flush();
    var vetor: [MAX]i32 = undefined;
    for (0..(n-1)) |i| {
        const num_str = try stdin.takeDelimiterExclusive(' ');
        const num = try std.fmt.parseInt(i32, num_str, 10);
        stdin.toss(1);
        vetor[i] = num;
    }
    const num_str = try stdin.takeDelimiterExclusive('\n');
    const num = try std.fmt.parseInt(i32, num_str, 10);
    stdin.toss(1);
    vetor[n-1] = num;

    var produto: [MAX]i32 = undefined;
    for (0..n) |i| {
        produto[i] = 0;
    }

    for (0..n) |i| {
        for (0..m) |j| {
            produto[i] += vetor[j] * matriz[i][j];
        }
    }

    try stdout.print("produto:\n", .{});
    for (0..n) |i| {
        try stdout.print("{d} ", .{produto[i]});
    }
    try stdout.print("\n", .{});
    try stdout.flush();
}
