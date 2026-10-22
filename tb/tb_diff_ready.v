`timescale 1ns/1ps
module tb_diff;
    reg clk = 0, rst = 1, ready = 1;
    reg [3:0] req = 0;
    wire [3:0] g_on, g_off;
    starvation_aware_arbiter_run7 #(.AGE_THRESHOLD(3))   on  (.clk(clk), .rst(rst), .ready(ready), .req(req), .grant(g_on));
    starvation_aware_arbiter_run7 #(.AGE_THRESHOLD(100)) off (.clk(clk), .rst(rst), .ready(ready), .req(req), .grant(g_off));
    always #5 clk = ~clk;
    integer seed = 7, diff = 0, cyc = 0, i, q;
    integer w_on [0:3], w_off [0:3], mx_on [0:3], mx_off [0:3];
    always @(negedge clk) if (!rst) begin
        if (g_on !== g_off) diff = diff + 1;
        for (q = 0; q < 4; q = q + 1) begin
            if (req[q] && !g_on[q])  begin w_on[q]  = w_on[q]  + 1; if (w_on[q]  > mx_on[q])  mx_on[q]  = w_on[q];  end else w_on[q]  = 0;
            if (req[q] && !g_off[q]) begin w_off[q] = w_off[q] + 1; if (w_off[q] > mx_off[q]) mx_off[q] = w_off[q]; end else w_off[q] = 0;
        end
    end
    initial begin
        for (i = 0; i < 4; i = i + 1) begin w_on[i] = 0; w_off[i] = 0; mx_on[i] = 0; mx_off[i] = 0; end
        repeat (3) @(posedge clk); #1 rst = 0;
        repeat (20000) begin
            @(posedge clk); #1;
            req = ((cyc / 200) % 2) ? ($random(seed) | $random(seed)) : $random(seed);
            ready = (($random(seed) & 3) != 0); cyc = cyc + 1;
        end
        @(negedge clk);
        $display("cycles where aging-on and aging-off grants differ: %0d of %0d", diff, cyc);
        for (i = 0; i < 4; i = i + 1)
            $display("req%0d max_wait: aging on = %0d, aging off = %0d", i, mx_on[i], mx_off[i]);
        $finish;
    end
endmodule
