class driver; 
  
  telemetry_tx tx; 
  
  virtual telemetry_if vif;
  
  mailbox gen2drv;
  
  function new (mailbox m, virtual telemetry_if v); 
    
    gen2drv = m; 
    
    vif = v;
    
  endfunction
  
  task run();
    
    forever begin
      	
      gen2drv.get(tx); 
      
      @(posedge vif.clk);
      
      vif.s_type <= tx.s_type;
      
      vif.adc_raw <= tx.raw_val;
      
      $display("[DRV @ %0t] Pushed to Hardware: 12'h %0h", $time, tx.raw_val);      
    end 
    
  endtask 
  
endclass
