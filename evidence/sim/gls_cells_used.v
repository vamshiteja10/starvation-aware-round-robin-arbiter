module sky130_fd_sc_hd__or3b (
    X  ,
    A  ,
    B  ,
    C_N
);

    // Module ports
    output X  ;
    input  A  ;
    input  B  ;
    input  C_N;

    // Local signals
    wire not0_out ;
    wire or0_out_X;

    //  Name  Output     Other arguments
    not not0 (not0_out , C_N            );
    or  or0  (or0_out_X, B, A, not0_out );
    buf buf0 (X        , or0_out_X      );

endmodule
module sky130_fd_sc_hd__or3b_1 (
    X  ,
    A  ,
    B  ,
    C_N
);

    output X  ;
    input  A  ;
    input  B  ;
    input  C_N;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__or3b base (
        .X(X),
        .A(A),
        .B(B),
        .C_N(C_N)
    );

endmodule
module sky130_fd_sc_hd__o211a_1 (
    X ,
    A1,
    A2,
    B1,
    C1
);

    output X ;
    input  A1;
    input  A2;
    input  B1;
    input  C1;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__o211a base (
        .X(X),
        .A1(A1),
        .A2(A2),
        .B1(B1),
        .C1(C1)
    );

endmodule
module sky130_fd_sc_hd__o211a (
    X ,
    A1,
    A2,
    B1,
    C1
);

    // Module ports
    output X ;
    input  A1;
    input  A2;
    input  B1;
    input  C1;

    // Local signals
    wire or0_out   ;
    wire and0_out_X;

    //  Name  Output      Other arguments
    or  or0  (or0_out   , A2, A1         );
    and and0 (and0_out_X, or0_out, B1, C1);
    buf buf0 (X         , and0_out_X     );

endmodule
module sky130_fd_sc_hd__a21boi (
    Y   ,
    A1  ,
    A2  ,
    B1_N
);

    // Module ports
    output Y   ;
    input  A1  ;
    input  A2  ;
    input  B1_N;

    // Local signals
    wire b         ;
    wire and0_out  ;
    wire nor0_out_Y;

    //  Name  Output      Other arguments
    not not0 (b         , B1_N           );
    and and0 (and0_out  , A1, A2         );
    nor nor0 (nor0_out_Y, b, and0_out    );
    buf buf0 (Y         , nor0_out_Y     );

endmodule
module sky130_fd_sc_hd__a21boi_1 (
    Y   ,
    A1  ,
    A2  ,
    B1_N
);

    output Y   ;
    input  A1  ;
    input  A2  ;
    input  B1_N;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__a21boi base (
        .Y(Y),
        .A1(A1),
        .A2(A2),
        .B1_N(B1_N)
    );

endmodule
module sky130_fd_sc_hd__a211o_1 (
    X ,
    A1,
    A2,
    B1,
    C1
);

    output X ;
    input  A1;
    input  A2;
    input  B1;
    input  C1;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__a211o base (
        .X(X),
        .A1(A1),
        .A2(A2),
        .B1(B1),
        .C1(C1)
    );

endmodule
module sky130_fd_sc_hd__a211o (
    X ,
    A1,
    A2,
    B1,
    C1
);

    // Module ports
    output X ;
    input  A1;
    input  A2;
    input  B1;
    input  C1;

    // Local signals
    wire and0_out ;
    wire or0_out_X;

    //  Name  Output     Other arguments
    and and0 (and0_out , A1, A2          );
    or  or0  (or0_out_X, and0_out, C1, B1);
    buf buf0 (X        , or0_out_X       );

endmodule
module sky130_fd_sc_hd__a22o_1 (
    X ,
    A1,
    A2,
    B1,
    B2
);

    output X ;
    input  A1;
    input  A2;
    input  B1;
    input  B2;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__a22o base (
        .X(X),
        .A1(A1),
        .A2(A2),
        .B1(B1),
        .B2(B2)
    );

endmodule
module sky130_fd_sc_hd__a22o (
    X ,
    A1,
    A2,
    B1,
    B2
);

    // Module ports
    output X ;
    input  A1;
    input  A2;
    input  B1;
    input  B2;

    // Local signals
    wire and0_out ;
    wire and1_out ;
    wire or0_out_X;

    //  Name  Output     Other arguments
    and and0 (and0_out , B1, B2            );
    and and1 (and1_out , A1, A2            );
    or  or0  (or0_out_X, and1_out, and0_out);
    buf buf0 (X        , or0_out_X         );

