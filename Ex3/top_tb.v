//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Up/Down counter
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex3 - counter
// Guidance: start with simple tests of the module (how should it react to each 
// control signal?). Don't try to test everything at once - validate one part of 
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb(
    );
    
//Todo: Parameters
	parameter CLK_PERIOD = 10;
	
//Todo: Registers and wires
	reg rst = 0;
	reg enable = 1;
	reg direction = 1;
	reg clk; 
	reg err = 0;
	wire [7:0] counter_out;

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
    	// test direction up
    	#(CLK_PERIOD * 8)
    	if(counter_out!=8'b0000_1000)
    	begin
        	$display("***COUNT UP FAILED!***");    
        	err=1;
    	end
    
    	// test direction down
    	direction = 0;
    	#(CLK_PERIOD * 5)
    	if(counter_out!=8'b00000011)
    	begin
        	$display("***COUNT DOWN FAILED!***");    
        	err=1;
    	end
    	
    	// test reset
    	rst = 1; 
    	#CLK_PERIOD
    	if (counter_out!=8'b0)
    	begin
        	$display("***RESET FAILED!***");    
        	err=1;
    	end
    	
    	// test enable
    	rst = 0;
    	enable = 0; 
    	#CLK_PERIOD 
    	if (counter_out!=8'b0)
    	begin
        	$display("***ENABLE FAILED!***");    
        	err=1;
    	end
    	
    end
    
//Todo: Finish test, check for success
	initial 
		begin
        #50 
        if (err==0)
        	$display("***TEST PASSED! x) ***");
        $finish;
      	end

//Todo: Instantiate counter module
	counter top ( 
		.rst (rst),
		.enable (enable),
		.direction (direction),
		.clk (clk),
		.counter_out (counter_out));

endmodule 
