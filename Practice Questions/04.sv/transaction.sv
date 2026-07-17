import types_pkg::*;

class dma_tx; 
  
  rand dma_header_s header;
  
  rand bit [31:0] payload[];
  
  constraint lock_pyld {
    
    payload.size() inside { [4:16] };
    
  }
  
  constraint c_len {
   
    header.burst_len == payload.size();
    
  }
  
  
  logic [31:0] captured_q[$];
  
  function void display(string comp);
    
    
    $display("[%s @ %0t ns] Burst Triggered | Addr: 32'h %0h | Length: %2d Beats", comp, $time, header.start_addr, header.burst_len);
    
  endfunction
  
endclass
  
  
