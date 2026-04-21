// Exercício 19 de https://www.ime.usp.br/~macmulti/exercicios/inteiros/index.html
// Dados três números, imprimi-los em ordem crescente.

const std = @import("std");

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("três numeros em ordem crescente:\n1 > ", .{});
    try stdout.flush();
    const l1_str = try stdin.takeDelimiterExclusive('\n');
    const l1 = try std.fmt.parseInt(i32, l1_str, 10);
    stdin.toss(1);

    try stdout.print("2 > ", .{});
    try stdout.flush();
    const l2_str = try stdin.takeDelimiterExclusive('\n');
    const l2 = try std.fmt.parseInt(i32, l2_str, 10);
    stdin.toss(1);

    try stdout.print("3 > ", .{});
    try stdout.flush();
    const l3_str = try stdin.takeDelimiterExclusive('\n');
    const l3 = try std.fmt.parseInt(i32, l3_str, 10);
    stdin.toss(1);

    if (l1 <= l2 and l2 <= l3) {
        try stdout.print("{d} {d} {d}\n", .{l1, l2, l3});
    } else if (l1 <= l3 and l3 <= l2) {
        try stdout.print("{d} {d} {d}\n", .{l1, l3, l2});
    } else if (l2 <= l1 and l1 <= l3) {
        try stdout.print("{d} {d} {d}\n", .{l2, l1, l3});
    } else if (l2 <= l3 and l3 <= l1) {
        try stdout.print("{d} {d} {d}\n", .{l2, l3, l1});
    } else if (l3 <= l1 and l1 <= l2) {
        try stdout.print("{d} {d} {d}\n", .{l3, l1, l2});
    } else if (l3 <= l2 and l2 <= l1) {
        try stdout.print("{d} {d} {d}\n", .{l3, l2, l1});
    }
    try stdout.flush();
}
