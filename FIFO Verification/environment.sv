class environment;
    generator  gen;
    driver     drv;
    monitor    mon;
    scoreboard scb;
    
    mailbox #(transaction) gen2drv;
    mailbox #(transaction) mon2scb;
    
    virtual fifo_if vif;

    function new(virtual fifo_if vif);
        this.vif = vif;
        gen2drv = new();
        mon2scb = new();
        
        gen = new(gen2drv);
        drv = new(vif, gen2drv);
        mon = new(vif, mon2scb);
        scb = new(mon2scb);
    endfunction

    task test();
        fork
            gen.main();
            drv.reset();
            drv.main();
            mon.main();
            scb.main();
        join_any
    endtask
endclass
