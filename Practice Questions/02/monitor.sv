class monitor;
  
  virtual quant_if vif;
  
  mailbox mon2scb;
  
  quant_tx tx;
  
  function new (virtual quant_if v, mailbox m);
    
    vif = v; 
    
    mon2scb = m;
    
  endfunction
  
  task run ();
    
    forever begin 
      
      @(posedge vif.clk); 
      
      if(vif.flag_enable == 1'b1) begin 
        
        tx = new();
        
        tx.mode = vif.mode;
        
        tx.flags = vif.flags;
        
        tx.raw_data = vif.raw_data;
        
        tx.quantized_out = vif.quantized_out;
        
        tx.sim_time = $time;
        
        tx.agent_name = "MON";
        
        mon2scb.put(tx);
        
      end 
      
    end
    
  endtask
  
endclass
      
      
