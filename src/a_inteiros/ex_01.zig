// [Exercício 1](../../exercicios/a_inteios.md) de https://www.ime.usp.br/~macmulti/exercicios/inteiros/index.html
// Dada uma seqüência de números inteiros não-nulos (diferente de zero), seguida por 0, imprimir seus quadrados. 

const std = @import("std");

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    var integer: i32 = undefined;
    while(true) {
        try stdout.print("sequência de quadrados (0 para parar):\n> ", .{});
        try stdout.flush();
        const number_str = try stdin.takeDelimiterExclusive('\n');
        stdin.toss(1);
        integer = try std.fmt.parseInt(i32, number_str, 10);
        if (integer == 0) {
            break;
        }
        const square = integer * integer;
        try stdout.print("quadrado: {d}\n", .{square});
        try stdout.flush();
    }
}
