module dma_sink #(parameter BUS_WIDTH = 32) (dma_if vif);
  import types_pkg::*; 
   
endmodule

//Note: This is a  passive parameterized sink. In physical hardware, this would 
// contain the FIFO logic to catch the burst.