endmodule
module sky130_fd_sc_hd__nand2_1 (
    Y,
    A,
    B
);

    output Y;
    input  A;
    input  B;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__nand2 base (
        .Y(Y),
        .A(A),
        .B(B)
    );

endmodule
module sky130_fd_sc_hd__nand2 (
    Y,
    A,
    B
);

    // Module ports
    output Y;
    input  A;
    input  B;

    // Local signals
    wire nand0_out_Y;

    //   Name   Output       Other arguments
    nand nand0 (nand0_out_Y, B, A           );
    buf  buf0  (Y          , nand0_out_Y    );

endmodule
module sky130_fd_sc_hd__nand2_2 (
    Y,
    A,
    B
);

    output Y;
    input  A;
    input  B;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__nand2 base (
        .Y(Y),
        .A(A),
        .B(B)
    );

endmodule
module sky130_fd_sc_hd__o32a_1 (
    X ,
    A1,
    A2,
    A3,
    B1,
    B2
);

    output X ;
    input  A1;
    input  A2;
    input  A3;
    input  B1;
    input  B2;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__o32a base (
        .X(X),
        .A1(A1),
        .A2(A2),
        .A3(A3),
        .B1(B1),
        .B2(B2)
    );

endmodule
module sky130_fd_sc_hd__o32a (
    X ,
    A1,
    A2,
    A3,
    B1,
    B2
);

    // Module ports
    output X ;
    input  A1;
    input  A2;
    input  A3;
    input  B1;
    input  B2;

    // Local signals
    wire or0_out   ;
    wire or1_out   ;
    wire and0_out_X;

    //  Name  Output      Other arguments
    or  or0  (or0_out   , A2, A1, A3      );
    or  or1  (or1_out   , B2, B1          );
    and and0 (and0_out_X, or0_out, or1_out);
    buf buf0 (X         , and0_out_X      );

endmodule
module sky130_fd_sc_hd__a31o (
    X ,
    A1,
    A2,
    A3,
    B1
);

    // Module ports
    output X ;
    input  A1;
    input  A2;
    input  A3;
    input  B1;

    // Local signals
    wire and0_out ;
    wire or0_out_X;

    //  Name  Output     Other arguments
    and and0 (and0_out , A3, A1, A2     );
    or  or0  (or0_out_X, and0_out, B1   );
    buf buf0 (X        , or0_out_X      );

endmodule
module sky130_fd_sc_hd__a31o_1 (
    X ,
    A1,
    A2,
    A3,
    B1
);

    output X ;
    input  A1;
    input  A2;
    input  A3;
    input  B1;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__a31o base (
        .X(X),
        .A1(A1),
        .A2(A2),
        .A3(A3),
        .B1(B1)
    );

endmodule
module sky130_fd_sc_hd__mux4 (
    X ,
    A0,
    A1,
    A2,
    A3,
    S0,
    S1
);

    // Module ports
    output X ;
    input  A0;
    input  A1;
    input  A2;
    input  A3;
    input  S0;
    input  S1;

    // Local signals
    wire mux_4to20_out_X;

    //                            Name       Output           Other arguments
    sky130_fd_sc_hd__udp_mux_4to2 mux_4to20 (mux_4to20_out_X, A0, A1, A2, A3, S0, S1);
    buf                           buf0      (X              , mux_4to20_out_X       );

endmodule
module sky130_fd_sc_hd__mux4_1 (
    X ,
    A0,
    A1,
    A2,
    A3,
    S0,
    S1
);

    output X ;
    input  A0;
    input  A1;
    input  A2;
    input  A3;
    input  S0;
    input  S1;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__mux4 base (
        .X(X),
        .A0(A0),
        .A1(A1),
        .A2(A2),
        .A3(A3),
        .S0(S0),
        .S1(S1)
    );

endmodule
module sky130_fd_sc_hd__mux4_2 (
    X ,
    A0,
    A1,
    A2,
    A3,
    S0,
    S1
);

    output X ;
    input  A0;
    input  A1;
    input  A2;
    input  A3;
    input  S0;
    input  S1;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__mux4 base (
        .X(X),
        .A0(A0),
        .A1(A1),
        .A2(A2),
        .A3(A3),
        .S0(S0),
        .S1(S1)
    );

