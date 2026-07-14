`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "agent.sv"
`include "environment.sv"

module tb_top;
  
  fa_intf vintf();
  
  fa dut ( .a(vintf.a), 
          .b(vintf.b), 
          .cin(vintf.cin), 
          .sum(vintf.sum), 
          .cout(vintf.cout)
          
         );
  
  fa_env env; 
  
  
  initial begin
    
    env = new(vintf);
    
    $display("=========================================================================");
    
    $display("STARTING THE FULL, LAYERED VERIFICATION FOR FULL ADDER IN SYSTEMVERILOG");
    
    $display("=========================================================================");
        
    env.run();
    
    $finish;
    
  end
  
endmodule
