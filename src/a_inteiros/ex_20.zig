// Exercício 20 de https://www.ime.usp.br/~macmulti/exercicios/inteiros/index.html
// (FIS 88) Qualquer número natural de quatro algarismos pode ser dividido em duas dezenas formadas pelos seus dois primeiros e dois últimos dígitos.
// Exemplos:
//  1297: 12 e 97.
//  5314: 53 e 14.
// Escreva um programa que imprime todos os milhares (4 algarismos) cuja raiz quadrada seja a soma das dezenas formadas pela divisão acima.
// Exemplo: raiz de 9801 = 99 = 98 + 01.
// Portanto 9801 é um dos números a ser impresso.

const std = @import("std");

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    try stdout.print("todos os milhares que suas duas dezenas somam a raiz quadrada\n", .{});
    for (1000..10000) |number| {
        const primeira_dezena: usize = @mod(number, 100);
        const segunda_dezena: usize = @divTrunc(number, 100);
        const soma_das_dezenas = primeira_dezena + segunda_dezena;
        const raiz_quadrada = std.math.sqrt(number);
        if (soma_das_dezenas == raiz_quadrada) {
            try stdout.print("{d}: {d} + {d} = {d}\n", .{number, segunda_dezena, primeira_dezena, raiz_quadrada});
        }
    }

    try stdout.flush();
}
