module sensor_monitor(telemetry_if vif);
  
  always_comb begin
    
    if (vif.adc_raw > 12'hC00) 
      vif.alert_flag = 1'b1;
    else 
      vif.alert_flag = 1'b0;
    
  end
  
endmodule
