module fifo_tb;
<<<<<<< HEAD
   localparam DATA_WIDTH = 8;
    // Inputs
    reg [0:0] clk;
    reg [0:0] rst;
    reg [0:0] wrhvvh;
    reg [31:0] din;
    reg [0:0] rd;

    // Outputs
    wire [0:0] full;
    wire [0:0] empty;
    wire [31:0] dout;

=======
   localparam DATA_WIDTH = 32;

	// Inputs
	reg [0:0] clk;
	reg [0:0] rst;
	reg [0:0] wr;
	reg [31:0] din;
	reg [0:0] rd;

	// Outputs
	wire [0:0] full;
	wire [0:0] empty;
	wire [31:0] dout;
  
>>>>>>> d330b56377103e675c8ee0c701942a998b6882b3
   reg [DATA_WIDTH - 1:0] src [0:1023];
    
     reg valid;
     reg error;
<<<<<<< HEAD
    integer wr_cnt;
    integer rd_cnt;
    // Instantiate the Unit Under Test (UUT)
    fifo_wrapper uut (
        .clk(clk), 
        .rst(rst), 
        .full(full), 
        .wr(wr), 
        .din(din), 
        .empty(empty), 
        .rd(rd), 
        .dout(dout)
    );

    initial begin

        // $dumpfile("dump.vcd");
        // $dumpvars(1,fifo_tb);

=======
    integer wr_cnt; 
    integer rd_cnt;
	// Instantiate the Unit Under Test (UUT)
	fifo #(
        .DATA_WIDTH                     (DATA_WIDTH)
        ,.LOOKAHEAD                     (1)
    )	uut (
		.clk(clk), 
		.rst(rst), 
		.full(full), 
		.wr(wr), 
		.din(din), 
		.empty(empty), 
		.rd(rd), 
		.dout(dout)
	);

	 initial begin
>>>>>>> d330b56377103e675c8ee0c701942a998b6882b3
        // Initialize Inputs
        clk = 0;
        rst = 1'b1;
        wr = 1;
        din = 0;
        rd = 0;
        src[0] = 'h5A;
        src[1] = 'hF6;
        src[2] = 'h09;
        src[3] = 'hC4;
        src[4] = 'h81;
        src[5] = 'hE2;
        src[6] = 'hA0;
        src[7] = 'h7A;
<<<<<<< HEAD
        clk =0;
        $display("src[0] = %d", src[0]); 
        $display("src[1] = %d", src[1]);
        $display("src[2] = %d", src[2]);
        $display("src[3] = %d", src[3]);
        $display("src[4] = %d", src[4]);              
        $display("src[5] = %d", src[5]);
        $display("src[6] = %d", src[6]);
        $display("src[7] = %d", src[7]);
=======
          clk =0;
           $display("src[0] = %d", src[0]); 
           $display("src[1] = %d", src[1]);
           $display("src[2] = %d", src[2]);
           $display("src[3] = %d", src[3]);
           $display("src[4] = %d", src[4]);           
           $display("src[5] = %d", src[5]);
                         $display("src[6] = %d", src[6]);
                                        $display("src[7] = %d", src[7]);
>>>>>>> d330b56377103e675c8ee0c701942a998b6882b3
        // Wait 100 ns for global reset to finish
        #10;
        rst = 1'b0;        
        // Add stimulus here

               #100000;
        $display("[TIMEOUT]");
        $finish;
 
    end
     always #5 clk = ~clk;
      always @(*) begin
<<<<<<< HEAD
      din = src[wr_cnt];
       wr = (src[wr_cnt] !== {DATA_WIDTH{1'bx}});
      end
         always @(posedge clk) begin
        if (rst) begin
            wr_cnt = 0;
            rd_cnt = 0;
            valid = 'b0;
            rd = 'b0;
            error = 'b0;
        end else begin
            if (!full && src[wr_cnt] !== {DATA_WIDTH{1'bx}}) begin
                wr_cnt = wr_cnt + 1;
=======
      din <= src[wr_cnt];
       wr <= (src[wr_cnt] !== {DATA_WIDTH{1'bx}});
      end
         aliways @(posedge clk) begin
        if (rst) begin
            wr_cnt <= 0;
            rd_cnt <= 0;
            valid <= 'b0;
            rd <= 'b0;
            error <= 'b0;
        end else begin
            if (!full && src[wr_cnt] !== {DATA_WIDTH{1'bx}}) begin
                wr_cnt <= wr_cnt + 1;
>>>>>>> d330b56377103e675c8ee0c701942a998b6882b3
            end

            valid <= !empty && rd;

            if (valid) begin
                if (src[rd_cnt] !== dout) begin
<<<<<<< HEAD
                    error <= 1'b1;
                    $display("s time is ",$stime); 
                    $display("[ERROR] output No. %d %d != %d", rd_cnt, dout, src[rd_cnt]);
                end
                rd_cnt = rd_cnt + 1;
            end

            rd = $urandom_range(0,1);
=======
                                    error <= 'b1;
                                     $display("s time is ",$stime); 
                           $display("[ERROR] output No. %d %d != %d", rd_cnt, dout, src[rd_cnt]);
                          end
                rd_cnt <= rd_cnt + 1;
            end

            rd <= $random() % 2 == 0;
>>>>>>> d330b56377103e675c8ee0c701942a998b6882b3

            if (src[rd_cnt] === {DATA_WIDTH{1'bx}}) begin
                if (error) begin
                    $display("[FAIL]");
                end else begin
                    $display("[PASS]");
                end
                $finish;
            end
        end
    end
<<<<<<< HEAD
endmodule
=======
      
endmodule

>>>>>>> d330b56377103e675c8ee0c701942a998b6882b3
