`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.10.2024 15:47:30
// Design Name: 
// Module Name: radix_4_tb
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


module radix_4_tb();
    localparam CLK_PERIOD = 10;
    logic clk, rstn = 0;
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk <= ~clk;
    end

    localparam N = 12;

    logic [N-1:0] M;
    logic [N-1:0] Q;
    logic [2*N-1:0] R;

    //exponet_diff step1(.*);
    radix_4 dut(.*);

    initial begin
        M <= 12'b1110001;
        Q <= 12'b1001;
        rstn <= 0;

        @(posedge clk);
        rstn <=1;
        
        
        repeat (10) 
        #15 check_output(R, 12'd21);       
        //01000011000101101100011100010001

//        @(posedge clk);
//        M <= 24'b11000001001000011100001010001111;

//        repeat (10) 
//        #15 check_output(R, 24'b11000001001100111000010100011110);
    end

    task check_output;
         input [11:0] actual;
         input [11:0] expected;
         if (actual !== expected) begin
             $display("Test Failed: Expected %h, but got %h", expected, actual);
         end else begin
             $display("Test Passed: Output %h matches expected %h", actual, expected);
         end
    endtask
endmodule
