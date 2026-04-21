// Exercício 15 de https://www.ime.usp.br/~macmulti/exercicios/vetores/index.html
// Em uma classe há n alunos, cada um dos quais realizou k provas com pesos distintos.
// Dados n , k, os pesos das k provas e as notas de cada aluno, calcular
// a média ponderada das provas para cada aluno e a média aritmética da classe
// em cada uma das provas.
//
// Nota do resolvedor: Por um segundo achei que ia precisar de duas dimensões
// para resolver esse exercicio mas supostamente não sabemos fazer isso ainda.
// Esse lance de fazer coisa inplace já tá chato.

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

    try stdout.print("alunos n > ", .{});
    try stdout.flush();
    const n_str = try stdin.takeDelimiterExclusive('\n');
    const n = try std.fmt.parseInt(u32, n_str, 10);
    stdin.toss(1);

    assert (n >= 0 and n <= MAX);

    try stdout.print("provas k > ", .{});
    try stdout.flush();
    const k_str = try stdin.takeDelimiterExclusive('\n');
    const k = try std.fmt.parseInt(usize, k_str, 10);
    stdin.toss(1);

    var pesos: [MAX]f32 = undefined;
    var peso_total: f32 = undefined;

    for (0..k) |i| {
        try stdout.print("peso {d} > ", .{i+1});
        try stdout.flush();
        const peso_str = try stdin.takeDelimiterExclusive('\n');
        const peso = try std.fmt.parseFloat(f32, peso_str);
        stdin.toss(1);

        pesos[i] = peso;
        peso_total += peso;
    }

    var medias_alunos: [MAX]f32 = undefined;
    var medias_por_prova: [MAX]f32 = undefined;

    const n_f: f32 = @floatFromInt(n);
    for (0..n) |i| {
        var media_aluno: f32 = 0;
        for (0..k) |j| {
            try stdout.print("aluno {d} prova {d} > ", .{i+1, j+1});
            try stdout.flush();
            const nota_str = try stdin.takeDelimiterExclusive('\n');
            const nota = try std.fmt.parseFloat(f32, nota_str);
            stdin.toss(1);

            media_aluno += (nota * pesos[j])/peso_total;
            medias_por_prova[j] += (1/n_f) * (nota);
        }

        medias_alunos[i] = media_aluno;
    }

    try stdout.print("\nMedias ponderadas\n", .{});
    for (0..n) |i| {
        try stdout.print("Aluno {d}: {d}\n", .{i+1, medias_alunos[i]});
    }

    try stdout.print("\nMedias por prova\n", .{});
    for (0..k) |i| {
        try stdout.print("Prova {d}: {d}\n", .{i+1, medias_por_prova[i]});
    }
    try stdout.flush();
}
