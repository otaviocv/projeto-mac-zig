// Exercício 8 de https://www.ime.usp.br/~macmulti/exercicios/vetores/index.html
// Dados dois números naturais m e n e duas sequências ordenadas com m e n
// números inteiros, obter uma única sequência ordenada contendo todos os
// elementos das sequências originais sem repetição.
//
// Sugestão: Imagine uma situação real, por exemplo, dois fichários de uma biblioteca.

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

    try stdout.print("m > ", .{});
    try stdout.flush();
    const m_str = try stdin.takeDelimiterExclusive('\n');
    const m = try std.fmt.parseInt(u32, m_str, 10);
    stdin.toss(1);

    assert(n + m < MAX);

    var ns: [MAX]i32 = undefined;
    for (0..n) |i| {
        try stdout.print("n {d} > ", .{i+1});
        try stdout.flush();
        const x_str = try stdin.takeDelimiterExclusive('\n');
        const x = try std.fmt.parseInt(i32, x_str, 10);
        stdin.toss(1);

        ns[i] = x;
    }


    var ms: [MAX]i32 = undefined;
    for (0..m) |i| {
        try stdout.print("m {d} > ", .{i+1});
        try stdout.flush();
        const x_str = try stdin.takeDelimiterExclusive('\n');
        const x = try std.fmt.parseInt(i32, x_str, 10);
        stdin.toss(1);

        ms[i] = x;
    }

    var out: [MAX]i32 = undefined;

    var ni: u32 = 0;
    var mi: u32 = 0;
    var outi: u32 = 0;
    while (ni < n or mi < m) {
        if (ni >= n) {
            out[outi] = ms[mi];
            mi += 1;
        } else if (mi >= m) {
            out[outi] = ns[ni];
            ni += 1;
        } else if (ns[ni] < ms[mi]) {
            out[outi] = ns[ni];
            ni += 1;
        } else {
            out[outi] = ms[mi];
            mi += 1;
        }
        outi += 1;
    }

    for (0..outi) |i| {
        try stdout.print("{d} ", .{out[i]});
    }
    try stdout.print("\n", .{});
    try stdout.flush();
}
