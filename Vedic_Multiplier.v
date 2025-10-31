// Half Adder using gate-level modeling
module half_adder(input a, input b, output sum, output carry);
    xor(sum, a, b);
    and(carry, a, b);
endmodule

// Full Adder using gate-level modeling
module full_adder(input a, input b, input cin, output sum, output carry);
    wire s1, c1, c2;

    xor(s1, a, b);
    xor(sum, s1, cin);
    and(c1, a, b);
    and(c2, s1, cin);
    or(carry, c1, c2);
endmodule

// 2x2 Vedic Multiplier using gate-level modeling
module vedic_2x2(input [1:0] a, input [1:0] b, output [3:0] p);
    wire w0, w1, w2, w3;
    wire s1, c1;

    and(w0, a[0], b[0]);
    and(w1, a[1], b[0]);
    and(w2, a[0], b[1]);
    and(w3, a[1], b[1]);

    half_adder ha1(.a(w1), .b(w2), .sum(s1), .carry(c1));

    assign p[0] = w0;
    assign p[1] = s1;

    wire s2, c2;
    half_adder ha2(.a(c1), .b(w3), .sum(s2), .carry(c2));

    assign p[2] = s2;
    assign p[3] = c2;
endmodule

// 4x4 Vedic Multiplier using 2x2 multipliers
module vedic_4x4(input [3:0] a, input [3:0] b, output [7:0] p);
    wire [3:0] m0, m1, m2, m3;
    wire [7:0] temp1, temp2, temp3;

    vedic_2x2 u0(.a(a[1:0]), .b(b[1:0]), .p(m0));
    vedic_2x2 u1(.a(a[3:2]), .b(b[1:0]), .p(m1));
    vedic_2x2 u2(.a(a[1:0]), .b(b[3:2]), .p(m2));
    vedic_2x2 u3(.a(a[3:2]), .b(b[3:2]), .p(m3));

    assign temp1 = {4'b0000, m0};
    assign temp2 = temp1 + ({4'b0000, m1} << 2);
    assign temp3 = temp2 + ({4'b0000, m2} << 2);
    assign p = temp3 + ({4'b0000, m3} << 4);
endmodule

// 8x8 Vedic Multiplier using 4x4 multipliers
module vedic_8x8_comb(input [7:0] a, input [7:0] b, output [15:0] p);
    wire [7:0] m0, m1, m2, m3;
    wire [15:0] temp1, temp2, temp3;

    vedic_4x4 u0(.a(a[3:0]), .b(b[3:0]), .p(m0));
    vedic_4x4 u1(.a(a[7:4]), .b(b[3:0]), .p(m1));
    vedic_4x4 u2(.a(a[3:0]), .b(b[7:4]), .p(m2));
    vedic_4x4 u3(.a(a[7:4]), .b(b[7:4]), .p(m3));

    assign temp1 = {8'b0, m0};
    assign temp2 = temp1 + ({8'b0, m1} << 4);
    assign temp3 = temp2 + ({8'b0, m2} << 4);
    assign p = temp3 + ({8'b0, m3} << 8);
endmodule

// Top-level project module with clocked output
module project(
    input clk,
    input [7:0] a,
    input [7:0] b,
    output reg [15:0] p
);
    wire [15:0] product;
    vedic_8x8_comb vm(.a(a), .b(b), .p(product));

    always @(posedge clk) begin
        p <= product;
    end
endmodule
