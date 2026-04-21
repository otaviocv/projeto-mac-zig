// Exercício 5 de https://www.ime.usp.br/~macmulti/exercicios/inteiros/index.html
// Uma loja de discos anota diariamente durante o mês de março a quantidade de discos vendidos.
// Determinar em que dia desse mês ocorreu a maior venda e qual foi a quantidade de discos vendida nesse dia.

const std = @import("std");

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    var max_day: usize = 0;
    var max_sales: i32 = 0;
    try stdout.print("Forneça a venda de discos para todos os dias de março:\n", .{});
    for (1..32) |day| {
        try stdout.print("{d:2} de março: ", .{day});
        try stdout.flush();

        const sales_str = try stdin.takeDelimiterExclusive('\n');
        const sales = try std.fmt.parseInt(i32, sales_str, 10);
        stdin.toss(1);

        if (sales > max_sales) {
            max_sales = sales;
            max_day = day;
        }
    }
    try stdout.print("\nDia com mais vendas: {d:2} de março\nMaior venda: {d}\n", .{max_day, max_sales});
    try stdout.flush();
}
