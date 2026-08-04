class transaction;
    rand bit wr_en;
    rand bit rd_en;
    rand bit [7:0] wdata;
    bit [7:0] rdata;
    bit full;
    bit empty;

    // Custom constraints for better traffic generation
    constraint wr_rd_ctrl {
        wr_en dist {1 := 50, 0 := 50};
        rd_en dist {1 := 50, 0 := 50};
        !(wr_en == 0 && rd_en == 0); // Avoid idle cycles to speed up testing
    }
endclass
