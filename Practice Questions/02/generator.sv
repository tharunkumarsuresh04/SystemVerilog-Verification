class generator;
  
  quant_tx tx;
  
  mailbox gen2drv;
  
  function new (mailbox m);
    
    gen2drv = m;
    
  endfunction

  task run ();
    
    repeat (3) begin
      
      tx = new();
      
      if ( !(tx.randomize() ) ) $fatal ("Generation Failed!!!");
      
      tx.agent_name = "GEN";
      
      tx.display(tx.agent_name);
      
      gen2drv.put(tx);
      
    end
    
  endtask
  
endclass

        
      
