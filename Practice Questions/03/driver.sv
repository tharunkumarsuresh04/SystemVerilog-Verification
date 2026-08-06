class driver;
  
  virtual sparsity_if vif;
  
  sparsity_tx tx; 
  
  mailbox #(sparsity_tx) gen2drv;
  
  function new (virtual sparsity_if v, mailbox #(sparsity_tx) m);
    
    vif = v;
    
    gen2drv = m;
    
  endfunction
  
  task run(); 
    
    forever begin 
            
      gen2drv.get(tx); 
      
      @(posedge vif.clk);
      
      vif.mode <= tx.mode;
      
      if (tx.mode == INT_MODE) begin 
        
        vif.bus_data.i_val <= tx.raw_int;
        
      end
      
      if (tx.mode == FLOAT_MODE) begin 
        
        vif.bus_data.f_val <= $shortrealtobits (tx.raw_float);
        
      end
      
    end
    
  endtask
  
endclass
