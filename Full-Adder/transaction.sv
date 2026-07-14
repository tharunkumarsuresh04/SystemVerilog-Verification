class fa_trans; 
  
  rand bit a; 
  rand bit b; 
  rand bit cin; 
  
  
  bit sum; 
  bit cout;
  

  function fa_trans do_copy();
    
    fa_trans copy = new();
    
    copy.a = this.a;
    copy.b = this.b;
    copy.cin = this.cin;
    copy.sum = this.sum;
    copy.cout = this.cout;
    
    return copy;
    
  endfunction
  
endclass
    
