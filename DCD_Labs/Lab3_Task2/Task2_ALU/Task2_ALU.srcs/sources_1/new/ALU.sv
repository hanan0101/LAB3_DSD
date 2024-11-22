module ALU(
    input logic [3:0] A,
    input logic [3:0] B,
    input logic [1:0] op,
    input logic en,
    output logic [3:0] out
);
   
    logic [3:0] mux1_out, mux2_out;
    logic s0, s1;
    logic en_mux2;

    // Select lines for multiplexers
    assign s0 = op[0]; // For MUX1 //sw 12
    assign s1 = op[1]; // For MUX2  //sw 13
    assign en_mux2 = ~en; // Inverting enable for MUX2

    // Instantiate MUX1 for addition and subtraction
    MUX1 mux1(
        .A(A),
        .B(B),
        .s0(s0),
        .en(en),
        .y1(mux1_out)
    );

    // Instantiate MUX2 for shifting and AND
    MUX2 mux2(
        .A(A),
        .B(B),
        .s1(s1),
        .en(en_mux2),
        .y2(mux2_out)
    );

    // Combine outputs with OR
    assign out = mux1_out | mux2_out;

endmodule