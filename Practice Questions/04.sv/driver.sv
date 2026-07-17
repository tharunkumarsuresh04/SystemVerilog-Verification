class driver #(parameter BUS_WIDTH = 32); 
  
  dma_tx tx; 
  
  mailbox gen2drv; 
  
  virtual dma_if #(BUS_WIDTH) vif;
  
  function new(mailbox m, virtual dma_if #(BUS_WIDTH) v );
    
    gen2drv = m; 
    
    vif = v;
    
  endfunction
  
  task run();
    
    vif.valid <= 1'b0; 
    
    forever begin 
      
      gen2drv.get(tx); 
      
      @(posedge vif.clk);
      
      vif.header <= tx.header;
      
      foreach(tx.payload[i]) begin 
        
        vif.valid <= 1'b1;
      
        vif.data_bus <= tx.payload[i];
        
        @(posedge vif.clk);
        
      end
    
    vif.valid <= 1'b0;
      
    end
    
  endtask 
  
endclass
