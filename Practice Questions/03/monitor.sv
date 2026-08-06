class monitor; 
  
  virtual sparsity_if vif;
  
  sparsity_tx tx; 
  
  mailbox #(sparsity_tx) mon2scb;
  
  function new (virtual sparsity_if v, mailbox #(sparsity_tx) m);
    
    vif = v; 
    
    mon2scb = m;
    
  endfunction 
  
  task run();
        
    forever begin 
      
      @(posedge vif.clk); #1; 
      
      tx = new();
      
      tx.mode = vif.mode;
      
      if (tx.mode == INT_MODE) begin 
        
        tx.raw_int = vif.bus_data.i_val;
        
      end 
      
      else begin 
        
        tx.raw_float = $bitstoshortreal(vif.bus_data.f_val);
        
      end
      
      tx.hardware_result = vif.is_sparse;
      
      mon2scb.put(tx);
      
    end
    
  endtask
  
endclass
    
     
