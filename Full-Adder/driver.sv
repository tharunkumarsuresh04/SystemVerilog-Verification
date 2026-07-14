class fa_drv;
  
  virtual fa_intf vintf;
  
  mailbox#(fa_trans) gen2drv; 
  
  function new(virtual fa_intf vintf, mailbox#(fa_trans) gen2drv);
    
    this.vintf = vintf;
    
    this.gen2drv = gen2drv;
    
  endfunction 
  
  task run();
    
    fa_trans tx;
    
    forever begin 
      
      gen2drv.get(tx);
      
      vintf.a = tx.a;
      
      vintf.b = tx.b;
      
      vintf.cin = tx.cin;

      #10;
      
    end
    
  endtask 
  
  
endclass
    
    
