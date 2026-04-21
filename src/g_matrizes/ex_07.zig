// Exercício 7 de https://www.ime.usp.br/~macmulti/exercicios/matrizes/index.html
// Dizemos que uma matriz $A_{nxn}$ é um _quadrado mágico_ se a soma dos elementos
// de cada linha, a soma dos elementos de cada coluna e a soma dos elementos das
// diagonais principal e secundária são todas iguais.
//
// Exemplo: A matriz
//
//    │  8  0  7 │
//    │  4  5  6 │
//    │  3 10  2 │
// é um quadrado mágico
//
// Data uma matriz quadrada $A_{nxn}$, verificar se $A$ é quadrado mágico.

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

    var n: u32 = undefined;
    var matriz: [MAX][MAX]i32 = undefined;
    try read_matriz_quadrada(&n, &matriz, stdout, stdin);

    var magico = true;


    var soma_ref: i32 = 0;
    for (0..n) |i| {
        soma_ref += matriz[i][i];
    }

    // linhas
    for (0..n) |i| {
        var soma: i32 = 0;
        for (0..n) |j| {
            soma += matriz[i][j];
        }
        if (soma != soma_ref) {
            magico = false;
            break;
        }
    }
    // colunas
    for (0..n) |j| {
        var soma: i32 = 0;
        for (0..n) |i| {
            soma += matriz[i][j];
        }
        if (soma != soma_ref) {
            magico = false;
            break;
        }
    }

    if (magico) {
        try stdout.print("é mágico ({d})\n", .{soma_ref});
    } else {
        try stdout.print("não é mágico :(\n", .{});
    }
    try stdout.flush();
}

fn read_matriz_quadrada(n: *u32, container: *[MAX][MAX]i32, stdout: *std.Io.Writer, stdin: *std.Io.Reader) !void {
    try stdout.print("n > ", .{});
    try stdout.flush();

    const n_str = try stdin.takeDelimiterExclusive('\n');
    n.* = try std.fmt.parseInt(u32, n_str, 10);
    stdin.toss(1);
    assert(n.* <= MAX);

    try stdout.print("valores > \n", .{});
    try stdout.flush();

    for (0..n.*) |i| {
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
