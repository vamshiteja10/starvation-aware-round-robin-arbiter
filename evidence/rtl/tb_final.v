`timescale 1ns/1ps
module tb_final;
    parameter N = 4;
    parameter AGE_THRESHOLD = 3;
    parameter BOUND = AGE_THRESHOLD + N + 2;

    reg clk = 0, rst = 1, ready = 0;
    reg [N-1:0] req = 0;
    wire [N-1:0] grant;

    starvation_aware_arbiter_run7 #(.N(N), .AGE_THRESHOLD(AGE_THRESHOLD)) dut (
        .clk(clk), .rst(rst), .ready(ready), .req(req), .grant(grant));

    always #5 clk = ~clk;

    integer errors = 0, checks = 0, seed = 1, m, j;
    integer wait_cnt [0:N-1];
    integer max_wait [0:N-1];
    reg check_bound = 0;

    // per-cycle protocol checks, sampled at the falling edge
    always @(negedge clk) if (!rst) begin
        checks = checks + 1;
        if ((grant & (grant - 1)) !== 0) begin
            errors = errors + 1; $display("FAIL t=%0t: grant %b not one-hot", $time, grant); end
        if ((grant & ~req) !== 0) begin
            errors = errors + 1; $display("FAIL t=%0t: grant %b to non-requester (req=%b)", $time, grant, req); end
        if (!ready && grant !== 0) begin
            errors = errors + 1; $display("FAIL t=%0t: grant %b while ready=0", $time, grant); end
        if (ready && req !== 0 && grant === 0) begin
            errors = errors + 1; $display("FAIL t=%0t: no grant with req=%b ready=1", $time, req); end
        for (m = 0; m < N; m = m + 1) begin
            if (req[m] && !grant[m]) begin
                wait_cnt[m] = wait_cnt[m] + 1;
                if (check_bound) begin
                    if (wait_cnt[m] > max_wait[m]) max_wait[m] = wait_cnt[m];
                    if (wait_cnt[m] > BOUND) begin
                        errors = errors + 1;
                        $display("FAIL t=%0t: req%0d waited %0d cycles (bound %0d)", $time, m, wait_cnt[m], BOUND);
                    end
                end
            end else wait_cnt[m] = 0;
        end
    end

    task cycle(input [N-1:0] r, input rdy, input [N-1:0] want);
        begin
            @(posedge clk); #1; req = r; ready = rdy;
            @(negedge clk);
            checks = checks + 1;
            if (grant !== want) begin
                errors = errors + 1;
                $display("FAIL t=%0t req=%b ready=%b grant=%b expected=%b", $time, r, rdy, grant, want);
            end
        end
    endtask

    task free(input [N-1:0] r, input rdy);
        begin @(posedge clk); #1; req = r; ready = rdy; end
    endtask

    task pulse_reset(input integer n);
        integer k;
        begin
            @(posedge clk); #1; rst = 1; req = 0; ready = 0;
            for (k = 0; k < n; k = k + 1) @(posedge clk);
            #1; rst = 0;
        end
    endtask

    initial begin
        for (j = 0; j < N; j = j + 1) begin wait_cnt[j] = 0; max_wait[j] = 0; end
        pulse_reset(3);

        // 1. all four held, ready=1: strict rotation from pointer 0
        cycle(4'b1111, 1, 4'b0001); cycle(4'b1111, 1, 4'b0010);
        cycle(4'b1111, 1, 4'b0100); cycle(4'b1111, 1, 4'b1000);
        cycle(4'b1111, 1, 4'b0001);

        // 2. single requester, then idle
        cycle(4'b0100, 1, 4'b0100); cycle(4'b0100, 1, 4'b0100);
        cycle(4'b0000, 1, 4'b0000);

        // 3. ready=0 blocks grants for longer than the age threshold, ages saturate
        pulse_reset(2);
        repeat (6) cycle(4'b1111, 0, 4'b0000);
        cycle(4'b1111, 1, 4'b0001); cycle(4'b1111, 1, 4'b0010);
        cycle(4'b1111, 1, 4'b0100); cycle(4'b1111, 1, 4'b1000);

        // 4. random requests, ready held high: wait bound enforced
        for (j = 0; j < N; j = j + 1) wait_cnt[j] = 0;
        check_bound = 1;
        repeat (3000) free($random(seed), 1);

        // 5. all four held for 100 cycles
        repeat (100) free(4'b1111, 1);
        check_bound = 0;

        // 6. random requests and random ready: protocol checks only
        repeat (3000) free($random(seed), $random(seed));

        // 7. reset in the middle of operation clears pointer and ages
        pulse_reset(2);
        cycle(4'b1111, 1, 4'b0001); cycle(4'b1111, 1, 4'b0010);
        cycle(4'b1111, 1, 4'b0100); cycle(4'b1111, 1, 4'b1000);

        $display("---------- SUMMARY (AGE_THRESHOLD=%0d) ----------", AGE_THRESHOLD);
        for (j = 0; j < N; j = j + 1)
            $display("req%0d: max_wait=%0d cycles (ready=1 phases)", j, max_wait[j]);
        if (errors == 0) $display("ALL TESTS PASSED (%0d checks)", checks);
        else             $display("TESTS FAILED: %0d error(s)", errors);
        $finish;
    end
endmodule