endmodule
module sky130_fd_sc_hd__nor3_4 (
    Y,
    A,
    B,
    C
);

    output Y;
    input  A;
    input  B;
    input  C;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__nor3 base (
        .Y(Y),
        .A(A),
        .B(B),
        .C(C)
    );

endmodule
module sky130_fd_sc_hd__nor3 (
    Y,
    A,
    B,
    C
);

    // Module ports
    output Y;
    input  A;
    input  B;
    input  C;

    // Local signals
    wire nor0_out_Y;

    //  Name  Output      Other arguments
    nor nor0 (nor0_out_Y, C, A, B        );
    buf buf0 (Y         , nor0_out_Y     );

endmodule
module sky130_fd_sc_hd__and3_2 (
    X,
    A,
    B,
    C
);

    output X;
    input  A;
    input  B;
    input  C;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__and3 base (
        .X(X),
        .A(A),
        .B(B),
        .C(C)
    );

endmodule
module sky130_fd_sc_hd__and3 (
    X,
    A,
    B,
    C
);

    // Module ports
    output X;
    input  A;
    input  B;
    input  C;

    // Local signals
    wire and0_out_X;

    //  Name  Output      Other arguments
    and and0 (and0_out_X, C, A, B        );
    buf buf0 (X         , and0_out_X     );

endmodule
module sky130_fd_sc_hd__and3_1 (
    X,
    A,
    B,
    C
);

    output X;
    input  A;
    input  B;
    input  C;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__and3 base (
        .X(X),
        .A(A),
        .B(B),
        .C(C)
    );

endmodule
module sky130_fd_sc_hd__clkbuf_4 (
    X,
    A
);

    output X;
    input  A;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__clkbuf base (
        .X(X),
        .A(A)
    );

endmodule
module sky130_fd_sc_hd__clkbuf_2 (
    X,
    A
);

    output X;
    input  A;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__clkbuf base (
        .X(X),
        .A(A)
    );

endmodule
module sky130_fd_sc_hd__clkbuf_1 (
    X,
    A
);

    output X;
    input  A;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__clkbuf base (
        .X(X),
        .A(A)
    );

endmodule
module sky130_fd_sc_hd__clkbuf (
    X,
    A
);

    // Module ports
    output X;
    input  A;

    // Local signals
    wire buf0_out_X;

    //  Name  Output      Other arguments
    buf buf0 (buf0_out_X, A              );
    buf buf1 (X         , buf0_out_X     );

endmodule
module sky130_fd_sc_hd__clkbuf_16 (
    X,
    A
);

    output X;
    input  A;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__clkbuf base (
        .X(X),
        .A(A)
    );

endmodule
module sky130_fd_sc_hd__or4_1 (
    X,
    A,
    B,
    C,
    D
);

    output X;
    input  A;
    input  B;
    input  C;
    input  D;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__or4 base (
        .X(X),
        .A(A),
        .B(B),
        .C(C),
        .D(D)
    );

endmodule
module sky130_fd_sc_hd__or4_4 (
    X,
    A,
    B,
    C,
    D
);

    output X;
    input  A;
    input  B;
    input  C;
    input  D;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__or4 base (
        .X(X),
        .A(A),
        .B(B),
        .C(C),
        .D(D)
    );

endmodule
module sky130_fd_sc_hd__or4 (
    X,
    A,
    B,
    C,
    D
);

    // Module ports
    output X;
    input  A;
    input  B;
    input  C;
    input  D;

    // Local signals
    wire or0_out_X;

    //  Name  Output     Other arguments
    or  or0  (or0_out_X, D, C, B, A     );
    buf buf0 (X        , or0_out_X      );

endmodule
module sky130_fd_sc_hd__nor2_1 (
    Y,
    A,
    B
);

    output Y;
    input  A;
    input  B;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__nor2 base (
        .Y(Y),
        .A(A),
        .B(B)
    );

endmodule
module sky130_fd_sc_hd__nor2_4 (
    Y,
    A,
    B
);

    output Y;
    input  A;
    input  B;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__nor2 base (
        .Y(Y),
        .A(A),
        .B(B)
    );

