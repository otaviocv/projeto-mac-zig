// Exercício 14 de https://www.ime.usp.br/~macmulti/exercicios/inteiros/index.html
// Um matemático italiano da idade média conseguiu modelar o ritmo de crescimento da população de coelhos (1)
// através de uma seqüência de números naturais que passou a ser conhecida como seqüência de Fibonacci (2).
// O n-ésimo número da seqüência de Fibonacci Fn é dado pela seguinte fórmula de recorrência:
// F_1 = 1
// F_2 = 1
// F_i = F_i-1 + F_i-2 para i >= 3
// Faça um programa que, dado n, calcula Fn.

const std = @import("std");

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("n-ésimo número de Fibonacci\nn > ", .{});
    try stdout.flush();
    const n_str = try stdin.takeDelimiterExclusive('\n');
    const n = try std.fmt.parseInt(usize, n_str, 10);

    if (n == 1 or n == 2) {
        try stdout.print("Fib({d}) é {d}\n", .{n, 1});
    } else {
        var fib_last: usize = 1;
        var fib_before_last: usize = 1;
        var fib_temp: usize = undefined;
        for (2..n) |_| {
            fib_temp = fib_last;
            fib_last = fib_last + fib_before_last;
            fib_before_last = fib_temp;
        }
        try stdout.print("Fib({d}) é {d}\n", .{n, fib_last});
    }
    try stdout.flush();

}
