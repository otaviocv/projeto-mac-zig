// Exercício 2 de https://www.ime.usp.br/~macmulti/exercicios/reais/index.html
// Dado um natural n, determine o número harmônico Hn definido por:
// H_n = summation_{k=1}_{n} 1/k

const std = @import("std");

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("Número harmônico \nn > ", .{});
    try stdout.flush();
    const n_str = try stdin.takeDelimiterExclusive('\n');
    const n = try std.fmt.parseInt(usize, n_str, 10);
    stdin.toss(1);

    var h: f32 = 0;
    for (1..(n+1)) |k| {
        const inverse_k = ((n+1) - k);
        const k_float: f32 = @floatFromInt(inverse_k);
        h += 1.0/k_float;
    }
    try stdout.print("h: {d:0.}\n", .{h});
    try stdout.flush();
}
