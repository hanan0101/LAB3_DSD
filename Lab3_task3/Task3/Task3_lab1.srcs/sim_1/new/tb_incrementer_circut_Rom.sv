`timescale 1ns / 1ps

module tb_incrementer_circut_Rom;
       reg [3:0] in; 
       wire [3:0] out;
       
       
       //instance 
       incrementer_circuit_ROM sim_rom(
          .in(in),
          .out(out)
          
       );
   initial begin 
   
           in= 4'b0000;#10
           in= 4'b0001;#10
           in= 4'b0010;#10
           in= 4'b0011;#10
           in= 4'b0100;#10
           in= 4'b0101;#10
           in= 4'b0110;#10
           in= 4'b0111;#10
           in= 4'b1000;#10
           in= 4'b1001;#10
           in= 4'b1010;#10
           in= 4'b1011;#10
           in= 4'b1100;#10
           in= 4'b1101;#10
           in= 4'b1110;#10
           in= 4'b1111;#10
     $display("decimal input =%d ---deciml output %d",in,out);
     $display("decimal input =(%b) ---binary ouput=(%b)",in,out);
   
   end 
endmodule
