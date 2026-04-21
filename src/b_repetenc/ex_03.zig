// Exercício 3 de https://www.ime.usp.br/~macmulti/exercicios/repetenc/index.html
// Dados dois naturais m e n determinar, entre todos os pares de números naturais
// (x,y) tais que x < m e y < n,
// um par para o qual o valor da expressão xy - x2 + y seja máximo e calcular também esse máximo.

const std = @import("std");

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("máximo estranho\nm > ", .{});
    try stdout.flush();
    const m_str = try stdin.takeDelimiterExclusive('\n');
    const m = try std.fmt.parseInt(u32, m_str, 10);
    stdin.toss(1);

    try stdout.print("n > ", .{});
    try stdout.flush();
    const n_str = try stdin.takeDelimiterExclusive('\n');
    const n = try std.fmt.parseInt(u32, n_str, 10);

    var max: i32 = 0;
    var xmax: i32 = 0;
    var ymax: i32 = 0;
    for (0..m) |x| {
        for (0..n) |y| {
            const x_int: i32 = @intCast(x);
            const y_int: i32 = @intCast(y);
            const estranho = x_int * y_int - (x_int * x_int) + y_int;
            if (estranho > max) {
                max = estranho;
                xmax = x_int;
                ymax = y_int;
            }
        }
    }
    try stdout.print("max com ({d}, {d}): {d}\n", .{xmax, ymax, max});
    try stdout.flush();
}
