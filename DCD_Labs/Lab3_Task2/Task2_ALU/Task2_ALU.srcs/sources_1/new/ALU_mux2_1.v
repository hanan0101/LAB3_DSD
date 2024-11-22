`timescale 1ns / 1ps

module ALU_mux2_1(
    input logic [3:0] A,      
    input logic [3:0] B,      
    input logic [1:0] alu_op, 
    input logic en,           
    output logic [3:0] alu_out
);
    
    logic [3:0] add_out, sub_out, shift_out, and_out;
    logic [3:0] mux1_out, mux2_out;
    logic s0, en_mux2;
    
    // Basic operations
    assign add_out = A + B;
    assign sub_out = A - B;
    assign shift_out = A << B;
    assign and_out = A & B;
    
    // Control signals
    assign s0 = alu_op[0];
    assign en_mux2 = ~en;  // NOT gate for MUX2 enable
    
    // First multiplexer (MUX1) to select between addition and subtraction
    MUX1 mux1(
        .a(add_out), 
        .b(sub_out), 
        .s0(s0), 
        .en(en),
        .y1(mux1_out)
    );

    // Second multiplexer (MUX2) to select between shift and AND
    MUX2 mux2(
        .c(shift_out), 
        .d(and_out), 
        .s0(s0), 
        .en(en_mux2),
        .y2(mux2_out)
    );

    // Final output
    assign alu_out = mux1_out | mux2_out;

endmodule
