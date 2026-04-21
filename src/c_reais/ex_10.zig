// Exercício 10 de https://www.ime.usp.br/~macmulti/exercicios/reais/index.html
// Dadas as populações de Uauá (BA) e Nova York (PI) (2) e sabendo que a população
// de Uauá tem um crescimento anual de x e a população de Nova York (3) tem um
// crescimento anual de y determine:
//    Se a população da cidade menor ultrapassa a da maior.
//    Quantos anos passarão antes que isso ocorra.

const std = @import("std");
const MAX_ITER = 1000000;

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("População e crescimento de Uauá (BA): ", .{});
    try stdout.flush();
    const pop_uaua_str = try stdin.takeDelimiterExclusive(' ');
    var pop_uaua = try std.fmt.parseFloat(f32, pop_uaua_str);
    stdin.toss(1);
    const crescimento_uaua_str = try stdin.takeDelimiterExclusive('\n');
    const crescimento_uaua = try std.fmt.parseFloat(f32, crescimento_uaua_str);
    stdin.toss(1);

    try stdout.print("População e crescimento de Nova York (PI): ", .{});
    try stdout.flush();
    const pop_ny_str = try stdin.takeDelimiterExclusive(' ');
    var pop_ny = try std.fmt.parseFloat(f32, pop_ny_str);
    stdin.toss(1);
    const crescimento_ny_str = try stdin.takeDelimiterExclusive('\n');
    const crescimento_ny = try std.fmt.parseFloat(f32, crescimento_ny_str);
    stdin.toss(1);

    var ny_maior_que_uaua = false;
    if (pop_ny > pop_uaua) {
        ny_maior_que_uaua = true;
    }

    if (ny_maior_que_uaua and crescimento_ny > crescimento_uaua) {
        try stdout.print("Uauá ({d}) nunca ultrapassará Nova York ({d}) porque sua população já é maior e seu crescimento é maior. ({d} > {d})", .{pop_uaua, pop_ny, crescimento_ny, crescimento_uaua});
    } else if (!ny_maior_que_uaua and crescimento_uaua > crescimento_ny) {
        try stdout.print("Nova York ({d}) nunca ultrapassará Uauá ({d}) porque sua população já é maior e seu crescimento é maior. ({d} > {d})", .{pop_ny, pop_uaua, crescimento_uaua, crescimento_ny});
    }

    var anos: u32 = 0;
    for (0..MAX_ITER) |_| {

        if (ny_maior_que_uaua and pop_uaua > pop_ny) {
            try stdout.print("{d} anos se passarão até que a população de Uauá ({d}) ultrapasse a população de Nova York ({d}).", .{anos, pop_uaua, pop_ny});
            break;
        } else if (!ny_maior_que_uaua and pop_ny > pop_uaua) {
            try stdout.print("{d} anos se passarão até que a população de Nova York ({d}) ultrapasse a população de Uauá ({d}).", .{anos, pop_ny, pop_uaua});
            break;
        }

        pop_uaua *= 1 + crescimento_uaua;
        pop_ny *= 1 + crescimento_ny;
        anos += 1;
    }

    try stdout.print("\n", .{});
    try stdout.flush();
}
