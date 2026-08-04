module quantizer (quant_if vif); 
  
  always_comb begin
    
    if (vif.flags.enable == 1'b1) begin
      
      vif.quantized_out = vif.raw_data [7:0];
      
    end
    
    else begin 
      
      vif.quantized_out = 8'b0;
      
    end
    
  end
  
endmodule
      
      
