// Exercício 14 de https://www.ime.usp.br/~macmulti/exercicios/vetores/index.html
// (POLI 82) Chama-se seqüência de Farey relativa a n, a seqüência das frações
// racionais irredutíveis, dispostas em ordem crescente, com denominadores
// positivos e não maiores que n.
//
// Exemplo:  Se n=5, os termos a da seqüência de Farey, tais que 0 <= a <= 1 são:
//           0/1, 1/5, 1/4, 1/3, 2/5, 1/2, 3/5, 2/3, 3/4, 4/5, 1/1
// 
// Para gerarmos os termos a de uma seqüência de Farey tais que 0 <= a <= 1,
// podemos usar o seguinte processo. Começamos com as frações 0/1 e 1/1
// e entre cada duas frações consecutivas i/j e k/m introduzimos a fração
// (i + k)/(j + m) e assim sucessivamente enquanto j + m <= n.
// Quando não for mais possível introduzir novas frações teremos gerado
// todos os termos da seqüência de Farey relativa a n, tais que 0 <= a <= 1.
//
// Usando o processo descrito, determine os termos a, 0 <= a <= 1,
// da seqüência de Farey relativa a n, n inteiro positivo.
//
// Sugestão: Gere os numeradores e os denominadores em dois vetores.

const std = @import("std");
const assert = std.debug.assert;
const MAX: usize = 10000;

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

    var numeradores_blue: [MAX]u32 = undefined;
    numeradores_blue[0] = 0;
    numeradores_blue[1] = 1;

    var denominadores_blue: [MAX]u32 = undefined;
    denominadores_blue[0] = 1;
    denominadores_blue[1] = 1;

    var numeradores_green: [MAX]u32 = undefined;
    numeradores_green[0] = 0;
    numeradores_green[1] = 1;

    var denominadores_green: [MAX]u32 = undefined;
    denominadores_green[0] = 1;
    denominadores_green[1] = 1;

    var size: u32 = 2;
    var pos: u32 = 0;

    for (0..MAX) |_| {
        if (pos + 1 == size) break;
        const j = denominadores_blue[pos];
        const m = denominadores_blue[pos+1];
        if (j + m > n) {
            pos += 1;
            continue;
        }

        const i = numeradores_blue[pos];
        const k = numeradores_blue[pos+1];
        const new_num = (i + k);
        const new_den = (j + m);

        // coloca a nova fração no lugar certo
        numeradores_green[pos+1] = new_num;
        denominadores_green[pos+1] = new_den;
        size += 1;

        // copia o que vem depois
        for ((pos+2)..size) |copy_pos| {
            numeradores_green[copy_pos] = numeradores_blue[copy_pos-1];
            denominadores_green[copy_pos] = denominadores_blue[copy_pos-1];
        }

        // copia o vetor no novo no velho e mantem os dois iguais
        for (0..size) |copy_pos| {
            numeradores_blue[copy_pos] = numeradores_green[copy_pos];
            denominadores_blue[copy_pos] = denominadores_green[copy_pos];
        }

        pos = 0;
    }

    for (0..size) |i| {
        try stdout.print("{d}/{d} ", .{numeradores_blue[i], denominadores_blue[i]});
    }

    try stdout.print("\n", .{});
    try stdout.flush();
}
