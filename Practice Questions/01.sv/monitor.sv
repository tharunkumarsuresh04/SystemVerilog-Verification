class monitor;
  
  virtual telemetry_if vif;
  
  telemetry_tx tx;
  
  mailbox mon2scb;
  
  function new(mailbox m, virtual telemetry_if v); 
    
    mon2scb = m;
    
    vif = v;
    
  endfunction
  
  task run();
    
    forever begin 
      
      @(posedge vif.clk);
      
      #1; 
      
      tx = new();
      
      tx.s_type = vif.s_type;
      
      tx.raw_val = vif.adc_raw;
      
      tx.alert_actual = vif.alert_flag;
      $display("[MON @ %0t] Pulled from Hardware 12'h %0h", $time, vif.adc_raw);
      
      mon2scb.put(tx);
      
    end
    
  endtask
  
endclass
  
