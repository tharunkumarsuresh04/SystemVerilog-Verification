import types_pkg::*;

module sparsity_checker (
  sparsity_if vif
); 
  
  always_comb begin 
    
    if (vif.mode == INT_MODE) begin 
      
      if(vif.bus_data.i_val < 32'd100) begin 
        
        vif.is_sparse = 1'b1;
      end 
      
      else begin 
        
        vif.is_sparse = 1'b0; 
      end 
      
    end
    
    if (vif.mode == FLOAT_MODE) begin 
      
      if(vif.bus_data.f_val < 32'h3F400000) begin 
        
        vif.is_sparse = 1'b1; 
        
      end 
      
      else begin 
        
        vif.is_sparse = 1'b0; 
        
      end 
      
    end 
    
  end
  
endmodule
