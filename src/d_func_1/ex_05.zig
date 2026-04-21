// Exercício 5 de https://www.ime.usp.br/~macmulti/exercicios/funcoes1/index.html
// (a) Escreva uma função que recebe um inteiro positivo m e devolve 1 se m é primo, 0 em caso contrário.
// (b) Escreva um programa que leia um inteiro não-negativo n e imprima a soma dos n primeiros números primos.


const std = @import("std");
const assert = std.debug.assert;

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("Soma dos primerios n primos\nn > ", .{});
    try stdout.flush();
    const n_str = try stdin.takeDelimiterExclusive('\n');
    const n = try std.fmt.parseInt(usize, n_str, 10);
    stdin.toss(1);

    const max_iter = 10000000;
    assert(n > 0);
    assert(n <= max_iter);

    var count: u32 = 0;
    var soma: u32 = 0;
    for (2..(max_iter+2)) |i| {
        const i_u32: u32 = @intCast(i);
        if (primo(i_u32)) {
            count += 1;
            soma += i_u32;
        }
        if (count >= n) {
            break;
        }
    }
    try stdout.print("Os primeiros {d} primos somam {d}\n", .{n, soma});
    try stdout.flush();
}

// comptime sieve?
// factors caching?
fn primo(x: u32) bool {
    var count: usize = 0;
    const limite = @divTrunc(x, 2);
    for (1..limite+1) |factor| {
        if (@mod(x, factor) == 0) {
            count += 1;
        }
    }
    return (count != 2);
} 