endmodule
module sky130_fd_sc_hd__nor2 (
    Y,
    A,
    B
);

    // Module ports
    output Y;
    input  A;
    input  B;

    // Local signals
    wire nor0_out_Y;

    //  Name  Output      Other arguments
    nor nor0 (nor0_out_Y, A, B           );
    buf buf0 (Y         , nor0_out_Y     );

endmodule
module sky130_fd_sc_hd__inv_2 (
    Y,
    A
);

    output Y;
    input  A;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__inv base (
        .Y(Y),
        .A(A)
    );

endmodule
module sky130_fd_sc_hd__inv (
    Y,
    A
);

    // Module ports
    output Y;
    input  A;

    // Local signals
    wire not0_out_Y;

    //  Name  Output      Other arguments
    not not0 (not0_out_Y, A              );
    buf buf0 (Y         , not0_out_Y     );

endmodule
module sky130_fd_sc_hd__or3 (
    X,
    A,
    B,
    C
);

    // Module ports
    output X;
    input  A;
    input  B;
    input  C;

    // Local signals
    wire or0_out_X;

    //  Name  Output     Other arguments
    or  or0  (or0_out_X, B, A, C        );
    buf buf0 (X        , or0_out_X      );

endmodule
module sky130_fd_sc_hd__or3_2 (
    X,
    A,
    B,
    C
);

    output X;
    input  A;
    input  B;
    input  C;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__or3 base (
        .X(X),
        .A(A),
        .B(B),
        .C(C)
    );

endmodule
module sky130_fd_sc_hd__or3_4 (
    X,
    A,
    B,
    C
);

    output X;
    input  A;
    input  B;
    input  C;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__or3 base (
        .X(X),
        .A(A),
        .B(B),
        .C(C)
    );

endmodule
module sky130_fd_sc_hd__or3_1 (
    X,
    A,
    B,
    C
);

    output X;
    input  A;
    input  B;
    input  C;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__or3 base (
        .X(X),
        .A(A),
        .B(B),
        .C(C)
    );

endmodule
module sky130_fd_sc_hd__and2_1 (
    X,
    A,
    B
);

    output X;
    input  A;
    input  B;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__and2 base (
        .X(X),
        .A(A),
        .B(B)
    );

endmodule
module sky130_fd_sc_hd__and2 (
    X,
    A,
    B
);

    // Module ports
    output X;
    input  A;
    input  B;

    // Local signals
    wire and0_out_X;

    //  Name  Output      Other arguments
    and and0 (and0_out_X, A, B           );
    buf buf0 (X         , and0_out_X     );

endmodule
module sky130_fd_sc_hd__o22ai_1 (
    Y ,
    A1,
    A2,
    B1,
    B2
);

    output Y ;
    input  A1;
    input  A2;
    input  B1;
    input  B2;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__o22ai base (
        .Y(Y),
        .A1(A1),
        .A2(A2),
        .B1(B1),
        .B2(B2)
    );

endmodule
module sky130_fd_sc_hd__o22ai (
    Y ,
    A1,
    A2,
    B1,
    B2
);

    // Module ports
    output Y ;
    input  A1;
    input  A2;
    input  B1;
    input  B2;

    // Local signals
    wire nor0_out ;
    wire nor1_out ;
    wire or0_out_Y;

    //  Name  Output     Other arguments
    nor nor0 (nor0_out , B1, B2            );
    nor nor1 (nor1_out , A1, A2            );
    or  or0  (or0_out_Y, nor1_out, nor0_out);
    buf buf0 (Y        , or0_out_Y         );

endmodule
module sky130_fd_sc_hd__decap_3 ();
    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__decap base ();

endmodule
module sky130_fd_sc_hd__decap ();
     // No contents.
endmodule
module sky130_fd_sc_hd__o21a_1 (
    X ,
    A1,
    A2,
    B1
);

    output X ;
    input  A1;
    input  A2;
    input  B1;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__o21a base (
        .X(X),
        .A1(A1),
        .A2(A2),
        .B1(B1)
    );

endmodule
module sky130_fd_sc_hd__o21a (
    X ,
    A1,
    A2,
    B1
);

    // Module ports
    output X ;
    input  A1;
    input  A2;
    input  B1;

    // Local signals
    wire or0_out   ;
    wire and0_out_X;

    //  Name  Output      Other arguments
    or  or0  (or0_out   , A2, A1         );
    and and0 (and0_out_X, or0_out, B1    );
    buf buf0 (X         , and0_out_X     );

