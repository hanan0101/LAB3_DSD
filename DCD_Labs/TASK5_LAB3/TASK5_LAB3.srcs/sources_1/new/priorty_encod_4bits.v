`timescale 1ns / 1ps

module priority_encod_4bits(
    input [7:0] SW,  // 8 switches
    input [3:0] W,   // 4 bit window pattern to match
    output reg [2:0] base_index  
);
    
always @(*) begin 
    // Default to no match
    base_index = 3'b111;
    
    // Check matches in priority order using direct bit slicing
    if (SW[3:0] == W)
        base_index = 3'b000;
    else if (SW[4:1] == W)
        base_index = 3'b001;
    else if (SW[5:2] == W)
        base_index = 3'b010;
    else if (SW[6:3] == W)
        base_index = 3'b011;
    else if (SW[7:4] == W)
        base_index = 3'b100;
end  

endmodule