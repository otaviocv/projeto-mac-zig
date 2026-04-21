// Exercício 8 de https://www.ime.usp.br/~macmulti/exercicios/reais/index.html
// Para n alunos de uma determinada classe são dadas as 3 notas das provas.
// Calcular a média aritmética das provas de cada aluno, a média da classe,
// o número de aprovados e o número de reprovados
// (critério de aprovação: média maior ou igual a cinco).

const std = @import("std");

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("Número de alunos \nn > ", .{});
    try stdout.flush();
    const n_str = try stdin.takeDelimiterExclusive('\n');
    const n = try std.fmt.parseInt(usize, n_str, 10);
    stdin.toss(1);

    var aprovados: u32 = 0;
    for (0..n) |_| {
        try stdout.print("Notas:\n", .{});
        try stdout.flush();
        var nota_str = try stdin.takeDelimiterExclusive(' ');
        const nota1 = try std.fmt.parseFloat(f32, nota_str);
        stdin.toss(1);

        nota_str = try stdin.takeDelimiterExclusive(' ');
        const nota2 = try std.fmt.parseFloat(f32, nota_str);
        stdin.toss(1);

        nota_str = try stdin.takeDelimiterExclusive('\n');
        const nota3 = try std.fmt.parseFloat(f32, nota_str);
        stdin.toss(1);

        if ((nota1 + nota2 + nota3)/3.0 >= 5.0) {
            try stdout.print("Aprovado\n", .{});
            aprovados += 1;
        } else {
            try stdout.print("Reprovado\n", .{});
        }

    }
    try stdout.print("Total de aprovados: {d}\n", .{aprovados});
    try stdout.flush();
}
