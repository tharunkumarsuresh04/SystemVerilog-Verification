import types_pkg::*;

class scoreboard;
   
  mailbox mon2scb;
  
  quant_tx tx; 
  
  byte expected_val;
  
  function new (mailbox m); 
    
    mon2scb = m;
    
  endfunction
  
  task run();
    
    forever begin 
      
      mon2scb.get(tx);
      
      expected_val = tx.raw_data [7:0]; 
      
      if (expected_val == tx.quantized_out) begin
        $display("[SCB @ %0t] PASS | Mode = %s | Expected_Byte = %0d | Hardware_Byte = %0d", $time, tx.mode.name(), expected_val, tx.quantized_out);
        
      end
      
      else begin 
        $error ("[SCB @ %0t] FAIL | Mode = %s | Expected_Byte = %0d | Hardware_Byte = %0d", );
        
      end
      
    end 
    
  endtask 
  
endclass
  
  
  
