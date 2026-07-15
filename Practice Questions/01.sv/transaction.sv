import types_pkg::*;

class telemetry_tx; 
   
  rand sensor_type_e s_type;
  
  rand bit [11:0] raw_val;
  
  real analog_calc; 
  
  string status_tag;
  
  logic alert_actual;
  
  function void display(string comp);
    
    $display("[%s] Packet: Sensor = %s | Raw = 12'h %0h", comp, s_type.name, raw_val);
    
  endfunction
  
endclass
