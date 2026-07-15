import types_pkg::*;

class scoreboard; 
  
  telemetry_tx tx; 
  
  mailbox mon2scb;
  
  function new(mailbox m);
    
    mon2scb = m;
    
  endfunction
  
  task run();
    
    forever begin 
      
      mon2scb.get(tx);
      
      tx.analog_calc = tx.raw_val;
      
      tx.analog_calc = real'(tx.raw_val) * 0.00122 ; 
      
      if(tx.raw_val > 12'hC00) begin
        
        tx.status_tag = "CRITICAL_OVERVOLT";
        
      end
      
      else begin        
        tx.status_tag = "NOMINAL";      
      end
      
      $display("[SCB] PASS | Analog = %0.2f | Status = %-17s | HW_Alert = %b", tx.analog_calc, tx.status_tag, tx.alert_actual);
      
    end
    
  endtask
  
endclass

    
    
      
        
