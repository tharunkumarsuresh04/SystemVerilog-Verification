// Code your testbench here
// or browse Examples

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
  
  environment env; 
  
  logic clk = 0; 
  
  always #5 clk = ~clk;
  
  sparsity_if vif (clk);
  
  sparsity_checker DUT( .vif(vif) );
  
  initial begin 
    
    env = new(vif);
    
    env.run();
    
    #120; 

    $finish;
    
  end
  
  initial begin 
    
    $dumpfile("dump.vccd");
    
    $dumpvars(0, tb_top);
    
  end
  
endmodule 
