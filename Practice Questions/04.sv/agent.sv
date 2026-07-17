class agent #(parameter BUS_WIDTH = 32);
  
  generator gen; 
  
  driver #(BUS_WIDTH) drv; 
  
  monitor #(BUS_WIDTH) mon;
  
  mailbox gen2drv, mon2scb, gen2scb;

  function new(virtual dma_if #(BUS_WIDTH) vif, mailbox m2s, mailbox g2s);
    
    gen2drv = new(2);
    
    mon2scb = m2s; 
    
    gen2scb = g2s;
    
    gen = new(gen2drv, gen2scb);
    
    drv = new(gen2drv, vif);
    
    mon = new(mon2scb, vif);
    
  endfunction
  
  task run();
    
    fork
      
      gen.run();
      
      drv.run();
      
      mon.run();
      
    join_any
    
  endtask
  
endclass
  
  
