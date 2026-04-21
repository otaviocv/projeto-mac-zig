// Exercício 18 de https://www.ime.usp.br/~macmulti/exercicios/inteiros/index.html
// Dados três números naturais, verificar se eles formam os lados de um triângulo retângulo.

const std = @import("std");

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("verificar de triangulo retângulo:\nlado 1 > ", .{});
    try stdout.flush();
    const l1_str = try stdin.takeDelimiterExclusive('\n');
    const l1 = try std.fmt.parseInt(i32, l1_str, 10);
    stdin.toss(1);

    try stdout.print("lado 2 > ", .{});
    try stdout.flush();
    const l2_str = try stdin.takeDelimiterExclusive('\n');
    const l2 = try std.fmt.parseInt(i32, l2_str, 10);
    stdin.toss(1);

    try stdout.print("lado 3 > ", .{});
    try stdout.flush();
    const l3_str = try stdin.takeDelimiterExclusive('\n');
    const l3 = try std.fmt.parseInt(i32, l3_str, 10);
    stdin.toss(1);

    var maior_lado: i32 = undefined;
    var c1: i32 = undefined;
    var c2: i32 = undefined;
    if (l1 > l2 and l1 > l3) {
        maior_lado = l1;
        c1 = l2;
        c2 = l3;
    } else if (l2 > l1 and l2 > l3) {
        maior_lado = l2;
        c1 = l1;
        c2 = l3;
    } else {
        maior_lado = l3;
        c1 = l1;
        c2 = l2;
    }

    if (maior_lado * maior_lado == (c1 * c1 + c2 * c2)) {
        try stdout.print("é triângulo\n", .{});
    } else {
        try stdout.print("não é triângulo\n", .{});
    }
    try stdout.flush();
}
