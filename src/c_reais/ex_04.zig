// Exercício 4 de https://www.ime.usp.br/~macmulti/exercicios/reais/index.html
// (GEO 84) Considere o conjunto H = H1 U H2 de pontos reais, onde
//   H1 = {(x, y) | x <= 0, y <= 0, y + x^2 + 2x - 3 <= 0}
//   H2 = {(x, y) | x >= 0, y + x^2 - 2x - 3 <= 0}
// Faça um programa que lê uma seqüência de n pontos reais (x,y)
// e verifica se cada ponto pertence ou não ao conjunto H.
// O programa deve também contar o número de pontos da seqüência que pertencem a H.

const std = @import("std");

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("Verificador de H \nn > ", .{});
    try stdout.flush();
    const n_str = try stdin.takeDelimiterExclusive('\n');
    const n = try std.fmt.parseInt(usize, n_str, 10);
    stdin.toss(1);

    var total: u32 = 0;
    for (1..(n+1)) |_| {
        try stdout.print("> ", .{});
        try stdout.flush();
        const x_str = try stdin.takeDelimiterExclusive(' ');
        const x = try std.fmt.parseFloat(f32, x_str);
        stdin.toss(1);
        const y_str = try stdin.takeDelimiterExclusive('\n');
        const y = try std.fmt.parseFloat(f32, y_str);
        stdin.toss(1);
        try stdout.print("({d}, {d}): ", .{x, y});

        const h1 = (x <= 0) and (y <= 0) and ((y + x*x + 2*x - 3) <= 0);
        const h2 = (x >= 0) and ((y + x*x - 2*x - 3) <= 0);

        if (h1 or h2) {
            try stdout.print("pertence", .{});
            total += 1;
        } else {
            try stdout.print("não pertence", .{});
        }
        try stdout.print("\n", .{});
    }
    try stdout.print("{d} pontos pertencem a H\n", .{total});
    try stdout.flush();
}
