class environment #(parameter BUS_WIDTH = 32);
  
  agent #(BUS_WIDTH) agt;
  
  scoreboard scb;
  
  mailbox mon2scb;
  
  mailbox gen2scb;
  
  function new(virtual dma_if #(BUS_WIDTH) vif);
    
    mon2scb = new();
    
    gen2scb = new();
    
    agt = new(vif, mon2scb, gen2scb);
    
    scb = new(mon2scb, gen2scb);
    
  endfunction
  
  task run();
    
    fork
      
      agt.run();
      
      scb.run();
      
    join_any
    
  endtask 
  
endclass
