module MUX1(
    input logic [3:0] A,
    input logic [3:0] B,
    input logic s0,
    input logic en,
    output logic [3:0] y1
);

    always_comb begin
        if (en==0) begin 
            if (s0 == 0)
                y1 = A + B;    // Addition
            else if(s0==1)
                y1 = A - B;    // Subtraction
        end else begin
            y1 = 4'b0000; // Default or invalid state
        end
    end
endmodule