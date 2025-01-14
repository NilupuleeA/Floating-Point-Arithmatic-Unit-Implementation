`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.09.2024 18:06:58
// Design Name: 
// Module Name: fp_mul_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fp_mul_tb();
    localparam CLK_PERIOD = 10;
    logic clk, rstn;
    
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk = ~clk; 
    end

    logic [31:0] num1;
    logic [31:0] num2;
    logic [31:0] S;

    fp_mul dut (.*);

    initial begin
        rstn <= 0;
        num1 <= 32'b00111110100111101011100001010010;
        num2 <= 32'b00111111100011110101110000101001;
        @(posedge clk);
        rstn <=1;
        
        repeat (10) 
        #15 check_output(S, 32'b00111110101100011100010000110011);       
        
        repeat (10) 
        @(posedge clk);
        num1 <= 32'b00111111100110101110000101001000;
        num2 <= 32'b00111111100000010100011110101110;

        repeat (10) 
        #15 check_output(S, 32'b00111111100111000110110111000110);

    end

     task check_output;
         input [31:0] actual;
         input [31:0] expected;
         if (actual !== expected) begin
             $display("Test Failed: Expected %h, but got %h", expected, actual);
         end else begin
             $display("Test Passed: Output %h matches expected %h", actual, expected);
         end
     endtask
endmodule
