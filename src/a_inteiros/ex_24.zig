// Exercício 24 de https://www.ime.usp.br/~macmulti/exercicios/inteiros/index.html
// São dados dois números inteiros positivos p e q, sendo que o número de dígitos de p é menor ou igual ao número de dígitos de q. Verificar se p é um subnúmero de q.
// Exemplos:
//   p = 23, q = 57238, p é subnúmero de q.
//   p = 23, q = 258347, p não é subnúmero de q.

const std = @import("std");

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("verificador de subnúmero:\n subnúmero (p) > ", .{});
    try stdout.flush();
    const p_str = try stdin.takeDelimiterExclusive('\n');
    const p = try std.fmt.parseInt(usize, p_str, 10);
    stdin.toss(1);

    try stdout.print("    número (q) > ", .{});
    try stdout.flush();
    const q_str = try stdin.takeDelimiterExclusive('\n');
    const q = try std.fmt.parseInt(usize, q_str, 10);
    stdin.toss(1);

    var dentro = false;
    var p_aux = p;
    var q_aux = q;
    while (q_aux > 0) {
        const ultimo_digito_q = q_aux % 10;
        const ultimo_digito_p = p_aux % 10;
        q_aux = @divTrunc(q_aux, 10);
        if (ultimo_digito_p != ultimo_digito_q and dentro) {
            p_aux = p;
            dentro = false;
        } else if (ultimo_digito_p == ultimo_digito_q and @divTrunc(p_aux, 10) > 0) {
            dentro = true;
            p_aux = @divTrunc(p_aux, 10);
        } else if (ultimo_digito_p == ultimo_digito_q and @divTrunc(p_aux, 10) == 0) {
            try stdout.print("{d} é subnúmero de {d}\n", .{p, q});
            break;
        }
    }

    if (q_aux == 0 and @divTrunc(p_aux, 10) > 0) {
        try stdout.print("{d} não é subnúmero de {d}\n", .{p, q});
    }
    try stdout.flush();
}
