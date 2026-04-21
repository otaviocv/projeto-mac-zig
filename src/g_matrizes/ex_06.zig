// Exercício 6 de https://www.ime.usp.br/~macmulti/exercicios/matrizes/index.html
// Dada uma matriz $A_{mxn}$, imprimir o número de linhas e o número de 
// colunas nulas da matriz.
// Exemplo: `m = 4` e `n = 4`
//
//    │ 1 0 2 3 │
//    │ 4 0 5 6 │
//    │ 0 0 0 0 │
//    │ 0 0 0 0 │
//
// tem 2 linhas nulas e 1 coluna nula.


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

    // linhas nulas
    var linhas_nulas: u32 = 0;
    for (0..m) |i| {
        var nulos: u32 = 0;
        for (0..n) |j| {
            if (matriz[i][j] == 0) {
                nulos += 1;
            }
        }

        if (nulos == n) {
            linhas_nulas += 1;
        }
    }

    // colunas nulas
    var colunas_nulas: u32 = 0;
    for (0..n) |j| {
        var nulos: u32 = 0;
        for (0..m) |i| {
            if (matriz[i][j] == 0) {
                nulos += 1;
            }
        }

        if (nulos == m) {
            colunas_nulas += 1;
        }
    }

    try stdout.print("Linhas nulas: {d}\n", .{linhas_nulas});
    try stdout.print("Colunas nulas: {d}\n", .{colunas_nulas});
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
