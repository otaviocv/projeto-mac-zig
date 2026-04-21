// Exercício 5 de https://www.ime.usp.br/~macmulti/exercicios/funcoes2/index.html
// (a) Escreva uma função com o protótipo
//     void converte (char ch, int *tipo, char *valor);
//     que recebe um caractere ch e devolve em *tipo 0, se o caractere for um
//     número inteiro, 1 se for uma letra (maiúscula ou minúscula) e 2 caso
//     contrário; e além disso, no caso de ser uma letra, converte para
//     maiúscula, senão devolve ch inalterado.
// (b) Escreva um programa que leia uma seqüência de n caracteres e imprima a
//     seqüência convertida para maiúscula, eliminando os caracteres que não
//     forem letras ou números.
//
// Nota do resolvedor: muita lógica de mudança in-place. Faz tempo que não programo
// assim.

const std = @import("std");
const assert = std.debug.assert;


pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("texto?\n> ", .{});
    try stdout.flush();
    var str = try stdin.takeDelimiterExclusive('\n');
    stdin.toss(1);

    var tipo: u8 = 0;
    var new_char: u8 = 0;
    var update_index: usize = 0;
    for (0..str.len) |index| {
        const char: u8 = str[index];
        converte(char, &tipo, &new_char);
        if (tipo == 2) {
            continue;
        }
        str[update_index] = new_char;
        update_index += 1;
    }

    for (update_index..str.len) |index| {
        str[index] = ' ';
    }

    try stdout.print("{s}\n", .{str});
    try stdout.flush();
}

fn converte(ch: u8, tipo: *u8, valor: *u8) void {
    const value: u8 = switch (ch) {
        '0'...'9' => 0,
        'A'...'Z' => 1,
        'a'...'z' => 1,
        else => 2,
    };
    tipo.* = value;
    valor.* = switch (ch) {
        'a'...'z' => ch - 32,
        else => ch,
    };
}

