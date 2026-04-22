// Exercício 2 de https://www.ime.usp.br/~macmulti/exercicios/funcoes2/index.html
// (a) Escreva uma função que recebe como parâmetro um inteiro positivo ano e devolve
//      1 se ano for bissexto,
//      0 em caso contrário.
// (Um ano é bissexto se (ano % 4 == 0 && (ano % 100 != 0 || ano % 400 == 0)).)
//
// (b) Escreva uma função que tem como parâmetros de entrada e saída três números inteiros,
//     dia, mes e ano, representando uma data, e modifica esses inteiros de forma que
//     eles representem o dia seguinte.
//
// (c) Escreva um programa que leia um inteiro positivo n e uma sequência de n datas
//     e imprime, para cada data, o dia seguinte.

const std = @import("std");
const assert = std.debug.assert;

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("número de digitos e primeiro digito\nn > ", .{});
    try stdout.flush();
    const n_str = try stdin.takeDelimiterExclusive('\n');
    const n = try std.fmt.parseInt(usize, n_str, 10);
    stdin.toss(1);

    for (0..n) |i|  {
        try stdout.print("{d} dia mes ano > ", .{i});
        try stdout.flush();
        const dia_str = try stdin.takeDelimiterExclusive(' ');
        const dia = try std.fmt.parseInt(u32, dia_str, 10);
        stdin.toss(1);
        const mes_str = try stdin.takeDelimiterExclusive(' ');
        const mes = try std.fmt.parseInt(u32, mes_str, 10);
        stdin.toss(1);
        const ano_str = try stdin.takeDelimiterExclusive('\n');
        const ano = try std.fmt.parseInt(u32, ano_str, 10);
        stdin.toss(1);

        const proximo_dia, const proximo_mes, const proximo_ano = dia_seguinte(dia, mes, ano);
        try stdout.print("{d} {d} {d}\n", .{proximo_dia, proximo_mes, proximo_ano});
        try stdout.flush();
    }
}

fn bissexto(ano: u32) bool {
    const mult_4 = @mod(ano, 4) == 0;
    const mult_not_100 = @mod(ano, 100) != 0;
    const mult_400 = @mod(ano, 400) == 0;
    return (mult_4 and (mult_not_100 or mult_400));
}

fn dia_seguinte(dia: u32, mes: u32, ano: u32) [3]u32 {
    assert(dia >= 1 and dia<=31);
    assert(mes >= 1 and mes<=12);

    if (dia < 28) {
        return .{dia + 1, mes, ano};
    }

    const bi = bissexto(ano);

    if (mes == 1 and dia == 31) {
        return .{1, 2, ano};
    } else if (mes == 2 and dia == 28 and !bi) {
        return .{1, 3, ano};
    } else if (mes == 2 and dia == 28 and bi) {
        return .{29, 2, ano};
    } else if (mes == 2 and dia == 29 and bi) {
        return .{1, 3, ano};
    } else if (mes == 3 and dia == 31) {
        return .{1, 4, ano};
    } else if (mes == 4 and dia == 30) {
        return .{1, 5, ano};
    } else if (mes == 5 and dia == 31) {
        return .{1, 6, ano};
    } else if (mes == 6 and dia == 30) {
        return .{1, 7, ano};
    } else if (mes == 7 and dia == 31) {
        return .{1, 8, ano};
    } else if (mes == 8 and dia == 31) {
        return .{1, 9, ano};
    } else if (mes == 9 and dia == 30) {
        return .{1, 10, ano};
    } else if (mes == 10 and dia == 31) {
        return .{1, 11, ano};
    } else if (mes == 11 and dia == 30) {
        return .{1, 12, ano};
    } else if (mes == 12 and dia == 31) {
        return .{1, 1, ano + 1};
    }
    return .{dia + 1, mes, ano};
}
