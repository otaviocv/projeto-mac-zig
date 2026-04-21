// Exercício 2 de https://www.ime.usp.br/~macmulti/exercicios/matrizes/index.html
// Um vetor real X com n elementos é apresentado como resultado de um sistema de
// equações lineares Ax = B cujos coeficientes são representados em uma matriz
// real A(m,n) e os lados direitos das equações em um vetor real B de m elementos.
// Verificar se o vetor X é realmente solução do sistema dado.

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

    try stdout.print("n > ", .{});
    try stdout.flush();
    const n_str = try stdin.takeDelimiterExclusive('\n');
    const n = try std.fmt.parseInt(u32, n_str, 10);
    stdin.toss(1);
    assert(n <= MAX);

    try stdout.print("m > ", .{});
    try stdout.flush();
    const m_str = try stdin.takeDelimiterExclusive('\n');
    const m = try std.fmt.parseInt(u32, m_str, 10);
    stdin.toss(1);
    assert(m <= MAX);
    try stdout.print("valores dos coeficientes do sistema no formato m n (A) >\n", .{});
    try stdout.flush();

    var sistema: [MAX][MAX]i32 = undefined;
    for (0..m) |i| {
        for (0..(n-1)) |j| {
            const num_str = try stdin.takeDelimiterExclusive(' ');
            const num = try std.fmt.parseInt(i32, num_str, 10);
            stdin.toss(1);
            sistema[i][j] = num;
        }
        const num_str = try stdin.takeDelimiterExclusive('\n');
        const num = try std.fmt.parseInt(i32, num_str, 10);
        stdin.toss(1);
        sistema[i][n-1] = num;
    }

    try stdout.print("valores da igualdade do sistema no formato n >\n", .{});
    try stdout.flush();
    var b: [MAX]i32 = undefined;
    for (0..(n-1)) |i| {
        const b_elem_str = try stdin.takeDelimiterExclusive(' ');
        const b_elem = try std.fmt.parseInt(i32, b_elem_str, 10);
        stdin.toss(1);
        b[i] = b_elem;
    }
    const b_elem_str = try stdin.takeDelimiterExclusive('\n');
    const b_elem = try std.fmt.parseInt(i32, b_elem_str, 10);
    stdin.toss(1);
    b[n-1] = b_elem;

    try stdout.print("valores da solução do sistema no formato n >\n", .{});
    try stdout.flush();
    var solucao_x: [MAX]i32 = undefined;
    for (0..(n-1)) |i| {
        const num_str = try stdin.takeDelimiterExclusive(' ');
        const num = try std.fmt.parseInt(i32, num_str, 10);
        stdin.toss(1);
        solucao_x[i] = num;
    }
    const num_str = try stdin.takeDelimiterExclusive('\n');
    const num = try std.fmt.parseInt(i32, num_str, 10);
    stdin.toss(1);
    solucao_x[n-1] = num;

    var resolve: bool = true;
    for (0..m) |i| {
        if (produto_interno(&solucao_x, &sistema[i], n) != b[i]) {
            resolve = false;
            break;
        }
    }

    if (resolve) {
        try stdout.print("é solução.\n", .{});
    } else {
        try stdout.print("não é solução.\n", .{});
    }
    try stdout.flush();
}


fn produto_interno(a: []i32, b: []i32, size: u32) i32 {
    var soma: i32 = 0;
    for (0..size) |i| {
        soma += a[i] * b[i];
    }
    return soma;
}
