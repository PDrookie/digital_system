module sync(clk,rst,hsync,vsync,ir,ib,ig,ro,bo,go);
	input clk,rst;
	input [3:0] ir,ib,ig;
	output [3:0] ro,bo,go;
	output hsync,vsync;
	reg [9:0] hcounter,vcounter;
	
	assign hsync = hcounter < 95 ? 0 : 1;
	assign vsync = vcounter < 1 ? 0 : 1;
	assign ro = hcounter <= 143 ? 0 : ir;
	assign bo = hcounter <= 143 ? 0 : ib;
	assign go = hcounter <= 143 ? 0 : ig;
	
	always@(posedge clk or negedge rst)
	begin
		if(!rst)begin
			hcounter <= 0;
			vcounter <= 0;
		end
		else begin
			
			if(hcounter == 800 - 1) hcounter <= 0;
			else hcounter <= hcounter + 1;
			
			if(vcounter == 525 - 1) vcounter <= 0;
			else if (hcounter == 800 - 1) vcounter <= vcounter + 1;
			else vcounter <= vcounter;
			
		end
	end
endmodule
