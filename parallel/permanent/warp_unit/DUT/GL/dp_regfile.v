module dp_regfile(clk, rst, addr_a, din_a, we_a, addr_b, din_b, we_b, dout_a, dout_b);

// Parameters values:

parameter RAM_SIZE 		= 1024;
parameter RAM_A_WIDTH 	= 10;
parameter RAM_D_WIDTH 	= 8;

// Ports definition:

input clk, rst;
input [RAM_A_WIDTH-1:0] addr_a, addr_b;
input [RAM_D_WIDTH-1:0] din_a, din_b;
input we_a, we_b;

output [RAM_D_WIDTH-1:0] dout_a, dout_b;

// Internal signals definition:

reg [RAM_D_WIDTH-1:0] dout_a, dout_b;

reg [RAM_D_WIDTH-1:0] memory [0:RAM_SIZE-1];


	// Procedure of writing from structure (Store)

	always @(posedge clk or posedge rst) begin

		if (rst == 1'b1) begin
		end 
		else begin 
			if ((we_a == 1'b1) && (addr_a < RAM_SIZE))		// Using port A for storing
				memory[addr_a] = din_a;

			if ((we_b == 1'b1) && (addr_b < RAM_SIZE))		// Using port B for storing
				memory[addr_b] = din_b;
			end
		end


	// Procedure of reading from structure (Load)

	always @(addr_a, addr_b, we_a, we_b) begin
		if ((we_b == 1'b1) && (addr_a == addr_b))		   	// Error in the control line, during reading
			dout_a = din_b;
		else if (we_a == 1'b1)							// Error, instead of reading, it is writing
			dout_a = din_a;
		else if (we_a == 1'b0 && addr_a < RAM_SIZE)   	// Read case from port a
			dout_a = memory[addr_a];
		else
			dout_a = 0;

		if ((we_a) && (addr_a == addr_b))			// Error in the control line, during reading
			dout_b = din_a;
		else if (we_b)							// Error, instead of reading, it is writing
			dout_b = din_b;
		else if (we_b == 1'b0 && addr_b < RAM_SIZE)   	// Read case from port b
			dout_b = memory[addr_b];
		else
			dout_b = 0;
	end


endmodule

