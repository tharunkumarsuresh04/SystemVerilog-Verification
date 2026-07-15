interface telemetry_if (input logic clk); 
  
  import types_pkg::*;
  
  sensor_type_e s_type;
  
  logic [11:0] adc_raw; 
  
  logic alert_flag;
  
endinterface
