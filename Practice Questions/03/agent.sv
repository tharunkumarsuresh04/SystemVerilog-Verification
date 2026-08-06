class agent;
  
  generator gen;
  
  driver drv;
  
  monitor mon;
  
  mailbox #(sparsity_tx) gen2drv; 
  
  mailbox #(sparsity_tx) mon2scb;
  
  function new (virtual sparsity_if vif, mailbox #(sparsity_tx) m2s);

    gen2drv = new();
    
    mon2scb = m2s;
    
    gen = new(gen2drv);
    
    drv = new(vif, gen2drv);
    
    mon = new(vif, mon2scb);
    
  endfunction
  
  task run();
    
    fork 
      
      gen.run();
      
      drv.run();
      
      mon.run();
      
    join_any
    
  endtask
  
endclass
