class fa_scb;
  
  mailbox #(fa_trans) mon2scb;
  
  int tests_passed = 0; 
  
  int tests_failed = 0;
  
  function new(mailbox #(fa_trans) mon2scb);
    
    this.mon2scb = mon2scb;
    
  endfunction
  
  task run();
    
    fa_trans tx; 
    
    forever begin 
      
      mon2scb.get(tx);
      
      if( {tx.cout, tx.sum} === tx.a + tx.b +tx.cin) begin
        
        $display("=================================================================");
        
        $display("[PASS] a = %0b || b = %0b || cin = %0b || sum = %0b || cout = %0b", tx.a, tx.b, tx.cin, tx.sum, tx.cout);
        
        $display("=================================================================");
        
        tests_passed++;
        
      end
      
      
      else begin
        
        $display("=================================================================");
        
        $error ("[FAIL] a = %0b || b = %0b || cin = %0b || sum = %0b || cout = %0b", tx.a, tx.b, tx.cin, tx.sum, tx.cout);
                        
        $display("=================================================================");
                
        tests_failed++;
      
      end

    end
    
  endtask 
  
endclass
  
