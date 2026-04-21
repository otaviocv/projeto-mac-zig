// Exercício 7 de https://www.ime.usp.br/~macmulti/exercicios/repetenc/index.html
// Dados um inteiro positivo n e uma sequência de n inteiros positivos,
// determinar o máximo divisor comum a todos eles.

const std = @import("std");

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("Máximo divisor comum entre vários números:\nn > ", .{});
    try stdout.flush();
    const n_str = try stdin.takeDelimiterExclusive('\n');
    const n = try std.fmt.parseInt(u32, n_str, 10);
    stdin.toss(1);

    var mdc: u32 = undefined;
    for (0..n) |i| {
        try stdout.print("> ", .{});
        try stdout.flush();
        const current_str = try stdin.takeDelimiterExclusive('\n');
        var current = try std.fmt.parseInt(u32, current_str, 10);
        stdin.toss(1);
        
        if (i == 0) {
            mdc = current;
        } else {
            var mdc_temp = mdc;
            var aux: u32 = undefined;
            while (mdc_temp != 0) {
                aux = @mod(current, mdc_temp);
                current = mdc_temp;
                mdc_temp = aux;
            }
            mdc = current;
        }
    }

    try stdout.print("MDC = {d}\n", .{mdc});
    try stdout.flush();
}
