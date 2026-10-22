`timescale 1ns/1ps

module shared_select_compare_tb;

    reg clk = 0;
    reg rst = 1;
    reg ready = 0;
    reg [3:0] req = 0;

    wire [3:0] grant_ref;
    wire [3:0] grant_opt;

    integer cycle;
    integer errors;
    integer k;

    starvation_aware_arbiter #(
        .N(4),
        .AGE_WIDTH(4),
        .AGE_THRESHOLD(3)
    ) reference_design (
        .clk(clk),
        .rst(rst),
        .ready(ready),
        .req(req),
        .grant(grant_ref)
    );

    starvation_aware_arbiter_shared_select_opt #(
        .N(4),
        .AGE_WIDTH(4),
        .AGE_THRESHOLD(3)
    ) optimized_design (
        .clk(clk),
        .rst(rst),
        .ready(ready),
        .req(req),
        .grant(grant_opt)
    );

    always #5 clk = ~clk;

    task compare_grants;
        begin
            #1;
            if (grant_ref !== grant_opt) begin
                $display(
                    "MISMATCH cycle=%0d req=%b ready=%b ref=%b opt=%b",
                    cycle, req, ready, grant_ref, grant_opt
                );
                errors = errors + 1;
            end
        end
    endtask

    initial begin
        cycle = 0;
        errors = 0;

        // Reset both designs.
        repeat (2) begin
            @(negedge clk);
            compare_grants;
        end

        rst = 0;

        // Exercise every request mask with ready both low and high.
        for (k = 0; k < 32; k = k + 1) begin
            @(negedge clk);
            cycle = cycle + 1;
            req = k[3:0];
            ready = k[4];
            compare_grants;
        end

        // Sustained contention helps exercise age-based arbitration.
        @(negedge clk);
        req = 4'b1111;
        ready = 1;

        repeat (40) begin
            @(negedge clk);
            cycle = cycle + 1;
            compare_grants;
        end

        // Exercise stalls and changing request combinations.
        repeat (100) begin
            @(negedge clk);
            cycle = cycle + 1;
            req = $random;
            ready = $random;
            compare_grants;
        end

        if (errors == 0)
            $display("PASS: No grant mismatches in %0d cycles.", cycle);
        else
            $display("FAIL: %0d grant mismatches.", errors);

        $finish;
    end

endmodule
