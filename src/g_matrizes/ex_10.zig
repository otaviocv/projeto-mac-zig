// Exercício 10 de https://www.ime.usp.br/~macmulti/exercicios/matrizes/index.html
// Uma matriz D_8x8 pode representar a posição atual de um jogo de damas, sendo que
// `0` indica uma casa vazia, `1` indica uma casa ocupada por uma peça branca e `-1`
// indica uma casa ocupada por uma peça preta. Supondo que as peças pretas estão se
// movendo no sentido crescente das linhas da matriz $D$, determinar as
// posições das peças pretas que:
//
// - a. podem tomar peças brancas;
// - b. podem mover-se sem tomar peças;
// - c. não podem se mover.

const std = @import("std");
const assert = std.debug.assert;
const size: usize = 8;


pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;



    try stdout.flush();
}

fn read_tabuleiro(container: *[MAX][MAX]i32, stdout: *std.Io.Writer, stdin: *std.Io.Reader) !void {
    try stdout.print("valores > \n", .{});
    try stdout.flush();

    for (0..size) |i| {
        for (0..(size-1)) |j| {
            const num_str = try stdin.takeDelimiterExclusive(' ');
            const num = try std.fmt.parseInt(i32, num_str, 10);
            stdin.toss(1);
            container.*[i][j] = num;
        }
        const num_str = try stdin.takeDelimiterExclusive('\n');
        const num = try std.fmt.parseInt(i32, num_str, 10);
        stdin.toss(1);
        container.*[i][size-1] = num;
    }
}
