class fa_agent;
  
  fa_gen generator;
  
  fa_drv driver;
  
  fa_mon monitor;
  
  mailbox #(fa_trans) gen2drv;
  
  function new (virtual fa_intf vintf, mailbox #(fa_trans) mon2scb);
    
    gen2drv = new();
    
    generator = new(gen2drv);
    
    driver = new(vintf, gen2drv);
    
    monitor = new(vintf, mon2scb);
    
  endfunction
  
  task run();
    
    fork 
      
      generator.run();
      
      driver.run();
      
      monitor.run();
      
    join_any
    
  endtask 
  
  
endclass
                 
                 
      
