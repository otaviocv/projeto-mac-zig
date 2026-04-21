// Exercício 1 de https://www.ime.usp.br/~macmulti/exercicios/funcoes1/index.html
// Um número a é dito permutação de um número b se os dígitos de a formam uma permutação dos dígitos de b.
// Exemplo:   5412434 é uma permutação de 4321445, mas não é uma permutação de 4312455.
// Obs.: Considere que o dígito 0 (zero) não aparece nos números.
// (a) Faça uma função contadígitos que dados um inteiro n e um inteiro d, 0 < d < 9, devolve quantas vezes o dígito d aparece em n.
// (b) Usando a função do item anterior, faça um programa que lê dois inteiros positivos a e b e responda se a é permutação de b.

const std = @import("std");

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("a e b são permutações um do outro? \na > ", .{});
    try stdout.flush();
    const a_str = try stdin.takeDelimiterExclusive('\n');
    const a = try std.fmt.parseInt(i32, a_str, 10);
    stdin.toss(1);

    try stdout.print("b > ", .{});
    try stdout.flush();
    const b_str = try stdin.takeDelimiterExclusive('\n');
    const b = try std.fmt.parseInt(i32, b_str, 10);
    stdin.toss(1);

    var permutacao = true;
    for (1..9) |d| {
        const a_count = contadigitos(a, @intCast(d));
        const b_count = contadigitos(b, @intCast(d));
        if (a_count != b_count) {
            permutacao = false;
            break;
        }
    }

    if (permutacao) {
        try stdout.print("{d} e {d} são permutação um do outro\n", .{a, b});
    } else {
        try stdout.print("{d} e {d} não são permutação um do outro\n", .{a, b});
    }

    try stdout.flush();
}

fn contadigitos(n: i32, d: i32) i32 {
    var count: i32 = 0;
    var n_aux = n;
    while (n_aux > 0) {
        const nd = @mod(n_aux, 10);
        if (nd == d) {
            count += 1;
        }
        n_aux = @divTrunc(n_aux, 10);
    }
    return count;
}
