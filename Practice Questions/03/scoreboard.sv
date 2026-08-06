class scoreboard;
  
  sparsity_tx tx;
  
  mailbox #(sparsity_tx) mon2scb;
  
  logic expected_sparse;
  
  function new(mailbox #(sparsity_tx) m);
    
    mon2scb = m;
    
  endfunction
  
  task run();
    
    forever begin
            
      mon2scb.get(tx);
      
      if(tx.mode == INT_MODE) begin
      
        expected_sparse = (tx.raw_int < 100) ? 1'b1 : 1'b0  ;
      
        if (expected_sparse == tx.hardware_result)
        
          $display("[SCB @ %0t ns] MATCH | MODE = INT | val = %0d | HW_OUTPUT = %0b", $time, tx.raw_int, tx.hardware_result);
        
        else 
        
          $display("[SCB @ %0t ns] MATCH | MODE = INT | val = %0d | HW_OUTPUT = %b", $time, tx.raw_int, tx.hardware_result);
             
      end
      
      else begin 
        
        expected_sparse = (tx.raw_float < 0.75) ? 1'b1 : 1'b0;
      
        if(expected_sparse == tx.hardware_result) 
        
          $display("[SCB @ %0t ns] MATCH | MODE = FLOAT | val = %0.2f | HW_OUTPUT = %b", $time, tx.raw_float, tx.hardware_result); 
                  
        else 
          
          $display("[SCB @ %0t ns] MATCH | MODE = FLOAT | val = %0.2f | HW_OUTPUT = %0b", $time, tx.raw_float, tx.hardware_result);
          
      end
      
    end
    
  endtask
  
endclass
      
      
      
      
      
    
    
