// Exercício 9 de https://www.ime.usp.br/~macmulti/exercicios/inteiros/index.html
// Dados n e dois números inteiros positivos i e j diferentes de 0,
// imprimir em ordem crescente os n primeiros naturais que são múltiplos de i ou de j e ou de ambos.

const std = @import("std");

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("Imprime os n primeiros números divisiveis por i ou por j ou por ambos.\nn > ", .{});
    try stdout.flush();
    const n_str = try stdin.takeDelimiterExclusive('\n');
    const n = try std.fmt.parseInt(usize, n_str, 10);
    stdin.toss(1);

    try stdout.print("i > ", .{});
    try stdout.flush();
    const i_str = try stdin.takeDelimiterExclusive('\n');
    const i = try std.fmt.parseInt(i32, i_str, 10);
    stdin.toss(1);

    try stdout.print("j > ", .{});
    try stdout.flush();
    const j_str = try stdin.takeDelimiterExclusive('\n');
    const j = try std.fmt.parseInt(i32, j_str, 10);
    stdin.toss(1);

    const max_usize: usize = std.math.maxInt(usize);
    var count: usize = 0;
    for (0..max_usize) |number| {
        const number_int: i32 = @intCast(number);
        if (count >= n) {
            break;
        }

        if (@mod(number_int, i) == 0 or @mod(number_int, j) == 0) {
            try stdout.print("{d:3}: {d}\n", .{count + 1, number});
            count += 1;
        }
    }
    try stdout.flush();
}
