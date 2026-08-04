class agent; 
  
  generator gen; 
  
  driver drv;
  
  monitor mon;
  
  mailbox gen2drv, mon2scb;
  
  function new(virtual quant_if v, mailbox m2s);
    
    gen2drv = new();
    
    mon2scb = m2s;
    
    gen = new (gen2drv);
    
    drv = new (vif, gen2drv); 
    
    mon = new (vif, mon2scb);
    
  endfunction
  
  task run();
    
    fork 
      
      gen.run();
      
      drv.run();
      
      mon.run();
      
    join_any
    
  endtask
  
endclass
    
    
    
