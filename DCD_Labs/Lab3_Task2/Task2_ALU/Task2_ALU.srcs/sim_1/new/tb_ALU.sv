`timescale 1ns / 1ps

module tb_ALU;
    // Testbench signals
    logic [3:0] A, B;
    logic [1:0] alu_op;
    logic en;
    logic [3:0] alu_out;

    // Instantiate the ALU module
    ALU dut(
        .A(A),
        .B(B),
        .alu_op(alu_op),
        .en(en),
        .alu_out(alu_out)
    );
    
    // Monitor block to display changes
    initial begin
        $monitor("Time=%0t A=%4b B=%4b operation=%2b enable=%1b alu_out=%4b", 
                 $time, A, B, alu_op, en, alu_out);
    end
    
    initial begin
     
        A = 4'b0101;  // 5
        B = 4'b0011;  // 3
        alu_op = 2'b00;
        en = 0;
        #10;
        
     
        A = 4'b1000;  // 8
        B = 4'b0011;  // 3
        alu_op = 2'b01;
        en = 0;
        #10;

    
        A = 4'b1100;  // 12
        B = 4'b1010;  // 10
        alu_op = 2'b10;
        en = 1;
        #10;
    
        A = 4'b0011;  // 3
        B = 4'b0001;  // Shift left by 1
        alu_op = 2'b11;
        en = 1;
        #10;
        
      
        A = 4'b1111;
        B = 4'b1111;
        alu_op = 2'b00;
        en = 1;
        #10;
        
        $finish;
    end

endmodule