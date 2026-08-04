
import types_pkg::*;

class quant_tx;
  
  rand quant_mode_e mode; 
  
  rand quant_flags_s flags;
  
  rand int raw_data;
  
  byte quantized_out;
  
  time sim_time; 
  
  string agent_name;
  
  constraint c_en {
    
    flags.enable == 1'b1;
    
  }
  
  function display(string comp);
    
    $display("[%s] Packet Sent: Mode = %s | Flags = {en = %b, sign = %b} | Raw Int: %0d", comp, mode.name(), flags.enable, flags.signed_mode, raw_data);
    
  endfunction
  
  endclass
