module adder_tb();

integer a, b, c_in;

wire cout;
wire [7:0] sum;

_8bit_LF xadder(
	.A1(a[0]), .A2(a[1]), .A3(a[2]), .A4(a[3]),
	.A5(a[4]), .A6(a[5]), .A7(a[6]), .A8(a[7]),
	.B1(b[0]), .B2(b[1]), .B3(b[2]), .B4(b[3]),
	.B5(b[4]), .B6(b[5]), .B7(b[6]), .B8(b[7]),
	.S1(sum[0]), .S2(sum[1]), .S3(sum[2]), .S4(sum[3]),
	.S5(sum[4]), .S6(sum[5]), .S7(sum[6]), .S8(sum[7]),
	.Cin(c_in[0]), .Cout(cout));

initial begin
for(c_in = 0; c_in < 2; c_in = c_in+1) begin
	for(a = 0; a < 256; a = a + 1) begin
		for(b = 0; b < 256; b = b +1) begin
			#1;
			if(sum[7:0] !== a[7:0] + b[7:0] + c_in[0]) begin
				$display("0x%02X + 0x%02X = 0x%02X", a, b, sum);
				$display("Error!");
				$stop;
			end
			
		end
	end
end
$display("Completed successfully");
end

endmodule
