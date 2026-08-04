// 7. Scoreboard Class (scoreboard.sv) - UPDATED FOR 1-CYCLE LATENCY
class scoreboard;
    mailbox #(transaction) mon2scb;
    
    // Golden model for what is currently sitting inside the FIFO
    bit [7:0] expected_queue[$]; 
    
    // Pipeline queue to hold expected read data until it appears on the bus
    bit [7:0] check_queue[$];    

    function new(mailbox #(transaction) mon2scb);
        this.mon2scb = mon2scb;
    endfunction

    task main();
        forever begin
            transaction tr;
            mon2scb.get(tr);

            // 1. Evaluate the PREVIOUS cycle's read operation
            // If we scheduled a check in the last cycle, evaluate it against current rdata
            if (check_queue.size() > 0) begin
                bit [7:0] expected_data = check_queue.pop_front();
                if (expected_data === tr.rdata) begin
                    $display("[%0t NS] PASS: Expected = %0h, Actual = %0h", $time, expected_data, tr.rdata);
                end else begin
                    $error("[%0t NS] FAIL: Expected = %0h, Actual = %0h", $time, expected_data, tr.rdata);
                end
            end

            // 2. Emulate Write Operation
            if (tr.wr_en && !tr.full) begin
                expected_queue.push_back(tr.wdata);
            end

            // 3. Emulate Read Operation (Schedule the check for the NEXT cycle)
            if (tr.rd_en && !tr.empty) begin
                // Pop from the golden model now, but push it to the check_queue 
                // so it gets evaluated against tr.rdata on the next clock cycle.
                check_queue.push_back(expected_queue.pop_front());
            end
        end
    endtask
endclass
