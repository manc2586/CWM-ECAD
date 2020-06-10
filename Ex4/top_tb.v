//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Electronic Dice
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex4 - Electronic Dice
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb(
    );

//Todo: Parameters
	parameter CLK_PERIOD = 10;
	
//Todo: Registers and wires
	reg rst = 0;
	reg button = 0; 
	reg clk = 0;
	reg err = 0;
	wire [2:0] throw;
	
//Todo: Clock generation
	initial
	begin
		clk = 0;
		forever
			#(CLK_PERIOD/2) clk = ~clk;
	end

//Todo: User logic
	initial
	
	begin
		// test normal throw
		button = 1;
		#(CLK_PERIOD * 10)
		if(throw != 3'b100)
		begin
        	$display("***THROW FAILED!***");    
        	err=1;
    	end
		
		// test reset
		button = 0;
		rst = 1;
		#(CLK_PERIOD * 10)
		if(throw != 3'b000)
		begin
        	$display("***RESET FAILED!***");    
        	err=1;
    	end
    	
    	// test illegal values
    	rst = 0;
    	#CLK_PERIOD
		if(throw == 3'b000 || throw == 3'b111)
		begin
        	$display("***ILLEGAL VALUE!***");    
        	err=1;
    	end
		
	end

//Todo: Finish test, check for success
	initial 
	begin
        #500 
        if (err==0)
        	$display("***TEST PASSED! x)***");
        $finish;
    end

//Todo: Instantiate counter module
	dice top ( 
		.rst (rst),
		.clk (clk),
		.button (button),
		.throw (throw));

endmodule 
