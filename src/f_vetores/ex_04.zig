// Exercício 4 de https://www.ime.usp.br/~macmulti/exercicios/vetores/index.html
// Tentando descobrir se um dado era viciado, um dono de cassino honesto (ha! ha! ha! ha!)
// o lançou n vezes. Dados os n resultados dos lançamentos, determinar o número de
// ocorrências de cada face.

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

    try stdout.print("Número de dimensões:\nn > ", .{});
    try stdout.flush();
    const n_str = try stdin.takeDelimiterExclusive('\n');
    const n = try std.fmt.parseInt(usize, n_str, 10);
    stdin.toss(1);
    assert(n > 0 and n <= MAX);

    var x: [MAX]i32 = undefined;
    var y: [MAX]i32 = undefined;
    try stdout.print("x\n", .{});
    try stdout.flush();

    for (0..n) |i| {
        try stdout.print("{d} > ", .{i+1});
        try stdout.flush();
        const xi_str = try stdin.takeDelimiterExclusive('\n');
        const xi = try std.fmt.parseInt(i32, xi_str, 10);
        stdin.toss(1);
        x[i] = xi;
    }

    try stdout.print("y\n", .{});
    try stdout.flush();

    for (0..n) |i| {
        try stdout.print("{d} > ", .{i+1});
        try stdout.flush();
        const yi_str = try stdin.takeDelimiterExclusive('\n');
        const yi = try std.fmt.parseInt(i32, yi_str, 10);
        stdin.toss(1);
        y[i] = yi;
    }

    var prod: i32 = 0;
    for (0..n) |i| {
        prod += x[i] * y[i];
    }
    try stdout.print("produto escalar: {d}\n", .{prod});
    try stdout.flush();
}
