// Exercício 2 de https://www.ime.usp.br/~macmulti/exercicios/repetenc/index.html
// Dado um número inteiro positivo n, determinar todos os inteiros entre 1 e n que
// são comprimento da hipotenusa de um triângulo retângulo com catetos inteiros.

const std = @import("std");

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("catetos e hipotenusas\nn > ", .{});
    try stdout.flush();
    const n_str = try stdin.takeDelimiterExclusive('\n');
    const n = try std.fmt.parseInt(u32, n_str, 10);
    stdin.toss(1);

    for(1..n) |hipotenusa_alvo| {
        for(1..hipotenusa_alvo) |cateto_maior| {
            for (1..cateto_maior) |cateto_menor| {
                const h2 = hipotenusa_alvo * hipotenusa_alvo;
                const cateto_maior2 = cateto_maior * cateto_maior;
                const cateto_menor2 = cateto_menor * cateto_menor;
                if (h2 == cateto_maior2 + cateto_menor2) {
                    try stdout.print("{d} é uma hipotenusa: {d}^2 = {d}^2 + {d}^2\n", .{hipotenusa_alvo, hipotenusa_alvo, cateto_maior, cateto_menor});
                }
            }
        }
    }
    try stdout.flush();
}
