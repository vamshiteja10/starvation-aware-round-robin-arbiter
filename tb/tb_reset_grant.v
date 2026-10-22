`timescale 1ns/1ps
module tb_reset_grant;
    reg clk = 0, rst = 1, ready = 1; reg [3:0] req = 4'b1111; wire [3:0] grant;
    starvation_aware_arbiter_run7 dut (.clk(clk), .rst(rst), .ready(ready), .req(req), .grant(grant));
    always #5 clk = ~clk;
    initial begin
        repeat (3) @(posedge clk);
        @(negedge clk) $display("during reset (rst=1, req=1111, ready=1): grant=%b", grant);
        $finish;
    end
endmodule
