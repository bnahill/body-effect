/* Verilog for cell 'LF-Adder:decoder8{sch}' from library 'LF-Adder' */
/* Created on Thu Nov 22, 2012 10:28:41 */
/* Last revised on Thu Nov 22, 2012 11:12:47 */
/* Written on Thu Nov 22, 2012 11:14:41 by Electric VLSI Design System, version 9.03 */

module muddlib07__and2_1x(a, b, y);
  input a;
  input b;
  output y;

  supply1 vdd;
  supply0 gnd;
  wire net_1, net_2;

  tranif1 nmos_0(net_1, net_2, b);
  tranif1 nmos_1(gnd, net_1, a);
  tranif1 nmos_2(gnd, y, net_2);
  tranif0 pmos_0(net_2, vdd, b);
  tranif0 pmos_1(net_2, vdd, a);
  tranif0 pmos_2(y, vdd, net_2);
endmodule   /* muddlib07__and2_1x */

module muddlib07__and3_1x(a, b, c, y);
  input a;
  input b;
  input c;
  output y;

  supply1 vdd;
  supply0 gnd;
  wire net_1, net_45, net_9;

  tranif1 nmos_0(net_45, net_9, b);
  tranif1 nmos_1(net_9, net_1, c);
  tranif1 nmos_3(gnd, y, net_1);
  tranif1 nmos_4(gnd, net_45, a);
  tranif0 pmos_0(net_1, vdd, c);
  tranif0 pmos_1(y, vdd, net_1);
  tranif0 pmos_2(net_1, vdd, a);
  tranif0 pmos_3(net_1, vdd, b);
endmodule   /* muddlib07__and3_1x */

module muddlib07__buf_2x(a, y);
  input a;
  output y;

  supply1 vdd;
  supply0 gnd;
  wire net_23;

  tranif1 nmos_0(gnd, net_23, a);
  tranif1 nmos_1(gnd, y, net_23);
  tranif0 pmos_0(net_23, vdd, a);
  tranif0 pmos_1(y, vdd, net_23);
endmodule   /* muddlib07__buf_2x */

module muddlib07__buf_4x(a, y);
  input a;
  output y;

  supply1 vdd;
  supply0 gnd;
  wire net_23;

  tranif1 nmos_0(gnd, net_23, a);
  tranif1 nmos_1(gnd, y, net_23);
  tranif0 pmos_0(net_23, vdd, a);
  tranif0 pmos_1(y, vdd, net_23);
endmodule   /* muddlib07__buf_4x */

module muddlib07__inv_1x(a, y);
  input a;
  output y;

  supply1 vdd;
  supply0 gnd;
  tranif1 nmos_0(gnd, y, a);
  tranif0 pmos_0(y, vdd, a);
endmodule   /* muddlib07__inv_1x */

module muddlib07__nor2_1x(a, b, y);
  input a;
  input b;
  output y;

  supply1 vdd;
  supply0 gnd;
  wire net_9;

  tranif1 nmos_0(gnd, y, a);
  tranif1 nmos_1(gnd, y, b);
  tranif0 pmos_0(y, net_9, b);
  tranif0 pmos_1(net_9, vdd, a);
endmodule   /* muddlib07__nor2_1x */

module muddlib07__nor3_1x(a, b, c, y);
  input a;
  input b;
  input c;
  output y;

  supply1 vdd;
  supply0 gnd;
  wire net_13, net_7;

  tranif1 nmos_0(gnd, y, a);
  tranif1 nmos_1(gnd, y, b);
  tranif1 nmos_2(gnd, y, c);
  tranif0 pmos_0(net_7, vdd, a);
  tranif0 pmos_1(net_13, net_7, b);
  tranif0 pmos_2(y, net_13, c);
endmodule   /* muddlib07__nor3_1x */

module decoder8(A, ADR_MATCH, EN);
  input [7:0] A;
  output ADR_MATCH;
  output [7:0] EN;

  supply1 vdd;
  supply0 gnd;
  wire net_106, net_108, net_116, net_12, net_15, net_18, net_21, net_23;
  wire net_25, net_3, net_6, net_9, net_93;
  wire [2:0] nA;

  muddlib07__and2_1x and2_1x_0(.a(net_93), .b(ADR_MATCH), .y(EN[0]));
  muddlib07__and2_1x and2_1x_1(.a(net_106), .b(ADR_MATCH), .y(EN[7]));
  muddlib07__and3_1x and3_1x_0(.a(net_21), .b(net_23), .c(net_25), 
      .y(net_106));
  muddlib07__and3_1x and3_1x_1(.a(ADR_MATCH), .b(net_18), .c(net_21), 
      .y(EN[1]));
  muddlib07__and3_1x and3_1x_2(.a(ADR_MATCH), .b(net_15), .c(net_23), 
      .y(EN[2]));
  muddlib07__and3_1x and3_1x_3(.a(ADR_MATCH), .b(net_12), .c(nA[2]), 
      .y(EN[3]));
  muddlib07__and3_1x and3_1x_4(.a(ADR_MATCH), .b(net_9), .c(net_25), 
      .y(EN[4]));
  muddlib07__and3_1x and3_1x_5(.a(ADR_MATCH), .b(net_6), .c(nA[1]), 
      .y(EN[5]));
  muddlib07__and3_1x and3_1x_6(.a(ADR_MATCH), .b(net_3), .c(nA[0]), 
      .y(EN[6]));
  muddlib07__and3_1x and3_1x_7(.a(A[7]), .b(A[6]), .c(A[5]), .y(net_108));
  muddlib07__and3_1x and3_1x_8(.a(net_108), .b(A[4]), .c(A[3]), .y(net_116));
  muddlib07__buf_2x buf_2x_0(.a(A[0]), .y(net_21));
  muddlib07__buf_2x buf_2x_1(.a(A[1]), .y(net_23));
  muddlib07__buf_2x buf_2x_2(.a(A[2]), .y(net_25));
  muddlib07__buf_4x buf_4x_0(.a(net_116), .y(ADR_MATCH));
  muddlib07__inv_1x inv_1x_0(.a(A[2]), .y(nA[2]));
  muddlib07__inv_1x inv_1x_1(.a(A[1]), .y(nA[1]));
  muddlib07__inv_1x inv_1x_2(.a(A[0]), .y(nA[0]));
  muddlib07__nor2_1x nor2_1x_0(.a(net_23), .b(net_25), .y(net_18));
  muddlib07__nor2_1x nor2_1x_1(.a(net_25), .b(net_21), .y(net_15));
  muddlib07__nor2_1x nor2_1x_2(.a(nA[0]), .b(nA[1]), .y(net_12));
  muddlib07__nor2_1x nor2_1x_3(.a(net_21), .b(net_23), .y(net_9));
  muddlib07__nor2_1x nor2_1x_4(.a(nA[0]), .b(nA[2]), .y(net_6));
  muddlib07__nor2_1x nor2_1x_5(.a(nA[1]), .b(nA[2]), .y(net_3));
  muddlib07__nor3_1x nor3_1x_0(.a(net_21), .b(net_23), .c(net_25), 
      .y(net_93));
endmodule   /* decoder8 */
