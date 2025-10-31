
module testbench;

    // Inputs
    reg clk;
    reg [7:0] a;
    reg [7:0] b;

    // Output
    wire [15:0] p;

    // Instantiate the Unit Under Test (UUT)
    project uut (
        .clk(clk),
        .a(a),
        .b(b),
        .p(p)
    );

    // Clock generation
    always #5 clk = ~clk; // 100 MHz clock

    initial begin
        // Initialize inputs
        clk = 0;
        a = 0;
        b = 0;

        // Wait for global reset
        #10;

        // Test case 1: 15 x 10 = 150
        a = 8'd15;
        b = 8'd10;
        #10; // Wait for posedge clk

        // Test case 2: 255 x 255 = 65025
        #10;
        a = 8'd255;
        b = 8'd255;
        #10;

        // Test case 3: 100 x 25 = 2500
        #10;
        a = 8'd100;
        b = 8'd25;
        #10;

        // Test case 4: 0 x 123 = 0
        #10;
        a = 8'd0;
        b = 8'd123;
        #10;

        // Test case 5: 1 x 200 = 200
        #10;
        a = 8'd1;
        b = 8'd200;
        #10;

        // End simulation
        #20;
        $finish;
    end

    // Monitor values
    initial begin
        $monitor("Time=%0d, a=%d, b=%d, p=%d", $time, a, b, p);
    end

endmodule
