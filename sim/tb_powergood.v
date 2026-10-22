`timescale 1ns/1ps
module tb_powergood;
    reg din = 0;
    supply1 VPWR;
    supply0 VGND;
    wire dout;

    sky130_fd_sc_hd__udp_pwrgood_pp$PG dut (
        dout, din, VPWR, VGND
    );

    initial begin
        $monitor("time=%0t din=%b dout=%b", $time, din, dout);
        #10 din = 1;
        #10 din = 0;
        #10 $finish;
    end
endmodule
