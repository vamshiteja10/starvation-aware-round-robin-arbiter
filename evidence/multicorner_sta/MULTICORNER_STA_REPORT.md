# Multi-Corner Static Timing Analysis Report

## Project
Design and Multi-Corner Static Timing Analysis of a
Starvation-Aware Round-Robin Arbiter Using Open-Source VLSI Tools.

## Implementation
- Design: starvation_aware_arbiter_age_width_opt
- Platform: SkyWater SKY130, sky130_fd_sc_hd standard-cell library
- Physical implementation: OpenLane
- Timing analysis: OpenSTA 2.3.0
- Clock period: 10.0 ns
- Timing parasitics: Routed SPEF
- Timing netlist: CTS synthesis netlist
- Timing constraints: SDC with clock, request/reset/ready input delays,
  and grant output delays

## Multi-Corner Results

| Corner | Operating point | Worst reported slack | TNS |
|---|---|---:|---:|
| SS | 100C, 1.60 V | +4.14 ns | 0.00 ns |
| TT | 25C, 1.80 V | +6.17 ns | 0.00 ns |
| FF | -40C, 1.95 V | +6.91 ns | 0.00 ns |

All three OpenSTA runs completed with exit code 0.
The reported worst setup slack is positive at each corner.
The saved logs also contain positive slack on the reported hold paths.

## Physical Implementation Evidence
- Standard-cell count: 102
- Die area: 0.004392 mm^2
- Routed wire length: 1933 (OpenLane reported units)
- Vias: 738
- Routing violations: 0
- Magic DRC violations: 0
- LVS errors: 0
- CVC errors: 0

## Warnings and Limitations
1. OpenSTA reports that the Liberty default operating condition was not
   found, even though an explicit operating condition is selected in each
   corner script. This warning requires further investigation before
   claiming fully validated sign-off timing.
2. OpenSTA reports missing input delays for VPWR and VGND. These are
   power pins and were not assigned artificial logic input delays.
3. The physical tap cell sky130_fd_sc_hd__tapvpwrvgnd_1 is not found in
   the timing netlist's available cell models and is treated as a black box.
4. OpenLane's own WNS/TNS summary was not used as the timing result because
   its timing reports did not show valid timing paths. The values above
   come from standalone OpenSTA reports using the CTS netlist and routed SPEF.
5. Results should be presented as multi-corner STA evidence with documented
   limitations, not as final sign-off certification.

## Evidence Files
- tt_sta_validated.log
- ss_sta_validated.log
- ff_sta_validated.log
- tt_sta.tcl, ss_sta.tcl, ff_sta.tcl
- tt_sta.sdc

## Conclusion
The three standalone STA runs report positive worst setup slack and zero
TNS at the selected 10 ns clock period. The SS corner has the lowest
reported setup slack (+4.14 ns). Liberty operating-condition warnings and
the physical-only tap-cell model warning remain documented limitations.

## RTL Functional and Formal Verification

- Functional simulation: PASS.
- Testbench: evidence/sim/age_width_functional_tb.v
- Simulation log: evidence/sim/age_width_functional.log
- Simulator exit code: 0.
- Protocol checks reported: 292.
- Tested behaviors: one-hot grants, grants only to requesting
  clients, ready backpressure, idle requests, single-requester
  operation, random input patterns, and reset behavior.
- Sustained-request test: all four requesters received grants.
- Bounded formal SAT checks: 10-cycle and 30-cycle logs both
  report "SAT proof finished - no model found: SUCCESS!"

The formal checks are bounded checks, not an unbounded proof of
starvation freedom. Timing results retain the Liberty operating-
condition and physical tap-cell model warnings documented above.
