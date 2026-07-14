module fa (
  
  input logic a, 
  input logic b, 
  input logic cin, 
  output logic sum, 
  output logic cout
);
  
  always_comb begin 
    
    {cout, sum} = a + b + cin;
    
  end
  
endmodule


interface fa_intf;
  
  logic a;
  logic b; 
  logic cin; 
  logic sum;
  logic cout;
  
endinterface
