// Exercício 25 de https://www.ime.usp.br/~macmulti/exercicios/inteiros/index.html
// Simule a execução do programa abaixo destacando a sua saída:
// [Implementação de referência](ex_25.c)

const std = @import("std");

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("Digite um par de números: ", .{});
    try stdout.flush();
    var a_str = try stdin.takeDelimiterExclusive(' ');
    var a = try std.fmt.parseInt(usize, a_str, 10);
    stdin.toss(1);
    var b_str = try stdin.takeDelimiterExclusive('\n');
    var b = try std.fmt.parseInt(usize, b_str, 10);
    stdin.toss(1);

    try stdout.print("({d} {d})\n", .{a, b});
    var total: usize = 0;
    var soma: usize = 0;
    while (a != 0) {
        total += 1;
        var termo: usize = 1;
        for (1..(b+1)) |_| {
            termo = termo * a;
        }
        try stdout.print("Resp = {d}\n", .{termo});
        soma = soma + termo;
        try stdout.print("Soma = {d}\n", .{soma});
        try stdout.print("Digite um par de números: ", .{});
        try stdout.flush();
        a_str = try stdin.takeDelimiterExclusive(' ');
        a = try std.fmt.parseInt(usize, a_str, 10);
        stdin.toss(1);
        b_str = try stdin.takeDelimiterExclusive('\n');
        b = try std.fmt.parseInt(usize, b_str, 10);
        stdin.toss(1);
        try stdout.print("({d} {d})\n", .{a, b});
    }
    try stdout.print("Total de pares: {d}\n", .{total});
    try stdout.flush();
}
