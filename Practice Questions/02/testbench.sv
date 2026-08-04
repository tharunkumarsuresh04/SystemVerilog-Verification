`include "types_pkg.sv"
`include "interface.sv"
`include "dut.sv"
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "agent.sv"
`include "environment.sv"


module tb_top;
  
  logic clk = 0;
  
  always #5 clk = ~clk;
	  
  quant_if vif (clk);
  
  quantizer dut(.vif(vif) );
  
  environment env;
  
  initial begin
    
    $display("#--- INITIALIZING QUANTIZER DATATYPE TESTBENCH ---");
    
    env = new(vif);
    
    env.run();
    
  end
  
  initial begin
    
    $dumpfile("dump.vcd");
    
    $dumpvars;
    
    #100; 

    $display("#--- SIMULATION COMPLETE ---");
    
    $finish;
    
  end
  
endmodule