endmodule
module sky130_fd_sc_hd__dfxtp (
    Q  ,
    CLK,
    D
);

    // Module ports
    output Q  ;
    input  CLK;
    input  D  ;

    // Local signals
    wire buf_Q;

    //                         Delay       Name  Output  Other arguments
    sky130_fd_sc_hd__udp_dff$P #0 dff0 (buf_Q , D, CLK         );
    buf                                    buf0 (Q     , buf_Q          );

endmodule
module sky130_fd_sc_hd__dfxtp_1 (
    Q  ,
    CLK,
    D
);

    output Q  ;
    input  CLK;
    input  D  ;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__dfxtp base (
        .Q(Q),
        .CLK(CLK),
        .D(D)
    );

endmodule
module sky130_fd_sc_hd__buf (
    X,
    A
);

    // Module ports
    output X;
    input  A;

    // Local signals
    wire buf0_out_X;

    //  Name  Output      Other arguments
    buf buf0 (buf0_out_X, A              );
    buf buf1 (X         , buf0_out_X     );

endmodule
module sky130_fd_sc_hd__buf_1 (
    X,
    A
);

    output X;
    input  A;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__buf base (
        .X(X),
        .A(A)
    );

endmodule
module sky130_fd_sc_hd__buf_2 (
    X,
    A
);

    output X;
    input  A;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__buf base (
        .X(X),
        .A(A)
    );

endmodule
module sky130_fd_sc_hd__or2_2 (
    X,
    A,
    B
);

    output X;
    input  A;
    input  B;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__or2 base (
        .X(X),
        .A(A),
        .B(B)
    );

endmodule
module sky130_fd_sc_hd__or2 (
    X,
    A,
    B
);

    // Module ports
    output X;
    input  A;
    input  B;

    // Local signals
    wire or0_out_X;

    //  Name  Output     Other arguments
    or  or0  (or0_out_X, B, A           );
    buf buf0 (X        , or0_out_X      );

endmodule
module sky130_fd_sc_hd__or2_1 (
    X,
    A,
    B
);

    output X;
    input  A;
    input  B;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__or2 base (
        .X(X),
        .A(A),
        .B(B)
    );

endmodule
module sky130_fd_sc_hd__tapvpwrvgnd ();
     // No contents.
endmodule
module sky130_fd_sc_hd__tapvpwrvgnd_1 ();
    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__tapvpwrvgnd base ();

endmodule
module sky130_fd_sc_hd__o21ai (
    Y ,
    A1,
    A2,
    B1
);

    // Module ports
    output Y ;
    input  A1;
    input  A2;
    input  B1;

    // Local signals
    wire or0_out    ;
    wire nand0_out_Y;

    //   Name   Output       Other arguments
    or   or0   (or0_out    , A2, A1         );
    nand nand0 (nand0_out_Y, B1, or0_out    );
    buf  buf0  (Y          , nand0_out_Y    );

endmodule
module sky130_fd_sc_hd__o21ai_1 (
    Y ,
    A1,
    A2,
    B1
);

    output Y ;
    input  A1;
    input  A2;
    input  B1;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__o21ai base (
        .Y(Y),
        .A1(A1),
        .A2(A2),
        .B1(B1)
    );

endmodule
module sky130_fd_sc_hd__or4b (
    X  ,
    A  ,
    B  ,
    C  ,
    D_N
);

    // Module ports
    output X  ;
    input  A  ;
    input  B  ;
    input  C  ;
    input  D_N;

    // Local signals
    wire not0_out ;
    wire or0_out_X;

    //  Name  Output     Other arguments
    not not0 (not0_out , D_N              );
    or  or0  (or0_out_X, not0_out, C, B, A);
    buf buf0 (X        , or0_out_X        );

endmodule
module sky130_fd_sc_hd__or4b_4 (
    X  ,
    A  ,
    B  ,
    C  ,
    D_N
);

    output X  ;
    input  A  ;
    input  B  ;
    input  C  ;
    input  D_N;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__or4b base (
        .X(X),
        .A(A),
        .B(B),
        .C(C),
        .D_N(D_N)
    );

endmodule
