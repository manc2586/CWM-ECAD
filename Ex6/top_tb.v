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
	reg rst = 0;
	reg clk;
	reg button = 0;
	reg sel;
	wire [2:0] result;
	
	reg err = 0;

// clock generation
	initial
	begin
		clk = 0;
		forever
			#(CLK_PERIOD/2) clk = ~clk;
	end

// actual test
	initial 
	begin
		// test dice
	    sel = 0;
		rst = 1;
		#10 
		rst = 0; 
		button = 1;	
		#100
		if(result != 3'b100) 
		begin 
			err = 1;
			$display("***DICE TEST FAILED***",result);
		end
		
        // test traffic lights
        sel = 1;
        #20
        if(result != 3'b010)
        begin  
            err = 1;
            $display("***TRAFFIC LIGHTS FAILED***",result);
        end
        
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
