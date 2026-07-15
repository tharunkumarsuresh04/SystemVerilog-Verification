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
  
  telemetry_if vif (clk);
  
  sensor_monitor dut ( .vif(vif) );
  
  environment env;
  
  initial begin
    
    $display("#-----------------------------Initializing the TELEMETRY DATAPATH TESTBENCH-----------------------------");
    
    env = new(vif);
    
    env.run();
    
   end
  
  initial begin
    
    $dumpfile("dump.vcd");
    
    $dumpvars(0, tb_top);
    
    #100; 
    
    $display("#------------------------------SIMULATION COMPLETE-----------------------------");
    
    $finish;
    
  end
  
endmodule
