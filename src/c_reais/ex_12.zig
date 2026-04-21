// Exercício 12 de https://www.ime.usp.br/~macmulti/exercicios/reais/index.html
// Faça um programa que calcula a soma
//  1 -1/2 + 1/3 - 1/4 ... 1/9999 - 1/10000 
// pelas seguintes maneiras:
//   - adição dos termos da direita para a esquerda;
//   - adição dos termos da esquerda para a direita;
//   - adição separada dos termos positivos e dos termos negativos da esquerda para a direita;
//   - adição separada dos termos positivos e dos termos negativos da direita para a esquerda.


const std = @import("std");

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    const max: u32 = 10000;

    try stdout.print("soma da esquerda para a direita: ", .{});
    var soma: f32 = 0;
    for (1..(max+1)) |i| {
        const sinal: f32 = if (@mod(i, 2) == 0) -1 else 1;
        const i_float: f32 = @floatFromInt(i);
        const termo = sinal * 1/i_float;
        soma += termo;
    }
    try stdout.print("{d:0.20}\n", .{soma});

    try stdout.print("soma da direita para a esquerda: ", .{});
    soma = 0;
    for (0..max) |i| {
        const denominador = max - i;
        const sinal: f32 = if (@mod(denominador, 2) == 0) -1 else 1;
        const denominador_float: f32 = @floatFromInt(denominador);
        const termo = sinal * 1/denominador_float;
        soma += termo;
    }
    try stdout.print("{d:0.20}\n", .{soma});

    try stdout.print("positivo e negativos, da esquerda para a direita: ", .{});
    soma = 0;
    var soma_positiva: f32 = 0;
    for (1..((max/2)+1)) |i| {
        const denominador = i * 2;
        const denominador_float: f32 = @floatFromInt(denominador);
        const termo = -1/denominador_float;
        soma_positiva += termo;
    }
    var soma_negativa: f32 = 0;
    for (1..((max/2)+1)) |i| {
        const denominador = i * 2 - 1;
        const denominador_float: f32 = @floatFromInt(denominador);
        const termo = 1/denominador_float;
        soma_negativa += termo;
    }
    soma = soma_positiva + soma_negativa;
    try stdout.print("{d:0.20}\n", .{soma});

    try stdout.print("positivo e negativos, da direita para a esquerda: ", .{});
    soma = 0;
    soma_positiva = 0;
    for (0..(max/2)) |i| {
        const denominador = max - (i * 2);
        const denominador_float: f32 = @floatFromInt(denominador);
        const termo = -1/denominador_float;
        soma_positiva += termo;
    }
    soma_negativa = 0;
    for (1..((max/2)+1)) |i| {
        const denominador = max - ((i * 2) - 1);
        const denominador_float: f32 = @floatFromInt(denominador);
        const termo = 1/denominador_float;
        soma_negativa += termo;
    }
    soma = soma_positiva + soma_negativa;
    try stdout.print("{d:0.20}\n", .{soma});

    try stdout.flush();

}
