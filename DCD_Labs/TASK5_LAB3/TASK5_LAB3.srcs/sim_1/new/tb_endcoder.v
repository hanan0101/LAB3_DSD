`timescale 1ns / 1ps

module tb_encoder_4bit;
    reg [3:0] W;
    reg [7:0] SW;
    wire [2:0] base_index;
    
    priority_encod_4bits dut (
        .SW(SW),
        .W(W),
        .base_index(base_index)
    );

    initial begin
    $display("Time      Input        Window      Index");

    SW = 8'b1111_1010; W = 4'b1010; #10;
    $display("%0t     %08b     %04b      %03b", $time, SW, W, base_index);

    SW = 8'b1110_1010; W = 4'b1010; #10;
    $display("%0t     %08b     %04b      %03b", $time, SW, W, base_index);
    
    SW = 8'b0001_0100; W = 4'b1010; #10;
    $display("%0t     %08b     %04b      %03b", $time, SW, W, base_index);
    
    SW = 8'b1101_0100; W = 4'b1010; #10;
    $display("%0t     %08b     %04b      %03b ", $time, SW, W, base_index);
    
    SW = 8'b1010_1000; W = 4'b1010; #10;
    $display("%0t     %08b     %04b      %03b", $time, SW, W, base_index);
    
    SW = 8'b1010_0000; W = 4'b1010; #10;
    $display("%0t     %08b     %04b      %03b", $time, SW, W, base_index);
    
    SW = 8'b1010_1010; W = 4'b1010; #10;
    $display("%0t     %08b     %04b      %03b", $time, SW, W, base_index);
    
    SW = 8'b1111_1111; W = 4'b1010; #10;
    $display("%0t   |  %08b   |  %04b   |   %03b", $time, SW, W, base_index);
    
    // End simulation
            $finish;
    end
    
endmodule