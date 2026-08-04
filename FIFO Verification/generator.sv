class generator;
    transaction tr;
    mailbox #(transaction) gen2drv;
    event ended;
    int repeat_count;

    function new(mailbox #(transaction) gen2drv);
        this.gen2drv = gen2drv;
    endfunction

    task main();
        for (int i = 0; i < repeat_count; i++) begin
            tr = new();
            if (!tr.randomize()) $fatal("Randomization failed");
            gen2drv.put(tr);
        end
        -> ended;
    endtask
endclass
