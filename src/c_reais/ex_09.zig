// Exercício 9 de https://www.ime.usp.br/~macmulti/exercicios/reais/index.html
// Dadas n triplas compostas por um símbolo de operação (+, -, * ou /)
// e dois números reais, calcule o resultado ao efetuar a operação indicada
// para os dois números (Sugestão: use switch).

const std = @import("std");

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("Triplas\nn > ", .{});
    try stdout.flush();
    const n_str = try stdin.takeDelimiterExclusive('\n');
    const n = try std.fmt.parseInt(usize, n_str, 10);
    stdin.toss(1);

    for (0..n) |_| {
        try stdout.print("(op, a, b):\n", .{});
        try stdout.flush();
        const op_str = try stdin.takeDelimiterExclusive(' ');
        stdin.toss(1);

        var num_str = try stdin.takeDelimiterExclusive(' ');
        const a = try std.fmt.parseFloat(f32, num_str);
        stdin.toss(1);

        num_str = try stdin.takeDelimiterExclusive('\n');
        const b = try std.fmt.parseFloat(f32, num_str);
        stdin.toss(1);

        if (std.mem.eql(u8, op_str, "+")) {
            const result = a + b;
            try stdout.print("{d} + {d} = {d}", .{a, b, result});
        } else if (std.mem.eql(u8, op_str, "-")) {
            const result = a - b;
            try stdout.print("{d} - {d} = {d}", .{a, b, result});
        } else if (std.mem.eql(u8, op_str, "*")) {
            const result = a * b;
            try stdout.print("{d} * {d} = {d}", .{a, b, result});
        } else if (std.mem.eql(u8, op_str, "/")) {
            const result = a / b;
            try stdout.print("{d} / {d} = {d}", .{a, b, result});
        } else {
            try stdout.print("operação desconhecida", .{});
        }

        try stdout.print("\n", .{});
    }
    try stdout.flush();
}
