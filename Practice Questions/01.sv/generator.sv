  mailbox gen2drv;
  
//   int num_of_transactions = 15;
  
  function new(mailbox m);
    
    gen2drv = m;
    
  endfunction
  
  task run();
    
//     for(int i = 0. i < num_of_transactions; i++) begin 
    repeat(5) begin 
    
    tx = new();
    
    if( !tx.randomize() ) $fatal ("Failed to Generate Randomization!!");

    tx.display("GEN");
    
    gen2drv.put(tx);

    end
  
  endtask
  
endclass
