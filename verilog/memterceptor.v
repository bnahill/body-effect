/* Verilog for cell 'memterceptor{sch}' from library 'LF-Adder' */
/* Created on Thu Nov 22, 2012 14:19:33 */
/* Last revised on Fri Nov 23, 2012 15:29:09 */
/* Written on Fri Nov 23, 2012 15:32:28 by Electric VLSI Design System, version 9.03 */

module LF_Adder__and2_1x(a, b, y);
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
endmodule   /* LF_Adder__and2_1x */

module LF_Adder__and3_1x(a, b, c, y);
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
endmodule   /* LF_Adder__and3_1x */

module LF_Adder__buftri_c_1x(d, en, y);
  input d;
  input en;
  output y;

  supply1 vdd;
  supply0 gnd;
  wire net_1, net_3, net_54, net_6;

  tranif1 nmos_0(gnd, net_3, net_6);
  tranif1 nmos_1(net_3, y, en);
  tranif1 nmos_2(gnd, net_54, en);
  tranif1 nmos_3(gnd, net_6, d);
  tranif0 pmos_0(y, net_1, net_54);
  tranif0 pmos_1(net_1, vdd, net_6);
  tranif0 pmos_2(net_54, vdd, en);
  tranif0 pmos_3(net_6, vdd, d);
endmodule   /* LF_Adder__buftri_c_1x */

module LF_Adder__buftri8_c_1x(D, EN, Y);
  input [7:0] D;
  input EN;
  output [7:0] Y;

  supply1 vdd;
  supply0 gnd;
  LF_Adder__buftri_c_1x buftri_c_1(.d(D[0]), .en(EN), .y(Y[0]));
  LF_Adder__buftri_c_1x buftri_c_2(.d(D[1]), .en(EN), .y(Y[1]));
  LF_Adder__buftri_c_1x buftri_c_3(.d(D[2]), .en(EN), .y(Y[2]));
  LF_Adder__buftri_c_1x buftri_c_4(.d(D[3]), .en(EN), .y(Y[3]));
  LF_Adder__buftri_c_1x buftri_c_5(.d(D[4]), .en(EN), .y(Y[4]));
  LF_Adder__buftri_c_1x buftri_c_6(.d(D[5]), .en(EN), .y(Y[5]));
  LF_Adder__buftri_c_1x buftri_c_7(.d(D[6]), .en(EN), .y(Y[6]));
  LF_Adder__buftri_c_1x buftri_c_8(.d(D[7]), .en(EN), .y(Y[7]));
endmodule   /* LF_Adder__buftri8_c_1x */

module LF_Adder__inv_1x(a, y);
  input a;
  output y;

  supply1 vdd;
  supply0 gnd;
  tranif1 nmos_0(gnd, y, a);
  tranif0 pmos_0(y, vdd, a);
endmodule   /* LF_Adder__inv_1x */

module LF_Adder__nand3_1x(a, b, c, y);
  input a;
  input b;
  input c;
  output y;

  supply1 vdd;
  supply0 gnd;
  wire net_15, net_4;

  tranif1 nmos_0(net_15, net_4, b);
  tranif1 nmos_1(net_4, y, c);
  tranif1 nmos_2(gnd, net_15, a);
  tranif0 pmos_0(y, vdd, c);
  tranif0 pmos_1(y, vdd, b);
  tranif0 pmos_2(y, vdd, a);
endmodule   /* LF_Adder__nand3_1x */

module memterceptor(ADR, FFT_DATA, MEM_DATA, WRITE, ADR_IS_FFT, ADR_IS_MEM, 
      FFT_WRITE, MEM_WRITE, READ_DATA);
  input [7:0] ADR;
  input [7:0] FFT_DATA;
  input [7:0] MEM_DATA;
  input WRITE;
  output ADR_IS_FFT;
  output ADR_IS_MEM;
  output FFT_WRITE;
  output MEM_WRITE;
  output [7:0] READ_DATA;

  supply1 vdd;
  supply0 gnd;
  wire net_12;

  LF_Adder__and2_1x and2_1x_0(.a(WRITE), .b(ADR_IS_FFT), .y(FFT_WRITE));
  LF_Adder__and2_1x and2_1x_1(.a(WRITE), .b(ADR_IS_MEM), .y(MEM_WRITE));
  LF_Adder__and3_1x and3_1x_0(.a(ADR[7]), .b(ADR[6]), .c(ADR[5]), .y(net_12));
  LF_Adder__buftri8_c_1x buftri8__0(.D(MEM_DATA[7:0]), .EN(ADR_IS_MEM), 
      .Y(READ_DATA[7:0]));
  LF_Adder__buftri8_c_1x buftri8__1(.D(FFT_DATA[7:0]), .EN(ADR_IS_FFT), 
      .Y(READ_DATA[7:0]));
  LF_Adder__inv_1x inv_1x_1(.a(ADR_IS_MEM), .y(ADR_IS_FFT));
  LF_Adder__nand3_1x nand3_1x_0(.a(net_12), .b(ADR[4]), .c(ADR[3]), 
      .y(ADR_IS_MEM));
endmodule   /* memterceptor */
