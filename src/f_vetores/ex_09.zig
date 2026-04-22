// Exercício 9 de https://www.ime.usp.br/~macmulti/exercicios/vetores/index.html
// Dadas duas sequências com n números inteiros entre 0 e 9, interpretadas como
// dois números inteiros de n algarismos, calcular a sequência de números que
// representa a soma dos dois inteiros.
// Exemplo: n = 8,
//     1a  sequência:      8 2 4 3 4 2 5 1
//     2ª  sequência:    + 3 3 7 5 2 3 3 7
//                       1 1 6 1 8 6 5 8 8

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

    var a: [MAX]u8 = undefined;
    for (0..n) |i| {
        try stdout.print("a{d} > ", .{i+1});
        try stdout.flush();
        const d_str = try stdin.takeDelimiterExclusive('\n');
        const d = try std.fmt.parseInt(u8, d_str, 10);
        stdin.toss(1);
        const j = n - i - 1;
        a[j] = d;
    }
    var b: [MAX]u8 = undefined;
    for (0..n) |i| {
        try stdout.print("b{d} > ", .{i+1});
        try stdout.flush();
        const d_str = try stdin.takeDelimiterExclusive('\n');
        const d = try std.fmt.parseInt(u8, d_str, 10);
        stdin.toss(1);
        const j = n - i - 1;
        b[j] = d;
    }

    var result_size = n;
    var result: [MAX]u8 = undefined;
    var car: u8 = 0;
    for (0..n) |i| {
        const sum = a[i] + b[i] + car;
        const rem = @mod(sum, 10);
        result[i] = rem;
        if (sum >= 10) {
            car = 1;
        }
    }

    if (car >= 1) {
        result[n] = car;
        result_size += 1;
    }

    try stdout.print("\na:    ", .{});
    for (0..n) |i| {
        const j = n - i - 1;
        try stdout.print("{d} ", .{a[j]});
    }
    try stdout.print("\nb: +  ", .{});
    for (0..n) |i| {
        const j = n - i - 1;
        try stdout.print("{d} ", .{b[j]});
    }
    try stdout.print("\n      _______________\n    ", .{});
    for (0..result_size) |i| {
        const j = result_size - i - 1;
        try stdout.print("{d} ", .{result[j]});
    }
    try stdout.print("\n", .{});
    try stdout.flush();
}
