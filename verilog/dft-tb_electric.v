/*
 dft-tb_electric.v
 
 Automated testbench for DFT block
 Vectors are provided in dft_vectors.txt
*/

module dft_testbench();
	reg clk;
	integer i, j;
	reg [7:0] in [7:0];
	wire [7:0] X0;
	wire [7:0] Y0;
	wire [7:0] X1;
	wire [7:0] Y1;
	wire [7:0] X2;
	wire [7:0] Y2;
	wire [7:0] X3;
	wire [7:0] Y3;
	wire [7:0] X4;
	wire [7:0] Y4;
	wire [7:0] X5;
	wire [7:0] Y5;
	wire [7:0] X6;
	wire [7:0] Y6;
	wire [7:0] X7;
	wire [7:0] Y7;
	assign X0 = in[0];
	assign X1 = in[1];
	assign X2 = in[2];
	assign X3 = in[3];
	assign X4 = in[4];
	assign X5 = in[5];
	assign X6 = in[6];
	assign X7 = in[7];
	integer error;

	reg [7:0] vectors[63:0];

	initial clk = 0;

	always #10000 clk = ~clk;


FFT xFFT(.phi1(clk), .phi2(~clk),
	.X0(X0), .Y0(Y0),
	.X1(X1), .Y1(Y1),
	.X2(X2), .Y2(Y2),
	.X3(X3), .Y3(Y3),
	.X4(X4), .Y4(Y4),
	.X5(X5), .Y5(Y5),
	.X6(X6), .Y6(Y6),
	.X7(X7), .Y7(Y7),
	.phi2_X0(~clk), .phi2_X1(~clk), .phi2_X2(~clk), .phi2_X3(~clk), .phi2_X4(~clk), .phi2_X5(~clk), .phi2_X6(~clk), 
      .phi2_X7(~clk));

initial begin
	$readmemh("dft_vectors.txt", vectors);
	error = 0;
	@(posedge clk);
	for(i = 0; i < 8; i = i + 1) begin

		for(j = 0; j < 8; j = j + 1) begin
			in[j] <= vectors[8*i + j];
		end

		@(posedge clk);
		@(posedge clk);

		$display("Y0: %02X", Y0);
		if(Y0 !== (X0 + X4) + (X2 + X6)) begin
			error = error + 1; $display("Error!");
		end
		$display("Y1: %02X", Y1);
		if(Y1 !== (X1 + X5) + (X3 + X7)) begin
			error = error + 1; $display("Error!");
		end
		$display("Y2: %02X", Y2);
		if(Y2 !== (X0 - X4) + (X2 - X6)) begin
			error = error + 1; $display("Error!");
		end
		$display("Y3: %02X", Y3);
		if(Y3 !== (X1 - X5) - (X3 - X7)) begin
			error = error + 1; $display("Error!");
		end
		$display("Y4: %02X", Y4);
		if(Y4 !== (X0 + X4) - (X2 + X6)) begin
			error = error + 1; $display("Error!");
		end
		$display("Y5: %02X", Y5);
		if(Y5 !== (X1 + X5) - (X3 + X7)) begin
			error = error + 1; $display("Error!");
		end
		$display("Y6: %02X", Y6);
		if(Y6 !== (X0 - X4) - (X2 - X6)) begin
			error = error + 1; $display("Error!");
		end
		$display("Y7: %02X", Y7);
		if(Y7 !== (X1 - X5) + (X3 - X7)) begin
			error = error + 1; $display("Error!");
		end
	end
	
	$display("Simulation completed");
	if(error > 0) begin
		$display("Errors were encountered :{");
	end else begin
		$display("All tests passed successfully :]");
	end

	$stop;
end
endmodule
