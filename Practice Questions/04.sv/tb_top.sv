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
  
  dma_if #(32) vif (clk);
  
  dma_sink #(32) DUT (.vif(vif));
  
  environment #(32) env;
  
  initial begin 
    
    $display("# ---- INITIALIZING ADAPTIVE DMA TESTBENCH ---");
    
    env = new(vif);
    
    env.run();
    
  end
  
  initial begin 
    
    $dumpfile("dump.vcd");
    
    $dumpvars(0, tb_top);
    
    #5000; 
    
    $display("# --- SIMULATION COMPLETE ---");
    
    $finish;
    
  end
  
endmodule
