class environment; 
  
  agent agt; 
  
  scoreboard scb;
  
  mailbox mon2scb;
  
  function new(virtual telemetry_if vif);
    
    mon2scb = new();
    
    scb = new (mon2scb);
    
    agt = new (vif, mon2scb);
    
  endfunction
  
  task run();
    
    fork 
      
      agt.run();
      
      scb.run();
      
    join_any
    
  endtask 
  
endclass
