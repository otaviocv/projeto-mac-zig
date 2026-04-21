// Exercício 1 de https://www.ime.usp.br/~macmulti/exercicios/funcoes2/index.html
// (a) Escreva uma função que recebe um número inteiro n > 0 e devolve o número
// de dígitos de n e o primeiro dígito de n.
// (b) Escreva um programa que leia uma seqüência de n inteiros positivos e
// imprime o número de dígitos e o primeiro dígito de cada um deles.

const std = @import("std");
const assert = std.debug.assert;

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("número de digitos e primeiro digito\nn > ", .{});
    try stdout.flush();
    const n_str = try stdin.takeDelimiterExclusive('\n');
    const n = try std.fmt.parseInt(usize, n_str, 10);
    stdin.toss(1);

    for (0..n) |i|  {
        try stdout.print("{d} > ", .{i});
        try stdout.flush();
        const x_str = try stdin.takeDelimiterExclusive('\n');
        const x = try std.fmt.parseInt(u32, x_str, 10);
        stdin.toss(1);

        const d, const p = nep(x);
        try stdout.print("{d} {d}\n", .{d, p});
        try stdout.flush();
    }
}

fn nep(n: u32) [2]u32 {
    assert(n > 0);
    var p: u32 = undefined;
    var n_aux = n;
    var d_count: u32 = 0;
    for (0..100000) |i| {
        if (i == 0) {
            p = @mod(n, 10);
        }
        n_aux = @divTrunc(n_aux, 10);
        d_count += 1;
        if (n_aux == 0) {
            break;
        }
    }
    return .{d_count, p};
}
