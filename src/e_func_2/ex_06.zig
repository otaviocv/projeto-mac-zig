// Exercício 6 de https://www.ime.usp.br/~macmulti/exercicios/funcoes2/index.html
// (POLI 94) Considere as seguintes fórmulas de recorrências:
//   F1 = 2;                         G1 = 1;
//   F2 = 1;                         G2 = 2;
//   Fi = 2 * Fi-1 + Gi-2, i >= 3    Gi = Gi-1 + 3 * Fi_2, i >= 3
//
// Podemos então montar a seguinte tabela:
//  ┌────┬───┬───┬───┬────┬────┐
//  │ i  │ 1 │ 2 │ 3 │  4 │  5 │
//  ├────┼───┼───┼───┼────┼────┤
//  │ Fi │ 2 │ 1 │ 3 │  8 │ 24 │
//  ├────┼───┼───┼───┼────┼────┤
//  │ Gi │ 1 │ 2 │ 8 │ 11 │ 20 │
//  └────┴───┴───┴───┴────┴────┘
// Este exercício está dividido em três partes.
// (a) Só para ver se você entendeu as fórmulas, qual é o valor de F6 e G6?
//     F6 = 59,  G6 = 44
// (b) Faça uma função de nome valor que recebe um inteiro k > 1 e devolve Fk e Gk.
//     Exemplo: Para k=2, a função deve devolver os valores 1 e 2.
//              Para k=3, a função deve devolver os valores 3 e 8.
//              Para k=4, a função deve devolver os valores 8 e 11.
//
// (c) Faça um programa que lê um inteiro n > 2 e imprime os valores
//       Fn-2 + Gn+200  e Fn+200 - Gn-2
//
// Seu programa deve obrigatoriamente utilizar a função do item anterior, mesmo que
// você não a tenha feito.
//
// Nota do resolvedor: Testei até com inteiros positivos de até 128 bits
// e todos dão overflow. Minha conclusão para um exercício desse nível é
// de que devemos usar floats.

const std = @import("std");
const assert = std.debug.assert;


pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("n\n> ", .{});
    try stdout.flush();
    const n_str = try stdin.takeDelimiterExclusive('\n');
    const n = try std.fmt.parseInt(u32, n_str, 10);
    stdin.toss(1);

    assert(n > 2);

    var fn2: f128 = undefined;
    var gn2: f128 = undefined;
    fg(n-2, &fn2, &gn2);

    var gn200: f128 = undefined;
    var fn200: f128 = undefined;
    fg(n+200, &fn200, &gn200);

    const total1 = fn2 + gn200;
    const total2 = fn200 - gn2;

    try stdout.print("F{d}-2 + G{d}+200 = {d}\n", .{n, n, total1});
    try stdout.print("F{d}+200 - G{d}-2 = {d}\n", .{n, n, total2});
    try stdout.flush();
}

fn fg(k: u32, f: *f128, g: *f128) void {
    assert(k >= 1);
    if (k == 1) {
        f.* = 2;
        g.* = 1;
        return;
    }

    if (k == 2) {
        f.* = 1;
        g.* = 2;
        return;
    }
    var fi: f128 = undefined;
    var f1: f128 = 1;
    var f2: f128 = 2;
    var gi: f128 = undefined;
    var g1: f128 = 2;
    var g2: f128 = 1;

    for (2..k) |_| {
        fi = 2 * f1 + g2;
        gi = g1 + 3 * f2;
        f2 = f1;
        f1 = fi;
        g2 = g1;
        g1 = gi;
        //std.debug.print("{d} -> F={d}, g={d}\n", .{i, fi, gi});
    }

    f.* = fi;
    g.* = gi;
}
