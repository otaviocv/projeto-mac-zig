// Exercício 1 de https://www.ime.usp.br/~macmulti/exercicios/vetores/index.html
// Dada uma seqüência de n números, imprimi-la na ordem inversa à da leitura.

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

    try stdout.print("reverso\ntamanho > ", .{});
    try stdout.flush();
    const tamanho_str = try stdin.takeDelimiterExclusive('\n');
    const tamanho = try std.fmt.parseInt(usize, tamanho_str, 10);
    stdin.toss(1);

    assert(tamanho <= MAX);
    var ns: [MAX]i32 = undefined;
    for (0..tamanho) |i|  {
        try stdout.print("{d} > ", .{i+1});
        try stdout.flush();
        const x_str = try stdin.takeDelimiterExclusive('\n');
        const x = try std.fmt.parseInt(i32, x_str, 10);
        stdin.toss(1);

        ns[i] = x;
    }

    for (0..tamanho) |i|  {
        const index = tamanho - i - 1;
        try stdout.print("{d} ", .{ns[index]});
    }

    try stdout.print("\n", .{});
    try stdout.flush();
}
