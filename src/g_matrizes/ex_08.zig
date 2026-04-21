// Exercício 8 de https://www.ime.usp.br/~macmulti/exercicios/matrizes/index.html
// (a) (MAT 83) Imprimir as n primeiras linhas do triângulo de Pascal.
// 1
// 1  1
// 1  2  1
// 1  3  3  1
// 1  4  6  4  1
// 1  5 10 10  5  1
// (b) Imprimir as n primeiras linhas do triângulo de Pascal usando apenas um vetor.

const std = @import("std");
const assert = std.debug.assert;
const MAX: usize = 1000;


pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("n linhas do triangulo de pascal\nn > ", .{});
    try stdout.flush();
    const n_str = try stdin.takeDelimiterExclusive('\n');
    const n = try std.fmt.parseInt(u32, n_str, 10);
    stdin.toss(1);
    assert(n <= MAX and n >= 1);

    try stdout.print("Usando matriz:\n", .{});
    var matriz: [MAX][MAX]i32 = undefined;
    for (0..n) |i| {
        for (0..(i+1)) |j| {
            if (j == 0 or j == i) {
                matriz[i][j] = 1;
            } else {
                matriz[i][j] = matriz[i-1][j] + matriz[i-1][j-1];
            }
            try stdout.print("{d} ", .{matriz[i][j]});
        }
        try stdout.print("\n", .{});
    }

    try stdout.print("Usando vetor:\n", .{});
    var vetor: [MAX]i32 = undefined;
    for (0..n) |i| {
        const start_of_previous_row = @divFloor(i * i - i, 2);
        const start_of_this_row = @divFloor(((i+1) * (i+1)) - (i+1), 2);
        for (0..(i+1)) |j| {
            const pos = start_of_this_row + j;
            if (j == 0 or j == i) {
                vetor[pos] = 1;
            } else {
                const left = start_of_previous_row + j - 1;
                const right = left + 1;
                vetor[pos] = vetor[left] + vetor[right];
            }
            try stdout.print("{d} ", .{vetor[pos]});
        }
        try stdout.print("\n", .{});
    }
    try stdout.flush();
}
