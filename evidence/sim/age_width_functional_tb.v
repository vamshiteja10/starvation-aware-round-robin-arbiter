`timescale 1ns/1ps

module age_width_functional_tb;

    reg clk = 0;
    reg rst = 1;
    reg ready = 0;
    reg [3:0] req = 0;
    wire [3:0] grant;

    integer errors = 0;
    integer checks = 0;
    integer k;
    integer b;
    integer grant_count [0:3];

    starvation_aware_arbiter_age_width_opt #(
        .N(4),
        .AGE_WIDTH(2),
        .AGE_THRESHOLD(3)
    ) dut (
        .clk(clk),
        .rst(rst),
        .ready(ready),
        .req(req),
        .grant(grant)
    );

    always #5 clk = ~clk;

    task check_protocol;
        begin
            checks = checks + 1;

            if ((grant != 0) && ((grant & (grant - 1'b1)) != 0)) begin
                errors = errors + 1;
                $display("FAIL: grant is not one-hot: %b", grant);
            end

            if ((grant & ~req) != 0) begin
                errors = errors + 1;
                $display("FAIL: grant to non-requester req=%b grant=%b",
                         req, grant);
            end

            if (!ready && grant !== 4'b0000) begin
                errors = errors + 1;
                $display("FAIL: grant asserted when ready=0: %b", grant);
            end

            if (ready && req != 0 && grant == 0) begin
                errors = errors + 1;
                $display("FAIL: no grant when requests are pending");
            end
        end
    endtask

    initial begin
        for (b = 0; b < 4; b = b + 1)
            grant_count[b] = 0;

        // Initial reset
        repeat (2) @(posedge clk);
        @(negedge clk);
        rst = 0;
        req = 4'b1111;
        ready = 1;
        #1;

        if (grant !== 4'b0001) begin
            errors = errors + 1;
            $display("FAIL: first post-reset grant=%b expected=0001", grant);
        end

        check_protocol();
        grant_count[0] = grant_count[0] + 1;

        // All four requesters remain active for 80 cycles.
        for (k = 0; k < 80; k = k + 1) begin
            @(negedge clk);
            req = 4'b1111;
            ready = 1;
            #1;
            check_protocol();

            for (b = 0; b < 4; b = b + 1)
                if (grant[b])
                    grant_count[b] = grant_count[b] + 1;
        end

        // Backpressure: no grant while ready is low.
        for (k = 0; k < 8; k = k + 1) begin
            @(negedge clk);
            req = 4'b1111;
            ready = 0;
            #1;
            check_protocol();
        end

        // Idle and single-request cases.
        @(negedge clk);
        req = 0;
        ready = 1;
        #1;
        check_protocol();

        @(negedge clk);
        req = 4'b0100;
        ready = 1;
        #1;
        check_protocol();

        if (grant !== 4'b0100) begin
            errors = errors + 1;
            $display("FAIL: single requester grant=%b expected=0100", grant);
        end

        // Random requests and ready patterns.
        for (k = 0; k < 200; k = k + 1) begin
            @(negedge clk);
            req = $random;
            ready = $random;
            #1;
            check_protocol();
        end

        // Reset during operation, then check pointer reset behavior.
        @(negedge clk);
        rst = 1;
        req = 0;
        ready = 0;
        repeat (2) @(posedge clk);

        @(negedge clk);
        rst = 0;
        req = 4'b1111;
        ready = 1;
        #1;

        if (grant !== 4'b0001) begin
            errors = errors + 1;
            $display("FAIL: post-reset grant=%b expected=0001", grant);
        end
        check_protocol();

        $display("");
        $display("===== AGE-WIDTH FUNCTIONAL TEST SUMMARY =====");
        $display("Design: 4 requesters, AGE_WIDTH=2, threshold=3");
        $display("Protocol checks: %0d", checks);

        for (b = 0; b < 4; b = b + 1)
            $display("Requester %0d grant count during sustained requests: %0d",
                     b, grant_count[b]);

        if (grant_count[0] == 0 || grant_count[1] == 0 ||
            grant_count[2] == 0 || grant_count[3] == 0) begin
            errors = errors + 1;
            $display("FAIL: at least one requester was never granted");
        end

        if (errors == 0)
            $display("FUNCTIONAL TEST PASSED");
        else
            $display("FUNCTIONAL TEST FAILED: %0d error(s)", errors);

        $finish;
    end

endmodule
