import types_pkg::*;

class sparsity_tx;
  
  rand thresh_mode_e mode;
  
  rand int raw_int;
  
  shortreal raw_float;
  
  logic hardware_result;
  
  function void display(string comp);
    
    if (mode == INT_MODE) begin 
      
      $display("[%s @ %0t ns] User Chosen Integer Representation Mode, and the Integer value is: %0d", comp, $time, raw_int);
      
    end 
    
    if (mode == FLOAT_MODE) begin  
      
      $display("[%s @ %0t ns] User Chosen Floating Point Representation Mode, and the Float values is: %0.2f", comp, $time, raw_float);
      
    end
    
  endfunction  

endclass
  
  
