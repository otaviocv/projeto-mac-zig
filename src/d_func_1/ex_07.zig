// Exercício 7 de https://www.ime.usp.br/~macmulti/exercicios/funcoes1/index.html
// (POLI 97) Simule a execução do programa seguinte. Faça suas contas com duas
// casas de precisão. Não se preocupe com o formato da saída.
// #include <stdio.h>
// 
// float f1 (int x, int y) {
//   float res;
// 
//   if (y != 0) 
//     res = (float) x / y;
//   else 
//     res = (float) 1 / x;
//   
//   while (x > y) {
//     res = res + (float) y / x;
//     x = x - 1;
//   }
//   return(res);
// }
// 
// int main() {
//   int a, b;
//   float c, d;
// 
//   printf("Digite quatro numeros.\n");
//   scanf("%d %d %f %f", &a, &b, &c, &d);
//   printf("a = %d  b = %d  c = %f  d = %f\n", a, b, c, d);
//   while (a < b) {
//     if (c > d) { 
//       d = f1(b,a);
//       b = b - 1;
//     }
//     else{
//       c = 1 / f1(a,b);
//       a = a + 1;
//     }
//     printf("a = %d  b = %d  c = %f  d = %f\n", a, b, c, d);
//   }
//   return 0;
// }
// Dados:
// 2 5 3.0 2.0
//
// Nota do resolvedor: Não entendi esse exercício


const std = @import("std");
const assert = std.debug.assert;

pub fn main() !void {

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    const stdin = &stdin_reader.interface;

    try stdout.print("Digite quatro números\n> ", .{});
    try stdout.flush();

    const a_str = try stdin.takeDelimiterExclusive(' ');
    var a = try std.fmt.parseInt(u32, a_str, 10);
    stdin.toss(1);
    const b_str = try stdin.takeDelimiterExclusive(' ');
    var b = try std.fmt.parseInt(u32, b_str, 10);
    stdin.toss(1);
    const c_str = try stdin.takeDelimiterExclusive(' ');
    var c = try std.fmt.parseFloat(f32, c_str);
    stdin.toss(1);
    const d_str = try stdin.takeDelimiterExclusive('\n');
    var d = try std.fmt.parseFloat(f32, d_str);
    stdin.toss(1);

    try stdout.print("a = {d}  b = {d}  c = {d}  d = {d}\n", .{a, b, c, d});
    while (a < b) {
        if (c > d) {
            d = f1(b,a);
            b = b - 1;
        } else {
            c = 1 / f1(a,b);
            a = a + 1;
        }
    try stdout.print("a = {d}  b = {d}  c = {d}  d = {d}\n", .{a, b, c, d});
    try stdout.flush();

  }
}

fn f1(x: u32, y:u32) f32 {
    var res: f32 = undefined;
    const x_float: f32 = @floatFromInt(x);
    const y_float: f32 = @floatFromInt(y);
    if (y != 0) {
        res = x_float / y_float;
    }
    else  {
        res = 1 / x_float;
    }

    var x_aux = x;
    while (x_aux > y) {
        const x_aux_float: f32 = @floatFromInt(x_aux);
        res = res + y_float / x_aux_float;
        x_aux = x_aux - 1;
    }
    return res;
}
