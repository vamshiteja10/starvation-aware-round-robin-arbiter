Starvation-Aware Round-Robin Arbiter - evidence package
rtl/            final synthesized RTL (OpenLane src), SDC, testbenches tb_final.v and tb_diff.v; earlier_revision/ = superseded files
sim/            results on the final RTL: aging on, aging off, differential run; earlier_revision/ = logs from the previous RTL (AGE_THRESHOLD=8, AGING_EN)
prelayout_sta/  early STA on the synthesis netlist, ideal clock, TT/SS/FF only
pnr/            OpenLane run7_fix1: CTS netlist, routed DEF, SPEF, config
postroute_sta/  OpenSTA on all 18 Sky130 HD libs (CTS netlist + SPEF, propagated clock, 10 ns)
                summary.txt = setup/hold WNS per corner
                relaxed_period_summary.txt = rerun of the 5 failing corners at longer periods
Constraints: flow SDC (src/arbiter.sdc, copied to rtl/) = 10 ns clock, 1.0 ns input/output delay, no output load. postroute_sta/ (first 18-lib sweep) used a stricter set: 2.0 ns I/O delay and 0.05 pF load on grant[3:0]. postroute_sta_flowsdc/ uses the flow SDC (primary results).
gds_signoff/  final GDS (Magic and KLayout), DRC/LVS/antenna reports, Magic-vs-KLayout XOR reports, flow summary CSV
layout_images/  rendered images of the final GDS and each flow stage (floorplan, placement, CTS, routing)
Signoff on the Magic GDS: DRC 0, LVS 0 errors, antenna 0. Magic-vs-KLayout XOR is nonzero (22,500 differences in run7) and is not claimed as a passing check.
STA: hold met at all 18 libs; setup met at 1.6 V and above; five low-voltage libs fail at 10 ns and close at longer periods (see relaxed_period_summary.txt).
Gate-level simulation: sim/result_gate_level.log = tb_final.v on the post-CTS netlist with zero-delay Sky130 functional models (gls_cells_used.v is the model subset, trimmed because Icarus Verilog 10.1 cannot parse one unused low-power cell in the PDK file). Passed 6147 checks.
postroute_sta_flowsdc/  same 18-lib sweep under the flow SDC (1.0 ns I/O delay, no load) - primary results; postroute_sta/ is the stricter 2.0 ns / 0.05 pF sensitivity set
sim/result_reset_grant.log  shows grant is not forced to zero while rst is asserted (grant=0001 with req=1111, ready=1)
gds_signoff/cvc/83-cvc_screen.log  CVC (circuit validity check) on the final netlist: 0 errors in all categories
