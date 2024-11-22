module sev_seg_top(
    input wire CLK100MHZ,
    input wire CPU_RESETN,
    output wire CA, CB, CC, CD, CE, CF, CG, DP,
    output wire [7:0] AN,
    input wire [15:0] SW
);
    logic reset_n;
    logic clk;

    logic [3:0] A, B;        // Inputs from switches
    logic [1:0] op;          // Operation selector
    logic [3:0] out;         // ALU output
    logic en;

    assign reset_n = CPU_RESETN;
    assign clk = CLK100MHZ;

    // Assign SW values to variables
    assign A = SW[3:0];
    assign B = SW[7:4];
    assign op = SW[13:12];   // Using SW[13:12] for op
    assign en = SW[14];       // Enable signal

    // Seven segments controller
    wire [6:0] Seg;
    wire [3:0] digits[0:7];

    assign digits[0] = A;        // A
    assign digits[1] = B;        // B
    assign digits[2] = out;      // Output
    assign digits[3] = 4'b1111;  // Unused
    assign digits[4] = 4'b1111;  // Unused
    assign digits[5] = 4'b1111;  // Unused
    assign digits[6] = 4'b1111;  // Unused
    assign digits[7] = 4'b1111;  // Unused

    sev_seg_controller ssc(
        .clk(clk),
        .resetn(reset_n),
        .digits(digits),
        .Seg(Seg),
        .AN(AN)
    );

    /*
    / Instantiate ALU
    ALU alu( 
        .A(A),      
        .B(B),      
        .op(op), 
        .en(en),           
        .out(out)
    );*/

    assign CA = Seg[0];
    assign CB = Seg[1];
    assign CC = Seg[2];
    assign CD = Seg[3];
    assign CE = Seg[4];
    assign CF = Seg[5];
    assign CG = Seg[6];
    assign DP = 1'b1; // Turn off the dot point on seven segments

endmodule : sev_seg_top