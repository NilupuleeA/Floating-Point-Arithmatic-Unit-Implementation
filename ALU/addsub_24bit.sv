`timescale 1ns / 1ps

module addsub_24bit #(
    parameter N = 24
)(
    input logic [N-1:0] A,
    input logic [N-1:0] B,
    input logic c_in,
    output logic [N-1:0] S,
    output logic c_out
);

    logic [N:0] C;
    assign C[0] = c_in;
    assign c_out = C[N];
	 
	 genvar i;

    generate
        for (i = 0; i < N; ++i) begin: add
            full_adder fa(
                .a(A[i]),
                .b(B[i]^c_in),
                .c_in(C[i]),
                .c_out(C[i+1]),
                .sum(S[i])
            );            
        end
    endgenerate
endmodule