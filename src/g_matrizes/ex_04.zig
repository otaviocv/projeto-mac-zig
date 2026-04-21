// Exercício 4 de https://www.ime.usp.br/~macmulti/exercicios/matrizes/index.html
// Dada uma matriz real Amxn, verificar se existem elementos repetidos em A.
//
// Nota do resolvedor: Não pode usar hashmap!
// Só vou fazer um array simples, nem ordenado.

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

    var vistos: [MAX]i32 = undefined;
    var size: u32 = 0;
    var repetidos: [MAX]i32 = undefined;
    var repetidos_size: u32 = 0;

    for (0..m) |i| {
        for (0..n) |j| {
            const val = matriz[i][j];
            if (!visto(val, vistos, size)) {
                size = adiciona(val, &vistos, size);
            } else {
                repetidos_size = adiciona(val, &repetidos, repetidos_size);
            }
        }
    }

    if (repetidos_size == 0) {
        try stdout.print("Nenhum elemento repetido.", .{});
    } else {
        try stdout.print("Repetidos: ", .{});
        for (0..repetidos_size) |i| {
            try stdout.print("{d} ", .{repetidos[i]});
        }
    }
    try stdout.print("\n", .{});



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

    try stdout.print("valroes > \n", .{});
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

fn visto(val: i32, vistos: [MAX]i32, tamanho: u32) bool {
    for (0..tamanho) |i| {
        if (val == vistos[i]) return true;
    }
    return false;
}

fn adiciona(val: i32, vistos: *[MAX]i32, tamanho: u32) u32 {
    assert(tamanho <= MAX);
    vistos.*[tamanho] = val;
    return tamanho + 1;
}
