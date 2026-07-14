class fa_env;
  
  fa_agent agent;
  
  fa_scb scoreboard;
  
  mailbox #(fa_trans) mon2scb;

  
  function new (virtual fa_intf vintf);
    
    mon2scb = new();
    
    agent = new(vintf, mon2scb);
    
    scoreboard = new(mon2scb);
    
  endfunction
  
  task run();
    
    fork 
      
      agent.run();
      
      scoreboard.run();
      
    join_any
    
    wait(scoreboard.tests_passed + scoreboard.tests_failed == agent.generator.num_of_transactions);
    
    #10; 
    
    $display("=========================================================================");
    
    $display("VERIFICATION COMPLETED: PASSED = %0d || FAILED = %0d", scoreboard.tests_passed, scoreboard.tests_failed);
    
    $display("=========================================================================");
    
  endtask
  
endclass 
  
  
