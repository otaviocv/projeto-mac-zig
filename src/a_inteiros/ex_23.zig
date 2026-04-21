// Exercício 23 de https://www.ime.usp.br/~macmulti/exercicios/inteiros/index.html
// Dizemos que um número natural n é palíndromo (3) se
// o 1º algarismo de n é igual ao seu último algarismo,
// o 2º algarismo de n é igual ao penúltimo algarismo,
// e assim sucessivamente.
//  Exemplos:
//    567765 e 32423 são palíndromos.
//    567675 não é palíndromo.
// Dado um número natural   n > 10 , verificar se n é palíndrome.
//
// Nota do resolvedor: Há muitas formas de se resolver esse exercício mas como nesse
// estágio da lista supõe-se conhecimento apenas de controles de fluxo básicos e inteiros
// essa solução é composta de duas etapas:
//  1. Inverter o número com o resto da divisão por 10
//  2. Comparar com o número original
// * Essa é a mesma solução do caderno (vista após pensar sobre o problema).
//
const std = @import("std");

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("verificador de número palíndromo:\n > ", .{});
    try stdout.flush();
    const n_str = try stdin.takeDelimiterExclusive('\n');
    const n = try std.fmt.parseInt(usize, n_str, 10);
    stdin.toss(1);

    var resto = n;
    var invertido: usize = 0;

    for (0..100) |_| {
        invertido = invertido * 10 + resto % 10;
        resto = @divTrunc(resto, 10);

        if (resto == 0) {
            break;
        }
    }

    if (invertido == n) {
        try stdout.print("{d} é palíndromo!\n", .{n});
    } else {
        try stdout.print("{d} não é palíndromo\n", .{n});
    }
    try stdout.flush();
}
