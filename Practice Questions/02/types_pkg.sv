package types_pkg;

typedef enum logic {
  
  TRUNCATE = 1'b0, 
  
  ROUND = 1'b1
  
} quant_mode_e; 

typedef struct packed {
  
  logic enable;
  
  logic signed_mode;
  
} quant_flags_s;

endpackage
