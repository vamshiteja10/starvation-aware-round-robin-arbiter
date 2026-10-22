`timescale 1ns/1ps
module tb_buf_nopower;
    reg a = 0;
    wire x;

    sky130_fd_sc_hd__clkbuf_2 dut (
        .A(a),
        .X(x)
    );

    initial begin
        $monitor("time=%0t A=%b X=%b", $time, a, x);
        #10 a = 1;
        #10 a = 0;
        #10 $finish;
    end
endmodule
