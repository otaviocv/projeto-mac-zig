// Exercício 9 de https://www.ime.usp.br/~macmulti/exercicios/matrizes/index.html
// (MAT 89) Um jogo de palavras cruzadas pode ser representado por uma matriz $A_{mxn}$
// onde cada posição da matriz corresponde a um quadrado do jogo, sendo que `0` indica um
// quadrado branco e `-1` indica um quadrado preto. Indicar na matriz as posições que são
// início de palavras horizontais e/ou verticais nos quadrados correspondentes (substituindo
// os zeros), considerando que uma palavra deve ter pelo menos duas letras. Para isso,
// numere consecutivamente tais posições.
// 
// Exemplo: Dada a matriz
// 
// │  0 -1  0 -1 -1  0 -1  0 │
// │  0  0  0  0 -1  0  0  0 │
// │  0  0 -1 -1  0  0 -1  0 │
// │ -1  0  0  0  0 -1  0  0 │
// │  0  0 -1  0  0  0 -1 -1 │
//
// A saída deverá ser
//
// │  1 -1  2 -1 -1  3 -1  4 │
// │  5  6  0  0 -1  7  0  0 │
// │  8  0 -1 -1  9  0 -1  0 │
// │ -1 10  0 11  0 -1 12  0 │
// │ 13  0 -1 14  0  0 -1 -1 │

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

    var m: u32 = undefined;
    var n: u32 = undefined;
    var matriz: [MAX][MAX]i32 = undefined;

    try read_matrix(&m, &n, &matriz, stdout, stdin);

    var pos: i32 = 1;
    for (0..m) |i| {
        for (0..n) |j| {

            if (matriz[i][j] != 0) {
                continue;
            }

            if (i == 0 and i + 1 < m and matriz[i+1][j] == 0) {
                matriz[i][j] = pos;
                pos += 1;
            } else if (j == 0 and j + 1 < n and matriz[i][j+1] == 0) {
                matriz[i][j] = pos;
                pos += 1;
            } else if (matriz[i-1][j] == -1 and i + 1 < m and matriz[i+1][j] == 0) {
                matriz[i][j] = pos;
                pos += 1;
            } else if (matriz[i][j-1] == -1 and j + 1 < n and matriz[i][j+1] == 0) {
                matriz[i][j] = pos;
                pos += 1;
            }

        }
    }


    for (0..m) |i| {
        for (0..n) |j| {
            try stdout.print("{d: >4} ", .{matriz[i][j]});
        }
        try stdout.print("\n", .{});
    }

    try stdout.flush();
}

fn read_matrix(m: *u32, n: *u32, container: *[MAX][MAX]i32, stdout: *std.Io.Writer, stdin: *std.Io.Reader) !void {
    try stdout.print("m n > ", .{});
    try stdout.flush();

    const m_str = try stdin.takeDelimiterExclusive(' ');
    m.* = try std.fmt.parseInt(u32, m_str, 10);
    stdin.toss(1);
    assert(m.* <= MAX);

    const n_str = try stdin.takeDelimiterExclusive('\n');
    n.* = try std.fmt.parseInt(u32, n_str, 10);
    stdin.toss(1);
    assert(n.* <= MAX);

    try stdout.print("valores > \n", .{});
    try stdout.flush();

    for (0..m.*) |i| {
        for (0..(n.*-1)) |j| {
            const num_str = try stdin.takeDelimiterExclusive(' ');
            const num = try std.fmt.parseInt(i32, num_str, 10);
            stdin.toss(1);
            container.*[i][j] = num;
        }
        const num_str = try stdin.takeDelimiterExclusive('\n');
        const num = try std.fmt.parseInt(i32, num_str, 10);
        stdin.toss(1);
        container.*[i][n.*-1] = num;
    }
}
