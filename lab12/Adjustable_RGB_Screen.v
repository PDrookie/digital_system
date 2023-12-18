module Adjustable_RGB_Screen(clk_in,rst,key,hsync,vsync,ro,bo,go);
	input clk_in,rst;
	input [2:0] key;
	output hsync,vsync;
	output [3:0] ro,bo,go;
	reg [3:0] ir,ib,ig;///reg?
	wire clk_out;
	freqDivider f1(clk_in,clk_out,rst);
	
	sync(clk_out,rst,hsync,vsync,ir,ib,ig,ro,bo,go);
	
	always@(negedge key[0] or negedge rst)
	begin
		if(!rst) ir <= 0;
		else ir <= ir + 1;
	end
	always@(negedge key[1] or negedge rst)
	begin
		if(!rst) ib <= 0;
		else ib <= ib + 1;
	end
	always@(negedge key[2] or negedge rst)
	begin
		if(!rst) ig <= 0;
		else ig <= ig + 1;
	end
	
endmodule
