// Exercício 2 de https://www.ime.usp.br/~macmulti/exercicios/funcoes1/index.html
// (a) Construa uma função encaixa que dados dois inteiros positivos a e b
// verifica se b corresponde aos últimos dígitos de a.
//
// Ex.:
//   a       b
// 567890   890 => encaixa
//   1243  1243 => encaixa 
//   2457   245 => não encaixa
//    457  2457 => não encaixa
//
// (b) Usando a função do item anterior, faça um programa que lê dois inteiros positivos
// a e b e verifica se o menor deles é segmento do outro.
//
// Exemplo:
//    a        b
// 567890     678 => b é segmento de a
//   1243 2212435 => a é segmento de b
///   235     236 => um não é segmento do outro

const std = @import("std");

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("a encaixa em b ou b encaixa em a? \na > ", .{});
    try stdout.flush();
    const a_str = try stdin.takeDelimiterExclusive('\n');
    const a = try std.fmt.parseInt(i32, a_str, 10);
    stdin.toss(1);

    try stdout.print("b > ", .{});
    try stdout.flush();
    const b_str = try stdin.takeDelimiterExclusive('\n');
    const b = try std.fmt.parseInt(i32, b_str, 10);
    stdin.toss(1);

    var maior: i32 = undefined;
    var menor: i32 = undefined;
    if (a > b) {
        maior = a;
        menor = b;
    } else {
        maior = b;
        menor = a;
    }

    var maior_aux: i32 = maior;
    var seg: bool = false;
    while (maior_aux > menor) {
        const esse_encaixa = encaixa(maior_aux, menor);
        if (esse_encaixa) {
            seg = true;
            break;
        }
        maior_aux = @divTrunc(maior_aux, 10);
    }

    if (seg) {
        try stdout.print("{d} é segmento de {d} \n", .{menor, maior});
    } else {
        try stdout.print("{d} não é segmento de {d} \n", .{menor, maior});
    }
    try stdout.flush();
}

fn encaixa(a: i32, b: i32) bool {
    var a_aux = a;
    var b_aux = b;

    while (b_aux > 0) {
        const ad = @mod(a_aux, 10);
        const bd = @mod(b_aux, 10);
        if (ad != bd) {
            return false;
        }
        a_aux = @divTrunc(a_aux, 10);
        b_aux = @divTrunc(b_aux, 10);
    }
    return true;
}
