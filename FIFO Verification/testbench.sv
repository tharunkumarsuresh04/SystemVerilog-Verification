// Code your testbench here
// or browse Examples
`include "dut.sv"
`include "interface.sv"
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "environment.sv"

`timescale 1ns/1ns

module tb_top;
    logic clk;
    logic rst_n;

    // Interface instance
    fifo_if vif(clk, rst_n);

    // DUT instance
    fifo_sync dut (.vif(vif));

    // Environment instance
    environment env;

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test execution
    initial begin
        env = new(vif);
        env.gen.repeat_count = 50; // Number of random transactions
        
        // Reset sequence
        rst_n = 0;
        #20 rst_n = 1;
        
        // Run verification
        env.test();
        
        // Wait for generator to finish
        wait(env.gen.ended.triggered);
        #50;
        $display("Verification Complete.");
        $finish;
    end
  
endmodule
