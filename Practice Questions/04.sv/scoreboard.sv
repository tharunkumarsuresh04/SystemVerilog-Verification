class scoreboard;
  
  dma_tx exp_tx;
  
  dma_tx act_tx;
  
  mailbox mon2scb;
  
  mailbox gen2scb;
  
  function new(mailbox m_mon, mailbox m_gen);
    
    mon2scb = m_mon;
    
    gen2scb = m_gen;
    
  endfunction
  
  task run();
    
    logic [31:0] popped_up_data;
    
    forever begin 
      
      gen2scb.get(exp_tx);
      
      mon2scb.get(act_tx);
      
      $display("[SCB @ %0t ns] -------------- Analyzing Burst (Addr: 32'h%h --------------", $time, exp_tx.header.start_addr);
      
      if(exp_tx.payload.size() == act_tx.captured_q.size()) begin 
        
        $display("[SCB @ %0t ns] PASS | Lengths MATCH | Expected %0d BEATS, Captured: %0d", $time, exp_tx.payload.size(), act_tx.captured_q.size() );
      end 
      
      else begin 
        
        $error("[SCB @ %0t ns] FAIL | Length MISMATCH | Expected %0d BEATS, Captured: %0d", $time, exp_tx.payload.size(), act_tx.captured_q.size() );
      end
      
      foreach( exp_tx.payload[i] ) begin
        
        popped_up_data = act_tx.captured_q.pop_front();
        
        if(exp_tx.payload[i] != popped_up_data) begin 
          
          $display("[SCB @ %0t ns] DATA CORRUPTION @ Index %0d | Expected: %0h | Actual: %0h", $time, i, exp_tx.payload[i], popped_up_data);
          
        end
        
      end
      
      $display("[SCB @ %0t ns] PASS | ALL PAYLOAD DATATYPES MATCHED SUCCESSFULLY!\n", $time);
      
    end
   
  endtask 
  
endclass
      
