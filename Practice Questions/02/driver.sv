class driver;
  
  quant_tx tx;
  
  virtual quant_if vif;
  
  mailbox gen2drv;
  
  
  
  function new (virtual quant_if v, mailbox m);
    
    vif = v; 
    
    gen2drv = m;
    
  endfunction
  
  task run();
    
    forever begin 
         
      gen2drv.get(tx);
      
      @(posedge vif.clk);
      
      vif.mode <= tx.mode;
      
      vif.flags <= tx.flags;
      
      vif.raw_data <= tx.raw_data;
      
    end
    
  endtask
  
endclass
  
