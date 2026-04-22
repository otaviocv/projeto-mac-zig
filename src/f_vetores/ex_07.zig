// Exercício 7 de https://www.ime.usp.br/~macmulti/exercicios/vetores/index.html
// (MAT 88) Dada uma sequência de n números reais, determinar os números que
// compõem a sequência e o número de vezes que cada um deles ocorre na mesma.
// Exemplo: n = 8
// Sequência: -1.7,  3.0,  0.0,  1.5,  0.0, -1.7,  2.3, -1,7
// Saída:       -1.7 ocorre 3 vezes
//               3.0 ocorre 1 vez
//               0.0 ocorre 2 vezes
//               1.5 ocorre 1 vez
//               2.3 ocorre 1 vez
// Nota do resolvedor: Dado que não temos conhecimento de hash maps nesse ponto
// vamos usar duas listas.

const std = @import("std");
const assert = std.debug.assert;
const MAX: usize = 10000;

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("n > ", .{});
    try stdout.flush();
    const n_str = try stdin.takeDelimiterExclusive('\n');
    const n = try std.fmt.parseInt(u32, n_str, 10);
    stdin.toss(1);

    var total: u32 = 0;
    var ns: [MAX]f32 = undefined;
    var oc: [MAX]f32 = undefined;

    for (0..n) |i| {
        try stdout.print("{d} > ", .{i+1});
        try stdout.flush();
        const x_str = try stdin.takeDelimiterExclusive('\n');
        const x = try std.fmt.parseFloat(f32, x_str);
        stdin.toss(1);

        var novo = true;
        for (0..total) |j| {
            if (ns[j] == x) {
                novo = false;
                oc[j] += 1;
            }
        }

        if (novo) {
            oc[total] = 1;
            ns[total] = x;
            total += 1;
        }

    }

    for (0..total) |i| {
        try stdout.print("{d} aparece {d} vezes\n", .{ns[i], oc[i]});
    }
    try stdout.flush();

}
