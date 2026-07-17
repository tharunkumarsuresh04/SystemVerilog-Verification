class monitor#(parameter BUS_WIDTH = 32);
  
  dma_tx tx; 
  
  mailbox mon2scb;
  
  virtual dma_if #(BUS_WIDTH) vif;
  
  function new(mailbox m, virtual dma_if #(BUS_WIDTH) v);
    mon2scb = m;
    
    vif = v;
    
  endfunction
  
  task run();
    
    forever begin 
      
      @(posedge vif.clk);
      
      #1; 
      
      if(vif.valid) begin 
        
        if(tx == null) begin 
        
          tx = new();
        
          tx.header = vif.header;
          
        end
        
        tx.captured_q.push_back(vif.data_bus);
        
      end
      
      else begin 
        
        if(tx != null) begin 
          
          mon2scb.put(tx); 
          
          tx = null;
          
        end
        
      end
      
    end
    
  endtask 
  
endclass
