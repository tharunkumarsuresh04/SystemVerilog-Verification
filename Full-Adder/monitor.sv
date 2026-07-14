class fa_mon;
  
  virtual fa_intf vintf; 
  
  mailbox #(fa_trans) mon2scb;
  
  function new ( virtual fa_intf vintf, mailbox #(fa_trans) mon2scb);
    
    this.vintf = vintf;
    
    this.mon2scb = mon2scb;
    
  endfunction
  
  
  task run();
    
    fa_trans tx; 
    
    forever begin 
      
      @(vintf.a, vintf.b, vintf.cin);
      
      #1; 
      
      tx = new();
      
      tx.a = vintf.a;
      
      tx.b = vintf.b;
      
      tx.cin = vintf.cin;
      
      tx.sum = vintf.sum;
      
      tx.cout = vintf.cout;
      
      mon2scb.put(tx);
      
    end 
    
  endtask 
  
endclass
      
