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
        rstn = 0;
        num1 = 0;
        num2 = 0;

        #20; 
        rstn = 1;

        // @(posedge clk);
        // num1 <= 32'b10111111100011001100110011001101;
        // num2 <= 32'b01000010110010000000000000000000;
        // op <= 0;
        
        // repeat (10) 
        // #15 check_output(S, 32'b01000010110001011100110011001101);       
        // //01000011000101101100011100010001

        // @(posedge clk);
        // num1 <= 32'b00111111100011001100110011001101;
        // num2 <= 32'b01000010110010000000000000000000;
        // op <= 0;
        // repeat (10) 
        // #15 check_output(S, 32'b01000010110010100011001100110011);

        @(posedge clk);
        num1 <= 32'b00111111100011100001010001111011;
        num2 <= 32'b01000001001001010100011110101110;
        
        repeat (10) 
        #15 check_output(S, 32'b01000001001101110111010111110111);       
        //01000011000101101100011100010001

        // @(posedge clk);
        // num1 <= 32'b11000001001000011100001010001111;
        // num2 <= 32'b00111111100011100001010001111011;

        // repeat (10) 
        // #15 check_output(S, 32'b11000001001100111000010100011110);

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
