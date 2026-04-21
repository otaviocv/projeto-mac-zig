// Exercício 6 de https://www.ime.usp.br/~macmulti/exercicios/inteiros/index.html
// Dados o número n de alunos de uma turma de Introdução aos Autômatos a Pilha (MAC 414) e suas notas
// da primeira prova, determinar a maior e a menor nota obtidas por essa turma (Nota máxima = 100 e nota mínima = 0).

const std = @import("std");

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("Nota máxima e mínima de estudantes.\nQuantos estudantes?\n> ", .{});
    try stdout.flush();
    const students_str = try stdin.takeDelimiterExclusive('\n');
    const students = try std.fmt.parseInt(usize, students_str, 10);
    stdin.toss(1);

    var max_grade: u32 = 0;   // min grade is 0
    var min_grade: u32 = 101;  // max grade is 100

    for (1..(students+1)) |student| {
        try stdout.print("Nota ({d:2}/{d:2}): ", .{student, students});
        try stdout.flush();

        const grade_str = try stdin.takeDelimiterExclusive('\n');
        const grade = try std.fmt.parseInt(u32, grade_str, 10);
        stdin.toss(1);

        if (grade > max_grade) {
            max_grade = grade;
        }
        if (grade < min_grade) {
            min_grade = grade;
        }
    }
    try stdout.print("\nMaior nota: {d:3}\nMenor nota: {d:3}\n", .{max_grade, min_grade});
    try stdout.flush();
}
