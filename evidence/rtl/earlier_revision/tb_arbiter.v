`timescale 1ns/1ps
module tb_arbiter;
    parameter N = 4;
    parameter AGE_THRESHOLD = 8;
    parameter AGING_EN = 1;
    parameter MAX_WAIT_BOUND = AGE_THRESHOLD + N + 2;

    reg clk = 0, rst = 1;
    reg  [N-1:0] req = 0;
    wire [N-1:0] grant;

    starvation_aware_arbiter #(.N(N), .AGE_THRESHOLD(AGE_THRESHOLD), .AGING_EN(AGING_EN)) dut (
        .clk(clk), .rst(rst), .req(req), .grant(grant)
    );

    always #5 clk = ~clk;

    integer wait_cnt [0:N-1];
    integer max_wait [0:N-1];
    integer grant_cnt [0:N-1];
    integer errors = 0;
    integer i, cyc;

    initial begin
        for (i = 0; i < N; i = i + 1) begin
            wait_cnt[i] = 0; max_wait[i] = 0; grant_cnt[i] = 0;
        end
    end

    always @(negedge clk) if (!rst) begin
        if ((grant & (grant - 1)) != 0) begin
            $display("ERROR t=%0t: grant not one-hot: %b", $time, grant);
            errors = errors + 1;
        end
        if ((grant & ~req) != 0) begin
            $display("ERROR t=%0t: grant %b to non-requester (req=%b)", $time, grant, req);
            errors = errors + 1;
        end
        if ((|req) && (grant == 0)) begin
            $display("ERROR t=%0t: idle grant while req=%b", $time, req);
            errors = errors + 1;
        end
        for (i = 0; i < N; i = i + 1) begin
            if (req[i] && grant[i]) begin
                grant_cnt[i] = grant_cnt[i] + 1;
                if (wait_cnt[i] > max_wait[i]) max_wait[i] = wait_cnt[i];
                wait_cnt[i] = 0;
            end else if (req[i]) begin
                wait_cnt[i] = wait_cnt[i] + 1;
                if (wait_cnt[i] > max_wait[i]) max_wait[i] = wait_cnt[i];
                if (wait_cnt[i] > MAX_WAIT_BOUND) begin
                    $display("ERROR t=%0t: requester %0d waited %0d cycles (bound %0d)",
                             $time, i, wait_cnt[i], MAX_WAIT_BOUND);
                    errors = errors + 1;
                end
            end else wait_cnt[i] = 0;
        end
    end

    initial begin
        $dumpfile("sim/arbiter.vcd");
        $dumpvars(0, tb_arbiter);

        repeat (3) begin @(posedge clk); #1; end
        rst = 0;

        // Test 1: single requesters
        for (i = 0; i < N; i = i + 1) begin
            @(posedge clk); #1; req = (1 << i);
            repeat (3) begin @(posedge clk); #1; end
        end
        req = 0; repeat (2) begin @(posedge clk); #1; end

        // Test 2: all request, hold 40 cycles
        req = {N{1'b1}};
        repeat (40) begin @(posedge clk); #1; end
        req = 0; repeat (2) begin @(posedge clk); #1; end

        // Test 3: requesters 0 and 1 hog, others toggle
        for (cyc = 0; cyc < 100; cyc = cyc + 1) begin
            req = {$random} % (1 << N);
            req[0] = 1'b1;
            req[1] = 1'b1;
            @(posedge clk); #1;
        end

        // Test 4: random stress
        for (cyc = 0; cyc < 2000; cyc = cyc + 1) begin
            req = $random;
            @(posedge clk); #1;
        end

        req = 0; repeat (3) begin @(posedge clk); #1; end

        $display("---------- SUMMARY (AGING_EN=%0d) ----------", AGING_EN);
        for (i = 0; i < N; i = i + 1)
            $display("req%0d: grants=%0d  max_wait=%0d cycles", i, grant_cnt[i], max_wait[i]);
        if (errors == 0) $display("PASS: all checks passed");
        else             $display("FAIL: %0d errors", errors);
        $finish;
    end
endmodule
