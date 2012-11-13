/* Verilog for cell 'flop_dp_1_5x{lay}' from library 'muddlib07' */
/* Created on Fri Oct 13, 2006 23:40:31 */
/* Last revised on Mon Jul 23, 2007 21:11:52 */
/* Written on Tue Nov 13, 2012 08:20:08 by Electric VLSI Design System, version 8.06 */

module flop_dp_1_5x(d, ph1, ph1b, ph2, ph2b, q, vdd, gnd);
  input d;
  input ph1;
  input ph1b;
  input ph2;
  input ph2b;
  output q;
  input vdd;
  input gnd;

  supply1 vdd;
  supply0 gnd;
  wire master, masterinb, net_498, net_502, net_552, net_555, net_557;
  wire plno_2_well, plnode_0_well;
  trireg masterb, slave;

  tranif1 nmos_2(gnd, masterinb, d);
  tranif1 nmos_18(masterinb, masterb, ph2);
  tranif1 nmos_19(masterb, net_498, ph2b);
  tranif1 nmos_20(net_498, gnd, master);
  tranif1 nmos_21(gnd, master, masterb);
  rtranif1 nmos_22(master, slave, ph1);
  tranif1 nmos_23(slave, net_552, ph1b);
  tranif1 nmos_24(net_552, gnd, net_557);
  tranif1 nmos_25(gnd, net_557, slave);
  tranif1 nmos_26(gnd, q, net_557);
  tranif0 pmos_2(vdd, masterinb, d);
  tranif0 pmos_17(masterinb, masterb, ph2b);
  tranif0 pmos_18(masterb, net_502, ph2);
  tranif0 pmos_19(net_502, vdd, master);
  tranif0 pmos_20(vdd, master, masterb);
  rtranif0 pmos_21(master, slave, ph1b);
  tranif0 pmos_22(slave, net_555, ph1);
  tranif0 pmos_23(net_555, vdd, net_557);
  tranif0 pmos_24(vdd, net_557, slave);
  tranif0 pmos_25(vdd, q, net_557);
endmodule   /* flop_dp_1_5x */
