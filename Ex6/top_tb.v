//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #6 - Dice or Traffic Lights?
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex6 - Dice or Traffic Lights?
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb(
	);

// parameters
	parameter CLK_PERIOD = 10;
	
// registers and wires


// clock generation
	initial
	begin
		clk = 0;
		forever
			#(CLK_PERIOD/2) clk = ~clk;
	end

// finish test, check for success
	initial 
	begin
        #500 
        if (err == 0)
        	$display("***TEST PASSED!***");
        $finish;
    end

// instantiate counter module
	dotl top( 
		.rst (rst),
		.clk (clk),
		.button (button), 
		.sel (sel),
		.result (result)
		);

endmodule
