// Exercício 3 de https://www.ime.usp.br/~macmulti/exercicios/funcoes2/index.html
// (a) Escreva uma função de cabeçalho int divide (int *m, int *n, int d) que recebe 
//     três inteiros positivos como parâmetros e devolve 1 se d divide pelo menos um
//     entre *m e *n, 0 caso contrário. Fora isso, se d divide *m, divide *m por d,
//     e o mesmo para o *n.
// (b) Escreva um programa que lê dois inteiros positivos m e n e calcula, usando
//     a função acima, o mínimo múltiplo comum entre m e n, ou seja, mmc(m,n).
//
// Nota do resolvedor: Eu desgosto muito dessa ideia de passar m e n como ponteiros
// e alterar os valores. Eu acho melhor retornar o booleano e os novos valores e
// tratar o update por fora da função.

const std = @import("std");
const assert = std.debug.assert;
const max_factor = 10000000;

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("mínimo múltiplo comum entre m e n\nm > ", .{});
    try stdout.flush();
    const m_str = try stdin.takeDelimiterExclusive('\n');
    var m = try std.fmt.parseInt(u32, m_str, 10);
    stdin.toss(1);

    assert(m < max_factor);

    try stdout.print("n > ", .{});
    try stdout.flush();
    const n_str = try stdin.takeDelimiterExclusive('\n');
    var n = try std.fmt.parseInt(u32, n_str, 10);
    stdin.toss(1);

    assert(n < max_factor);

    var mmc: u32 = 1;
    var div: bool = false;
    for (2..max_factor) |f| {
        const f_int: u32 = @intCast(f);
        div = divide(&m, &n, f_int);

        if (div) mmc *= f_int;
        if (m == 1 and n == 1) break;
    }
    try stdout.print("{d}\n", .{mmc});
    try stdout.flush();
}

fn divide(m: *u32, n: *u32, d: u32) bool {
    const divide_m = @mod(m.*, d) == 0;
    const divide_n = @mod(n.*, d) == 0;
    m.* = if (divide_m) @divTrunc(m.*, d) else m.*;
    n.* = if (divide_n) @divTrunc(n.*, d) else n.*;
    return divide_m or divide_n;
}

