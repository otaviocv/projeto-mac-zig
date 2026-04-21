// Exercício 6 de https://www.ime.usp.br/~macmulti/exercicios/vetores/index.html
// (COMP 89) Dados dois strings (um contendo uma frase e outro contendo uma palavra),
// determine o número de vezes que a palavra ocorre na frase.
//
// Exemplo:
//     Para a palavra ANA e a frase :
//         ANA E MARIANA GOSTAM DE BANANA
//         ---       ---            -----
//     Temos que a palavra ocorre 4 vezes na frase.

const std = @import("std");

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("palavra > ", .{});
    try stdout.flush();
    const palavra_temp = try stdin.takeDelimiterExclusive('\n');
    var palavra: [1024]u8 = undefined;
    for (0..palavra_temp.len) |i| {
        palavra[i] = palavra_temp[i];
    }
    const size = palavra_temp.len;
    stdin.toss(1);

    try stdout.print("frase > ", .{});
    try stdout.flush();
    const frase = try stdin.takeDelimiterExclusive('\n');
    stdin.toss(1);

    var oc: u32 = 0;
    for (0..frase.len) |frase_index| {
        var igual = true;
        for (0..size) |palavra_index| {
            const dentro_da_frase = (frase_index + palavra_index) < frase.len;
            if (!(dentro_da_frase and palavra[palavra_index] == frase[frase_index + palavra_index])) {
                igual = false;
                break;
            }
        }

        if (igual) {
            oc += 1;
        }

    }
    try stdout.print("a palavra {s} aparece {d} em \"{s}\"\n", .{palavra[0..size], oc, frase});
    try stdout.flush();

}
