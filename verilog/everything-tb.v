module everything_tb();

localparam WIDTH = 8;

reg clk;
// Do a write
reg write;
// Address sent to memories
reg [WIDTH-1:0] adr;
// Data to write to memories
reg [WIDTH-1:0] write_data;

// Data coming back to CPU
wire [WIDTH-1:0] read_data;

// Data coming from FFT and memory
wire [WIDTH-1:0] fft_data, mem_data;

// Signals from decoder to memories to indicate matching range
wire fft_adr_match, mem_adr_match;

// Write signals sent to their correct memory
wire fft_write, mem_write;

memterceptor xmemterceptor(
	.ADR(adr),
	.FFT_DATA(fft_data),
	.MEM_DATA(mem_data),
	.WRITE(write),
	.ADR_IS_FFT(fft_adr_match),
	.ADR_IS_MEM(mem_adr_match), 
    .FFT_WRITE(fft_write),
    .MEM_WRITE(mem_write),
    .READ_DATA(read_data)
);
    
exmemory #(8) xmemory(
	.clk(clk),
	.memwrite(mem_write),
	.adr(adr),
	.writedata(write_data),
	.memdata(mem_data)
);

topFFT xtopFFT(
	.phi1(clk),
	.phi2(~clk),
	.DATA_IN(write_data),
	.DATA_OUT(fft_data),
	.WRITE(fft_write),
	.ADR(adr[2:0]),
	.ADR_MATCH(fft_adr_match)
);

always #10 clk = ~clk;

integer i;
integer error;
reg [7:0] fft_vectors [15:0];

initial begin
	clk = 0;
	write = 0;
	adr = 0;
	write_data = 0;
	error = 0;
	$readmemh("fft_vectors.txt", fft_vectors);
	
	for(i = 0; i < 248; i = i + 1) begin
		@(posedge clk);
		adr <= 'h00 + i;
		write <= 1;
		write_data <= 'h00 + i;
	end
	
	for(i = 0; i < 248; i = i + 1) begin
		@(posedge clk);
		adr <= 'h00 + i;
		write <= 0;
		write_data <= 'h00 + i;
		@(posedge clk);
		if(read_data !== adr) begin
			$display("Error! Expecting 0x%02X, got 0x%02X", adr, read_data);
			error = 1;
		end
	end
	
	if(error == 0) begin
		$display("Memory test passed successfully");
	end else begin
		$display("Errors were encountered in memory test");
	end
	
	error = 0;
	
	for(i = 0; i < 8; i = i + 1) begin
		@(posedge clk);
		adr <= 'hF8 + i;
		write <= 1;
		write_data <= fft_vectors[i];
	end
	
	for(i = 0; i < 8; i = i + 1) begin
		@(posedge clk);
		adr <= 'hF8 + i;
		write <= 0;
		@(negedge clk);
		if(read_data != fft_vectors[8+i]) begin
			$display("Error! Expecting 0x%02X, got 0x%02X", fft_vectors[8+i], read_data);
			error = 1;
		end
	end
	
	if(error == 0) begin
		$display("FFT test passed successfully");
	end else begin
		$display("Errors were encountered in FFT test");
	end
	
	$display("Test completed");
	
	$stop;
end



endmodule
