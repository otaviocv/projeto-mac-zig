// Exercício 3 de https://www.ime.usp.br/~macmulti/exercicios/reais/index.html
// Os pontos (x,y) que pertencem à figura H (abaixo) são tais que
//   x >= 0,
//   y >= 0 e
//   x^2 + y^2 <= 1.
// Dados n pontos reais (x,y), verifique se cada ponto pertence ou não a H.

const std = @import("std");

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("Pontos dentro do semi circulo do primeiro quadrante \nn > ", .{});
    try stdout.flush();
    const n_str = try stdin.takeDelimiterExclusive('\n');
    const n = try std.fmt.parseInt(usize, n_str, 10);
    stdin.toss(1);

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

        if (x * x + y * y <= 1) {
            try stdout.print("dentro\n", .{});
        } else {
            try stdout.print("fora\n", .{});
        }
    }
    try stdout.flush();
}
