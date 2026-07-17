package types_pkg;

typedef struct packed {
  
  logic[31:0] start_addr;
  logic [7:0] burst_len;
  
} dma_header_s;

endpackage
