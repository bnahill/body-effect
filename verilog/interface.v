module dft_block #(parameter WIDTH = 8)
                 (input              clk,
                  input              memwrite,
                  input  [WIDTH-1:0] adr, writedata,
                  output reg [WIDTH-1:0] memdata);

wire [7:0] regselect;

wire [7:0] dft_out;
//reg [WIDTH-1:0] memdata;
wire [7:0] Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7;

//decoder #(WIDTH) xdecoder (.a(adr), .enable(regselect));
decoder8 xdecoder (.A(adr), .EN(regselect));
dft #(WIDTH) xdft (.X0(writedata), .X1(writedata), 
                   .X2(writedata), .X3(writedata),
                   .X4(writedata), .X5(writedata),
                   .X6(writedata), .X7(writedata),
                   .Y0(Y0), .Y1(Y1),
                   .Y2(Y2), .Y3(Y3),
                   .Y4(Y4), .Y5(Y5),
                   .Y6(Y6), .Y7(Y7),
                   .write(memwrite),
                   .enable(regselect),
                   .phi1(clk), .phi2(~clk));

// This is a mux. That's 8 8-input muxes.
always @(adr)
case (adr[2:0])
	0: memdata = Y0;
	1: memdata = Y1;
	2: memdata = Y2;
	3: memdata = Y3;
	4: memdata = Y4;
	5: memdata = Y5;
	6: memdata = Y6;
	7: memdata = Y7;
endcase

endmodule


module dft #(parameter WIDTH = 8)
            (input phi1, phi2,
             input  [WIDTH-1:0] X0, X1, X2, X3, X4, X5, X6, X7,
             input  [7:0] enable,
             input write,
             output [WIDTH-1:0] Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7);

reg [WIDTH-1:0] in_reg0, in_reg1, in_reg2, in_reg3,
                in_reg4, in_reg5, in_reg6, in_reg7;
reg [WIDTH-1:0] out_reg0, out_reg1, out_reg2, out_reg3,
                out_reg4, out_reg5, out_reg6, out_reg7;

assign Y0 = out_reg0;
assign Y1 = out_reg1;
assign Y2 = out_reg2;
assign Y3 = out_reg3;
assign Y4 = out_reg4;
assign Y5 = out_reg5;
assign Y6 = out_reg6;
assign Y7 = out_reg7;

integer i;
always @(posedge phi1) begin
	out_reg0 <= in_reg0;
	out_reg1 <= in_reg1;
	out_reg2 <= in_reg2;
	out_reg3 <= in_reg3;
	out_reg4 <= in_reg4;
	out_reg5 <= in_reg5;
	out_reg6 <= in_reg6;
	out_reg7 <= in_reg7;
end

always @(posedge phi1) begin
	if(write & enable[0]) in_reg0 <= X0;
	if(write & enable[1]) in_reg1 <= X1;
	if(write & enable[2]) in_reg2 <= X2;
	if(write & enable[3]) in_reg3 <= X3;
	if(write & enable[4]) in_reg4 <= X4;
	if(write & enable[5]) in_reg5 <= X5;
	if(write & enable[6]) in_reg6 <= X6;
	if(write & enable[7]) in_reg7 <= X7;
end	

endmodule


module decoder #(parameter WIDTH = 8)
               (input [WIDTH-1:0] a,
                output [WIDTH-1:0] enable);

wire oe;
wire noe;

wire [WIDTH-1:0] na;
wire [WIDTH-1:0] en_int;

assign na = ~a;

assign oe = (a[7] & a[6]) & a[5] & (a[4] & a[3]);


assign en_int[0] = ~(a[2] | a[1] | a[0]);
assign en_int[1] = ~(a[2] | a[1]) & a[0];
assign en_int[2] = ~(a[2] | a[0]) & a[1];
assign en_int[3] = na[2] & ~(na[1] | na[0]);
assign en_int[4] = a[2] & ~(a[1] | a[0]);
assign en_int[5] = ~(na[2] | na[0]) & na[1];
assign en_int[6] = ~(na[2] | na[1]) & na[0];
assign en_int[7] = a[2] & a[1] & a[0];

assign enable = {en_int[7] & oe, en_int[6] & oe,
                 en_int[5] & oe, en_int[4] & oe,
                 en_int[3] & oe, en_int[2] & oe,
                 en_int[1] & oe, en_int[0] & oe};

endmodule
