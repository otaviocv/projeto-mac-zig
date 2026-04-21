// Exercício 5 de https://www.ime.usp.br/~macmulti/exercicios/reais/index.html
// Dados números reais a, b e c, calcular as raízes de uma equação do 2o grau
// da forma ax^2 + bx + c = 0. Imprimir a solução em uma das seguintes formas:
// a.DUPLA        b.REAIS DISTINTAS     c.COMPLEXAS 
// raiz           raiz 1                parte real 
//                raiz 2                parte imaginária

const std = @import("std");

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("Raízes de eqs de segundo grau \na > ", .{});
    try stdout.flush();
    const a_str = try stdin.takeDelimiterExclusive('\n');
    const a = try std.fmt.parseFloat(f32, a_str);
    stdin.toss(1);

    try stdout.print("b > ", .{});
    try stdout.flush();
    const b_str = try stdin.takeDelimiterExclusive('\n');
    const b = try std.fmt.parseFloat(f32, b_str);
    stdin.toss(1);

    try stdout.print("c > ", .{});
    try stdout.flush();
    const c_str = try stdin.takeDelimiterExclusive('\n');
    const c = try std.fmt.parseFloat(f32, c_str);
    stdin.toss(1);

    const delta: f32 = (b * b) - (4 * a * c);

    //try stdout.print("Raízes da equação {d:0.}x^2 {d:0.}*x {c:0.} = 0", .{a, b, c});

    if (delta > 0.0) {
        if (b == 0.0) {
            const r: f32 = @sqrt(delta)/(2.0 * a);
            try stdout.print("Dupla: ±{d:0.}", .{r});
        } else {
            const r1: f32 = (-b + @sqrt(delta))/(2.0 * a);
            const r2: f32 = (-b - @sqrt(delta))/(2.0 * a);
            try stdout.print("Reais distintas: {d:0.}, {d:0.}", .{r1, r2});
        }
    } else if (delta == 0.0) {
        if (a == 0.0) {
            const r: f32 = -c/b;
            try stdout.print("Única: {d:0.}", .{r});
        } else if (c == 0.0) {
            const r1: f32 = 0.0;
            const r2: f32 = -a/b;
            try stdout.print("Reais distintas: {d:0.}, {d:0.}", .{r1, r2});
        }
    } else {
        const imag: f32 = @sqrt(-delta)/(2*a);
        const real: f32 = -b/(2.0*a);
        try stdout.print("Complexas: {d:0.} +({d:0.}i), {d:0.} + ({d:0.}i)", .{real, imag, real, imag});
    }
    try stdout.print("\n", .{});
    try stdout.flush();
}
