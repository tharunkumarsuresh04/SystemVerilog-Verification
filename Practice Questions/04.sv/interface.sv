interface dma_if #(parameter BUS_WIDTH = 32) (input logic clk);
  
  import types_pkg::*;
  
  dma_header_s header;
  
  logic valid;
  
  logic [BUS_WIDTH - 1 : 0] data_bus;
  
endinterface
  
