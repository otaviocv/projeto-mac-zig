// Exercício 1 de https://www.ime.usp.br/~macmulti/exercicios/reais/index.html
// Uma pessoa aplicou um capital de x reais a juros mensais de z durante 1 ano.
// Determinar o montante de cada mês durante este período.
//
// Notas do resolvedor. Uma simples função de pontencial resolveria isso mas ela
// não é oferecida na biblioteca padrão do C. Vou resolver como o enunciado deseja
// que o exercício seja resolvido.

const std = @import("std");

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("Calculo de juros compostos \ncapital > ", .{});
    try stdout.flush();
    const montante_str = try stdin.takeDelimiterExclusive('\n');
    const montante = try std.fmt.parseFloat(f32, montante_str);
    stdin.toss(1);

    try stdout.print("juros mensais > ", .{});
    try stdout.flush();
    const juros_str = try stdin.takeDelimiterExclusive('\n');
    const juros = try std.fmt.parseFloat(f32, juros_str);
    stdin.toss(1);

    var investimento_final: f32 = montante;
    for (0..12) |_| {
        investimento_final *= (1.0 + juros);
    }
    try stdout.print("total no fim do ano > {d:0.2}\n", .{investimento_final});
    try stdout.flush();
}
