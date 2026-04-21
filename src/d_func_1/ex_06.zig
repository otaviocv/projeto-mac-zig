// Exercício 6 de https://www.ime.usp.br/~macmulti/exercicios/funcoes1/index.html
// (a) Escreva uma função que recebe como parâmetros dois números a e b e devolve
//     o mdc (máximo divisor comum) de a e b, calculado por meio do algoritmo de Euclides.
// (b) Escreva um programa que leia um inteiro positivo n e uma seqüência de n
//     inteiros não-negativos e imprime o mdc de todos os números da seqüência.


const std = @import("std");
const assert = std.debug.assert;

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("MDC de vários números\nn > ", .{});
    try stdout.flush();
    const n_str = try stdin.takeDelimiterExclusive('\n');
    const n = try std.fmt.parseInt(usize, n_str, 10);
    stdin.toss(1);

    var mdc: u32 = undefined;
    for (0..n) |i| {
        try stdout.print("> ", .{});
        try stdout.flush();
        const k_str = try stdin.takeDelimiterExclusive('\n');
        const k = try std.fmt.parseInt(u32, k_str, 10);
        stdin.toss(1);
        if (i == 0) {
            mdc = k;
        } else {
            mdc = mdc_euclides(mdc, k);
        }
        
    }
    try stdout.print("MDC = {d}\n", .{mdc});
    try stdout.flush();
}

fn mdc_euclides(a: u32, b:u32) u32 {
    var r: u32 = undefined;
    var a_aux = a;
    var b_aux = b;
    while (b_aux != 0) {
        r = @mod(a_aux, b_aux);
        a_aux = b_aux;
        b_aux = r;
    }
    return a_aux;
}
