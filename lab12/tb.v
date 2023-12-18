/*`timescale 1ns/1ps
module tb;
	reg clk_in=0;
	reg rst;
	reg [2:0] key;
	wire hsync,vsync;
	wire [3:0] ro,bo,go;
	Adjustable_RGB_Screen UUT(
		.clk_in(v),
		.rst(rst),
		.key(key)
	);
	always #5 clk = ~clk;
endmodule*/

	