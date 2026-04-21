// Exercício 4 de https://www.ime.usp.br/~macmulti/exercicios/funcoes2/index.html
// (a) Escreva uma função com protótipo 
//     void somabit (int b1, int b2, int *vaium, int *soma);
//     que recebe três bits (inteiros entre 0 e 1) b1, b2 e *vaium e devolve um bit
//     soma representando a soma dos três e o novo um bit "vai-um" em *vaium.
//
// (b) Escreva um programa que leia dois números em binário e calcula um número em
//     binário que é a soma dos dois números dados. Utilize a função acima.

const std = @import("std");
const assert = std.debug.assert;


pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("soma de dois números em binário\n> ", .{});
    try stdout.flush();
    const m_str = try stdin.takeDelimiterExclusive('\n');
    var m = try std.fmt.parseInt(u32, m_str, 10);
    stdin.toss(1);

    try stdout.print("> ", .{});
    try stdout.flush();
    const n_str = try stdin.takeDelimiterExclusive('\n');
    var n = try std.fmt.parseInt(u32, n_str, 10);
    stdin.toss(1);

    var vaium_bit: u8 = 0;
    var soma_bit: u8 = 0;
    var pos: u32 = 1;
    var soma_total: u32 = 0;
    while (m > 0 or n > 0) {
        const b1: u8 = @intCast(@mod(m, 10));
        const b2: u8 = @intCast(@mod(n, 10));
        somabit(b1, b2, &vaium_bit, &soma_bit);
        soma_total = soma_total + soma_bit * pos;

        m = @divTrunc(m, 10);
        n = @divTrunc(n, 10);
        pos = pos * 10;
    }

    if (vaium_bit == 1) {
        soma_total = soma_total + vaium_bit * pos;
    }

    try stdout.print("{d}\n", .{soma_total});
    try stdout.flush();
}


fn somabit(b1: u8, b2: u8, vaium: *u8, soma: *u8) void {
    assert(b1 >= 0 and b1 <= 1);
    assert(b2 >= 0 and b2 <= 1);
    assert(vaium.* >= 0 and vaium.* <= 1);
    assert(soma.* >= 0 and soma.* <= 1);

    if (b1 == 1 and b2 == 1 and vaium.* == 1) { // 3
        soma.* = 1;
        vaium.* = 1;
    } else if (b1 == 1 and b2 == 1 and vaium.* == 0) { // 2
        soma.* = 0;
        vaium.* = 1;
    } else if ((b1 == 1 or b2 == 1) and vaium.* == 1) { // 2
        soma.* = 0;
        vaium.* = 1;
    } else if ((b1 == 1 or b2 == 1) and vaium.* == 0) { // 1
        soma.* = 1;
        vaium.* = 0;
    } else if (vaium.* == 1) { // 1
        soma.* = 1;
        vaium.* = 0;
    } else { // 0
        soma.* = 0;
        vaium.* = 0;
    }
}
