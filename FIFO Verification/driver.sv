class driver;
    virtual fifo_if vif;
    mailbox #(transaction) gen2drv;

    function new(virtual fifo_if vif, mailbox #(transaction) gen2drv);
        this.vif = vif;
        this.gen2drv = gen2drv;
    endfunction

    task reset();
        wait(!vif.rst_n);
        vif.wr_en <= 0;
        vif.rd_en <= 0;
        vif.wdata <= 0;
        wait(vif.rst_n);
    endtask

    task main();
        forever begin
            transaction tr;
            gen2drv.get(tr);
            @(posedge vif.clk);
            vif.wr_en <= tr.wr_en;
            vif.rd_en <= tr.rd_en;
            if (tr.wr_en) vif.wdata <= tr.wdata;
        end
    endtask
endclass
