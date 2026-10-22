module starvation_aware_arbiter_run7 (clk,
    ready,
    rst,
    VPWR,
    VGND,
    grant,
    req);
 input clk;
 input ready;
 input rst;
 input VPWR;
 input VGND;
 output [3:0] grant;
 input [3:0] req;

 sky130_fd_sc_hd__inv_2 _103_ (.A(net5),
    .Y(_084_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__clkbuf_4 _104_ (.A(net6),
    .X(_085_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__inv_2 _105_ (.A(net1),
    .Y(_086_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__nor2_1 _106_ (.A(_086_),
    .B(_018_),
    .Y(_087_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__buf_2 _107_ (.A(_087_),
    .X(net10), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__nor3_4 _108_ (.A(_084_),
    .B(_085_),
    .C(net10),
    .Y(_088_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__and2_1 _109_ (.A(\age[3][2] ),
    .B(_088_),
    .X(_039_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__a211o_1 _110_ (.A1(\age[3][1] ),
    .A2(\age[3][0] ),
    .B1(\age[3][3] ),
    .C1(\age[3][2] ),
    .X(_089_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__nor2_1 _111_ (.A(net10),
    .B(_089_),
    .Y(_090_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__nand2_1 _112_ (.A(\age[3][0] ),
    .B(_090_),
    .Y(_091_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__inv_2 _113_ (.A(_091_),
    .Y(_092_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__o21a_1 _114_ (.A1(\age[3][1] ),
    .A2(_092_),
    .B1(_088_),
    .X(_038_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__o211a_1 _115_ (.A1(\age[3][0] ),
    .A2(_090_),
    .B1(_088_),
    .C1(_091_),
    .X(_037_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__inv_2 _116_ (.A(net4),
    .Y(_093_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__or2_1 _117_ (.A(_086_),
    .B(_008_),
    .X(_094_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__inv_2 _118_ (.A(_094_),
    .Y(net9), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__nor3_4 _119_ (.A(_093_),
    .B(_085_),
    .C(net9),
    .Y(_095_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__and2_1 _120_ (.A(\age[2][3] ),
    .B(_095_),
    .X(_036_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__and2_1 _121_ (.A(\age[2][2] ),
    .B(_095_),
    .X(_035_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__nor2_1 _122_ (.A(\age[2][3] ),
    .B(\age[2][2] ),
    .Y(_096_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__a21boi_1 _123_ (.A1(\age[2][1] ),
    .A2(\age[2][0] ),
    .B1_N(_096_),
    .Y(_097_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__nand2_1 _124_ (.A(\age[2][0] ),
    .B(_097_),
    .Y(_098_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__inv_2 _125_ (.A(_098_),
    .Y(_099_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__o21a_1 _126_ (.A1(\age[2][1] ),
    .A2(_099_),
    .B1(_095_),
    .X(_034_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__o211a_1 _127_ (.A1(\age[2][0] ),
    .A2(_096_),
    .B1(_095_),
    .C1(_098_),
    .X(_033_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__inv_2 _128_ (.A(net3),
    .Y(_100_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__or2_2 _129_ (.A(_086_),
    .B(_013_),
    .X(_101_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__inv_2 _130_ (.A(_101_),
    .Y(net8), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__nor3_4 _131_ (.A(_100_),
    .B(_085_),
    .C(net8),
    .Y(_102_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__and2_1 _132_ (.A(\age[1][3] ),
    .B(_102_),
    .X(_032_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__and2_1 _133_ (.A(\age[1][2] ),
    .B(_102_),
    .X(_031_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__nor2_1 _134_ (.A(\age[1][3] ),
    .B(\age[1][2] ),
    .Y(_041_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__a21boi_1 _135_ (.A1(\age[1][1] ),
    .A2(\age[1][0] ),
    .B1_N(_041_),
    .Y(_042_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__nand2_1 _136_ (.A(\age[1][0] ),
    .B(_042_),
    .Y(_043_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__inv_2 _137_ (.A(_043_),
    .Y(_044_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__o21a_1 _138_ (.A1(\age[1][1] ),
    .A2(_044_),
    .B1(_102_),
    .X(_030_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__o211a_1 _139_ (.A1(\age[1][0] ),
    .A2(_041_),
    .B1(_102_),
    .C1(_043_),
    .X(_029_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__inv_2 _140_ (.A(net2),
    .Y(_019_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__or2_2 _141_ (.A(_086_),
    .B(_003_),
    .X(_045_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__inv_2 _142_ (.A(_045_),
    .Y(net7), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__nor3_4 _143_ (.A(_019_),
    .B(net6),
    .C(net7),
    .Y(_046_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__and2_1 _144_ (.A(\age[0][3] ),
    .B(_046_),
    .X(_028_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__and2_1 _145_ (.A(\age[0][2] ),
    .B(_046_),
    .X(_027_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__nor2_1 _146_ (.A(\age[0][3] ),
    .B(\age[0][2] ),
    .Y(_047_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__a21boi_1 _147_ (.A1(\age[0][1] ),
    .A2(\age[0][0] ),
    .B1_N(_047_),
    .Y(_048_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__nand2_1 _148_ (.A(\age[0][0] ),
    .B(_048_),
    .Y(_049_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__inv_2 _149_ (.A(_049_),
    .Y(_050_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__o21a_1 _150_ (.A1(\age[0][1] ),
    .A2(_050_),
    .B1(_046_),
    .X(_026_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__o211a_1 _151_ (.A1(\age[0][0] ),
    .A2(_047_),
    .B1(_046_),
    .C1(_049_),
    .X(_025_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__inv_2 _152_ (.A(\rr_ptr[2] ),
    .Y(_051_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__inv_2 _153_ (.A(\rr_ptr[1] ),
    .Y(_052_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__clkbuf_2 _154_ (.A(_052_),
    .X(_053_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__o21a_1 _155_ (.A1(net3),
    .A2(_051_),
    .B1(_053_),
    .X(_054_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__inv_2 _156_ (.A(\rr_ptr[3] ),
    .Y(_055_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__clkbuf_2 _157_ (.A(_055_),
    .X(_056_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__o21a_1 _158_ (.A1(net4),
    .A2(_054_),
    .B1(_056_),
    .X(_057_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__or3_2 _159_ (.A(net5),
    .B(_019_),
    .C(_057_),
    .X(_021_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__or2_1 _160_ (.A(_019_),
    .B(_048_),
    .X(_058_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__buf_1 _161_ (.A(_058_),
    .X(_022_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__or2_2 _162_ (.A(_093_),
    .B(_097_),
    .X(_059_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__inv_2 _163_ (.A(_059_),
    .Y(_060_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__inv_2 _164_ (.A(_022_),
    .Y(_061_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__nand2_2 _165_ (.A(net5),
    .B(_089_),
    .Y(_062_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__inv_2 _166_ (.A(_062_),
    .Y(_063_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__or2_1 _167_ (.A(_100_),
    .B(_042_),
    .X(_064_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__inv_2 _168_ (.A(_064_),
    .Y(_065_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__or3_4 _169_ (.A(_061_),
    .B(_063_),
    .C(_065_),
    .X(_066_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__nor2_4 _170_ (.A(_060_),
    .B(_066_),
    .Y(_023_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__o21a_1 _171_ (.A1(_051_),
    .A2(_065_),
    .B1(_052_),
    .X(_067_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__o21a_1 _172_ (.A1(_060_),
    .A2(_067_),
    .B1(_055_),
    .X(_068_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__or3_2 _173_ (.A(_022_),
    .B(_063_),
    .C(_068_),
    .X(_024_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__or3_1 _174_ (.A(net3),
    .B(_093_),
    .C(net2),
    .X(_004_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__o32a_1 _175_ (.A1(net5),
    .A2(_056_),
    .A3(_004_),
    .B1(_093_),
    .B2(_054_),
    .X(_005_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__or3_2 _176_ (.A(_061_),
    .B(_065_),
    .C(_059_),
    .X(_006_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__o21a_1 _177_ (.A1(_056_),
    .A2(_066_),
    .B1(_067_),
    .X(_069_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__or2_1 _178_ (.A(_059_),
    .B(_069_),
    .X(_007_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__or2_1 _179_ (.A(_100_),
    .B(net2),
    .X(_009_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__o21ai_1 _180_ (.A1(_053_),
    .A2(net4),
    .B1(_055_),
    .Y(_070_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__and3_1 _181_ (.A(_084_),
    .B(_019_),
    .C(_070_),
    .X(_071_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__o21ai_1 _182_ (.A1(\rr_ptr[2] ),
    .A2(_071_),
    .B1(net3),
    .Y(_010_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__or2_1 _183_ (.A(_061_),
    .B(_064_),
    .X(_011_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__o21ai_1 _184_ (.A1(_053_),
    .A2(_060_),
    .B1(_055_),
    .Y(_072_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__and3_1 _185_ (.A(_022_),
    .B(_062_),
    .C(_072_),
    .X(_073_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__o21ai_1 _186_ (.A1(\rr_ptr[2] ),
    .A2(_073_),
    .B1(_065_),
    .Y(_012_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__or4_1 _187_ (.A(net3),
    .B(_084_),
    .C(net4),
    .D(net2),
    .X(_014_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__or2_1 _188_ (.A(_084_),
    .B(_057_),
    .X(_015_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__or4_4 _189_ (.A(_061_),
    .B(_065_),
    .C(_060_),
    .D(_062_),
    .X(_016_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__or2_1 _190_ (.A(_062_),
    .B(_068_),
    .X(_017_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__and3_2 _191_ (.A(_053_),
    .B(_051_),
    .C(_056_),
    .X(_020_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__a22o_1 _192_ (.A1(_018_),
    .A2(net9),
    .B1(_008_),
    .B2(net10),
    .X(_074_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__or4_4 _193_ (.A(_087_),
    .B(net9),
    .C(_101_),
    .D(net7),
    .X(_075_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__inv_2 _194_ (.A(_075_),
    .Y(_076_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__a31o_1 _195_ (.A1(_101_),
    .A2(_045_),
    .A3(_074_),
    .B1(_076_),
    .X(_077_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__or4b_4 _196_ (.A(net10),
    .B(net9),
    .C(_045_),
    .D_N(_013_),
    .X(_078_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__or3b_1 _197_ (.A(net6),
    .B(_077_),
    .C_N(_078_),
    .X(_079_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__o22ai_1 _198_ (.A1(_053_),
    .A2(_079_),
    .B1(_085_),
    .B2(_075_),
    .Y(_000_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__o21a_1 _199_ (.A1(_051_),
    .A2(_077_),
    .B1(_078_),
    .X(_080_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__nor2_1 _200_ (.A(_085_),
    .B(_080_),
    .Y(_001_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__inv_2 _201_ (.A(_018_),
    .Y(_081_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__or3_1 _202_ (.A(net8),
    .B(net7),
    .C(net6),
    .X(_082_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__o32a_1 _203_ (.A1(_081_),
    .A2(_094_),
    .A3(_082_),
    .B1(_056_),
    .B2(_079_),
    .X(_083_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__inv_2 _204_ (.A(_083_),
    .Y(_002_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__and2_1 _205_ (.A(\age[3][3] ),
    .B(_088_),
    .X(_040_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__mux4_2 _206_ (.A0(_012_),
    .A1(_011_),
    .A2(_010_),
    .A3(_009_),
    .S0(_020_),
    .S1(_023_),
    .X(_013_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__mux4_2 _207_ (.A0(_017_),
    .A1(_016_),
    .A2(_015_),
    .A3(_014_),
    .S0(_020_),
    .S1(_023_),
    .X(_018_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__mux4_2 _208_ (.A0(_007_),
    .A1(_006_),
    .A2(_005_),
    .A3(_004_),
    .S0(_020_),
    .S1(_023_),
    .X(_008_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__mux4_1 _209_ (.A0(_024_),
    .A1(_022_),
    .A2(_021_),
    .A3(_019_),
    .S0(_020_),
    .S1(_023_),
    .X(_003_), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__dfxtp_1 _210_ (.D(_000_),
    .Q(\rr_ptr[1] ),
    .CLK(clknet_1_1_0_clk), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__dfxtp_1 _211_ (.D(_001_),
    .Q(\rr_ptr[2] ),
    .CLK(clknet_1_0_0_clk), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__dfxtp_1 _212_ (.D(_002_),
    .Q(\rr_ptr[3] ),
    .CLK(clknet_1_0_0_clk), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__dfxtp_1 _213_ (.D(_025_),
    .Q(\age[0][0] ),
    .CLK(clknet_1_0_0_clk), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__dfxtp_1 _214_ (.D(_026_),
    .Q(\age[0][1] ),
    .CLK(clknet_1_0_0_clk), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__dfxtp_1 _215_ (.D(_027_),
    .Q(\age[0][2] ),
    .CLK(clknet_1_0_0_clk), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__dfxtp_1 _216_ (.D(_028_),
    .Q(\age[0][3] ),
    .CLK(clknet_1_0_0_clk), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__dfxtp_1 _217_ (.D(_029_),
    .Q(\age[1][0] ),
    .CLK(clknet_1_0_0_clk), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__dfxtp_1 _218_ (.D(_030_),
    .Q(\age[1][1] ),
    .CLK(clknet_1_0_0_clk), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__dfxtp_1 _219_ (.D(_031_),
    .Q(\age[1][2] ),
    .CLK(clknet_1_0_0_clk), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__dfxtp_1 _220_ (.D(_032_),
    .Q(\age[1][3] ),
    .CLK(clknet_1_0_0_clk), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__dfxtp_1 _221_ (.D(_033_),
    .Q(\age[2][0] ),
    .CLK(clknet_1_1_0_clk), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__dfxtp_1 _222_ (.D(_034_),
    .Q(\age[2][1] ),
    .CLK(clknet_1_1_0_clk), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__dfxtp_1 _223_ (.D(_035_),
    .Q(\age[2][2] ),
    .CLK(clknet_1_1_0_clk), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__dfxtp_1 _224_ (.D(_036_),
    .Q(\age[2][3] ),
    .CLK(clknet_1_1_0_clk), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__dfxtp_1 _225_ (.D(_037_),
    .Q(\age[3][0] ),
    .CLK(clknet_1_1_0_clk), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__dfxtp_1 _226_ (.D(_038_),
    .Q(\age[3][1] ),
    .CLK(clknet_1_1_0_clk), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__dfxtp_1 _227_ (.D(_039_),
    .Q(\age[3][2] ),
    .CLK(clknet_1_1_0_clk), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__dfxtp_1 _228_ (.D(_040_),
    .Q(\age[3][3] ),
    .CLK(clknet_1_1_0_clk), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__buf_1 input1 (.A(ready),
    .X(net1), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__buf_1 input2 (.A(req[0]),
    .X(net2), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__clkbuf_2 input3 (.A(req[1]),
    .X(net3), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__clkbuf_2 input4 (.A(req[2]),
    .X(net4), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__clkbuf_2 input5 (.A(req[3]),
    .X(net5), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__clkbuf_2 input6 (.A(rst),
    .X(net6), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__clkbuf_2 output7 (.A(net7),
    .X(grant[0]), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__clkbuf_2 output8 (.A(net8),
    .X(grant[1]), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__clkbuf_2 output9 (.A(net9),
    .X(grant[2]), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__clkbuf_2 output10 (.A(net10),
    .X(grant[3]), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_0_clk (.A(clk),
    .X(clknet_0_clk), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__clkbuf_1 clkbuf_1_0_0_clk (.A(clknet_0_clk),
    .X(clknet_1_0_0_clk), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
 sky130_fd_sc_hd__clkbuf_1 clkbuf_1_1_0_clk (.A(clknet_0_clk),
    .X(clknet_1_1_0_clk), .VPWR(VPWR), .VGND(VGND), .VPB(VPWR), .VNB(VGND));
endmodule
