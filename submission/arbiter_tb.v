`timescale 1ns/1ps

module arbiter_tb;

    reg clk, rst, ready;
    reg [3:0] req;
    wire [3:0] grant;

    integer errors;

    starvation_aware_arbiter #(
        .N(4),
        .AGE_WIDTH(4),
        .AGE_THRESHOLD(3)
    ) dut (
        .clk(clk),
        .rst(rst),
        .ready(ready),
        .req(req),
        .grant(grant)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("sim/arbiter.vcd");
        $dumpvars(0, arbiter_tb);

        clk = 0;
        rst = 1;
        ready = 0;
        req = 0;
        errors = 0;

        repeat (2) @(posedge clk);
        @(negedge clk);
        rst = 0;

        // Test 1: no requests.
        req = 4'b0000;
        ready = 1;
        #1;
        if (grant !== 4'b0000) begin
            $display("FAIL: idle grant=%b", grant);
            errors = errors + 1;
        end else
            $display("PASS: idle");

        // Test 2: requester 0 waits while the resource is busy.
        ready = 0;
        req = 4'b0001;
        repeat (4) @(posedge clk);

        // Requester 1 arrives later; requester 0 is older.
        @(negedge clk);
        req = 4'b0011;
        #1;
        if (grant !== 4'b0000) begin
            $display("FAIL: grant should be zero when ready=0");
            errors = errors + 1;
        end

        // Once ready, the older requester should win.
        ready = 1;
        #1;
        if (grant !== 4'b0001) begin
            $display("FAIL: expected older requester 0, grant=%b", grant);
            errors = errors + 1;
        end else
            $display("PASS: older requester wins, grant=%b", grant);

        @(posedge clk);
        #1;

        // The next accepted grant should allow round-robin progress.
        @(negedge clk);
        req = 4'b0011;
        ready = 1;
        #1;
        if ((grant != 4'b0001) && (grant != 4'b0010)) begin
            $display("FAIL: invalid one-hot grant=%b", grant);
            errors = errors + 1;
        end else
            $display("PASS: valid grant=%b", grant);

        if (errors == 0)
            $display("ALL TESTS PASSED");
        else
            $display("TESTS FAILED: %0d error(s)", errors);

        #10;
        $finish;
    end

endmodule
