class monitor;
    virtual fifo_if vif;
    mailbox #(transaction) mon2scb;

    function new(virtual fifo_if vif, mailbox #(transaction) mon2scb);
        this.vif = vif;
        this.mon2scb = mon2scb;
    endfunction

    task main();
        forever begin
            transaction tr = new();
            @(posedge vif.clk);
            // Sample signals after the clock edge
            #1; 
            tr.wr_en = vif.wr_en;
            tr.rd_en = vif.rd_en;
            tr.wdata = vif.wdata;
            tr.rdata = vif.rdata;
            tr.full  = vif.full;
            tr.empty = vif.empty;
            mon2scb.put(tr);
        end
    endtask
endclass
