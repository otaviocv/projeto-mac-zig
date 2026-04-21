// Exercício 3 de https://www.ime.usp.br/~macmulti/exercicios/vetores/index.html
// Tentando descobrir se um dado era viciado, um dono de cassino honesto (ha! ha! ha! ha!)
// o lançou n vezes. Dados os n resultados dos lançamentos, determinar o número de
// ocorrências de cada face.

const std = @import("std");
const assert = std.debug.assert;
const faces: usize = 6;

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("Número de lançamentos:\n> ", .{});
    try stdout.flush();
    const n_str = try stdin.takeDelimiterExclusive('\n');
    const n = try std.fmt.parseInt(usize, n_str, 10);
    stdin.toss(1);

    var lancamentos = [_]u8{0} ** faces;
    for (0..n) |i| {
        try stdout.print("{d} > ", .{i+1});
        try stdout.flush();
        const l_str = try stdin.takeDelimiterExclusive('\n');
        const l = try std.fmt.parseInt(usize, l_str, 10);
        stdin.toss(1);
        assert(l >= 0 and l < faces);
        lancamentos[l] += 1;
    }

    for (0..faces) |fi| {
        try stdout.print("face {d}: {d} ocorrências\n", .{fi, lancamentos[fi]});
    }
    try stdout.flush();

}
