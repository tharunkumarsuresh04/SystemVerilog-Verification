class fa_gen;
  
  int num_of_transactions = 20; 
  
  mailbox #(fa_trans)gen2drv;
  
  event ended;
  
  function new(mailbox #(fa_trans) gen2drv);
    
    this.gen2drv = gen2drv;
    
  endfunction
  
  
  task run();
    
    fa_trans tx;
    
    for(int i = 0; i <= num_of_transactions + 1; i++) begin
      
      tx = new();
      
      if (!tx.randomize() ) $fatal(1, "Gen: Randomization Failed!!");
      
      gen2drv.put(tx);
      
    end
    
    -> ended;
    
  endtask
  
  
endclass
      
