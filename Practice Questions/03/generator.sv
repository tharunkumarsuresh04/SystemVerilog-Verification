class generator; 
  
  sparsity_tx tx; 
  
  mailbox #(sparsity_tx) gen2drv;
  
  function new(mailbox #(sparsity_tx) m);
    
    gen2drv = m; 
    
  endfunction
  
  task run();
    
    repeat (10) begin 
      
      tx = new();
      
      if ( !(tx.randomize()) ) $fatal (1, "Randomization Generation Failed!!");
      
      //
      if (tx.mode == FLOAT_MODE) begin 
        if ($urandom_range(0,1) == 1) begin 
          tx.raw_float = 0.5;
        
        end
      
        else begin 
        
          tx.raw_float = 1.25;
        
        end
      
      end
      tx.display("GEN");
        
      gen2drv.put(tx);
      
    end
        
  endtask
  
endclass
      
      
      
        
        
  
  
