module fifo_sync (fifo_if vif);
    localparam DEPTH = 16;
    logic [7:0] mem [0:DEPTH-1];
    logic [3:0] wr_ptr, rd_ptr;
    logic [4:0] count;

    assign vif.empty = (count == 0);
    assign vif.full  = (count == DEPTH);

    always_ff @(posedge vif.clk or negedge vif.rst_n) begin
        if (!vif.rst_n) begin
            wr_ptr <= 0; rd_ptr <= 0; count <= 0; vif.rdata <= 0;
        end else begin
            case ({vif.wr_en && !vif.full, vif.rd_en && !vif.empty})
                2'b10: begin // Write
                    mem[wr_ptr] <= vif.wdata; wr_ptr <= wr_ptr + 1; count <= count + 1;
                end
                2'b01: begin // Read
                    vif.rdata <= mem[rd_ptr]; rd_ptr <= rd_ptr + 1; count <= count - 1;
                end
                2'b11: begin // Concurrent
                    mem[wr_ptr] <= vif.wdata; wr_ptr <= wr_ptr + 1;
                    vif.rdata <= mem[rd_ptr]; rd_ptr <= rd_ptr + 1;
                end
            endcase
        end
    end
endmodule
