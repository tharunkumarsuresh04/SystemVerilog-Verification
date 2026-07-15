class agent;
  
  generator gen; 
  
  driver drv; 
  
  monitor mon;
  
  mailbox gen2drv, mon2scb;
  
  function new (virtual telemetry_if vif, mailbox m2s);
    
    gen2drv = new();
    
    mon2scb = m2s; 
    
    drv = new (gen2drv, vif);
    
    gen = new (gen2drv);
    
    mon = new (mon2scb, vif);
    
  endfunction
  
  task run();
    
    fork 
      
      gen.run(); 
      
      mon.run();
      
      drv.run();
      
    join_any
    
  endtask
  
endclass
    
