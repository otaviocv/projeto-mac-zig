// Exercício 2 de https://www.ime.usp.br/~macmulti/exercicios/vetores/index.html
// Deseja-se publicar o número de acertos de cada aluno em uma prova em forma de testes.
// A prova consta de 30 questões, cada uma com cinco alternativas identificadas
// por A, B, C, D e E. Para isso são dados:
//     o cartão gabarito;
//     o número de alunos da turma;
//     o cartão de respostas para cada aluno, contendo o seu número e suas respostas.
//
// Dada uma sequência de n números, imprimi-la na ordem inversa à da leitura.

const std = @import("std");
const assert = std.debug.assert;
const Q: usize = 5;

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("Gabarito de tamanho {d}\n", .{Q});
    try stdout.flush();

    var gabarito: [Q]u8 = undefined; 
    for (0..Q) |i| {
        try stdout.print("{d} > ", .{i+1});
        try stdout.flush();
        const resposta = try stdin.takeDelimiterExclusive('\n');
        stdin.toss(1);
        assert(resposta.len == 1);
        gabarito[i] = resposta[0];
    }

    try stdout.print("Quantos alunos?\n> ", .{});
    try stdout.flush();
    const alunos_str = try stdin.takeDelimiterExclusive('\n');
    const alunos = try std.fmt.parseInt(usize, alunos_str, 10);
    stdin.toss(1);

    for (0..alunos) |ai| {
        var acertos: u32 = 0;
        for (0..Q) |qi| {
            try stdout.print("aluno {d} questão {d} > ", .{ai, qi});
            try stdout.flush();
            const resposta_seq = try stdin.takeDelimiterExclusive('\n');
            stdin.toss(1);
            assert(resposta_seq.len == 1);

            if (resposta_seq[0] == gabarito[qi]) {
                acertos += 1;
            }
        }
        try stdout.print("O aluno {d} acertou {d} questoões\n", .{ai, acertos});
        try stdout.flush();
    }

}
