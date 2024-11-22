module MUX2(
    input logic [3:0] A,
    input logic [3:0] B,
    input logic s1,
    input logic en,
    output logic [3:0] y2
);

    always_comb begin
        if (en==1) begin 
            if (s1 == 0)
                y2 = A << B;    // Shift left
            else if (s1==1)
                y2 = A & B;     // AND operation
        end else begin
            y2 = 4'b0000; // Default or invalid state
        end
    end
endmodule