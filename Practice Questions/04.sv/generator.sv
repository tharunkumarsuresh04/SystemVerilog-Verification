class generator;
  
  dma_tx tx;
  
  mailbox gen2drv;
  
  mailbox gen2scb;
  
  int num_of_transactions = 15;
  
  function new(mailbox m_drv, mailbox m_scb);
    
    gen2drv = m_drv; 
    
    gen2scb = m_scb;
    
  endfunction
  
  task run();
    
    for(int i = 0; i < num_of_transactions; i++) begin 
      
      tx = new();
      
      if( ! (tx.randomize() ) ) $fatal("Generation of Randomization Failed!!!");
      
      tx.display("GEN");
      
      gen2scb.put(tx);
      
      gen2drv.put(tx);
      
    end
    
  endtask
  
endclass
