package types_pkg;

typedef enum logic {
  
  INT_MODE = 1'b0, FLOAT_MODE = 1'b1
} thresh_mode_e;

typedef union packed {
  
  logic [31:0] i_val; 
  
  logic [31:0] f_val; 
  
} shared_data_u; 

endpackage
