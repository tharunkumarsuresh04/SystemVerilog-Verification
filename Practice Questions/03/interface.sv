interface sparsity_if(input logic clk); 
  
  import types_pkg::*;
  
  thresh_mode_e mode;
  
  shared_data_u bus_data;
  
  logic is_sparse;
  
endinterface
