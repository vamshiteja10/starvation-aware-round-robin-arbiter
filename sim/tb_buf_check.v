`timescale 1ns/1ps
module tb_buf_check;
    reg a = 0;
    wire x;

    supply1 VPWR;
    supply0 VGND;
    supply1 VPB;
    supply0 VNB;

    sky130_fd_sc_hd__clkbuf_2 dut (
        .A(a),
        .X(x),
        .VPWR(VPWR),
        .VGND(VGND),
        .VPB(VPB),
        .VNB(VNB)
    );

    initial begin
        $monitor("time=%0t A=%b X=%b", $time, a, x);
        #10 a = 1;
        #10 a = 0;
        #10 $finish;
    end
endmodule
