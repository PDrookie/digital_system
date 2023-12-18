// Frequency divider
module freqDivider(clock_in, clock_out, reset);
	input clock_in,reset;
	output clock_out;
	reg clock_out;
	reg [31:0] count;
	always@(posedge clock_in)
	begin 
		clock_out <= ~clock_out;
	end

endmodule
