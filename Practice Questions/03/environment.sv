class environment;
  
  agent agt; 
  
  scoreboard scb;
  
  mailbox #(sparsity_tx) mon2scb;
  
  function new(virtual sparsity_if vif);
    
    mon2scb = new();
    
    agt = new(vif, mon2scb);
    
    scb = new(mon2scb);
    
  endfunction
  
  task run();
    
    fork
      agt.run();
    
      scb.run();
      
    join_any
    
  endtask 
  
endclass
    
