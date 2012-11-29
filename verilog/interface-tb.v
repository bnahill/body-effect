module interface_tb();


reg clk;
reg              memwrite;
reg  [7:0] adr, writedata;
wire [7:0] memdata;


dft_block #8 xdft_ (.clk(clk), .memwrite(memwrite), .adr(adr),
                   .writedata(writedata), .memdata(memdata));


always #10 clk = ~clk;

integer i;

initial begin
	$dumpfile("interface-test.lxt2");
	$dumpvars();
	clk = 0;
	memwrite = 0;
	adr = 'h00;
	writedata = 'h00;
	for(i = 0; i < 8; i = i + 1) begin
		@(posedge clk) begin
			memwrite = 1;
			adr = 'hF8 + i;
			writedata = 'hA5 + i;
		end
	end
	for(i = 0; i < 8; i = i + 1) begin
		@(posedge clk) begin
			memwrite = 0;
			adr = 'hF8 + i;
			$display("Addr %02X: %02X", adr, memdata);
		end
	end
	@(posedge clk);
	@(posedge clk);
	$stop;
end

endmodule
