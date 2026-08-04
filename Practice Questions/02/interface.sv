import types_pkg::*;

interface quant_if (input logic clk); 
  
  quant_mode_e mode;
  
  quant_flags_s flags;
  
  logic signed [31:0] raw_data; 
  
  logic signed [7:0] quantized_out;
  
endinterface
  
