interface fifo_if (input logic clk, rst_n);
    logic wr_en;
    logic rd_en;
    logic [7:0] wdata;
    logic [7:0] rdata;
    logic full;
    logic empty;
endinterface
