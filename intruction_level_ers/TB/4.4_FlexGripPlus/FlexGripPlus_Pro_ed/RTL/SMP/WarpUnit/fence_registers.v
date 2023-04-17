


module fence_registers_1_0 ( clk_in, host_reset, cta_id_in, cta_id_ld, 
        fence_en_in, fence_en_ld, cta_id_out, fence_en_out );
  input [3:0] cta_id_in;
  output [3:0] cta_id_out;
  input clk_in, host_reset, cta_id_ld, fence_en_in, fence_en_ld;
  output fence_en_out;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n16, n15
;

  DFFR_X1 fence_en_out_reg ( .D(n16), .CK(clk_in), .RN(n15), .Q(fence_en_out), 
        .QN(n10) );
  DFFR_X1 \cta_id_out_reg[3]  ( .D(n14), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[3]), .QN(n9) );
  DFFR_X1 \cta_id_out_reg[2]  ( .D(n13), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[2]), .QN(n8) );
  DFFR_X1 \cta_id_out_reg[1]  ( .D(n12), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[1]), .QN(n7) );
  DFFR_X1 \cta_id_out_reg[0]  ( .D(n11), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[0]), .QN(n6) );
  NAND2_X1 U3 ( .A1(cta_id_ld), .A2(cta_id_in[0]), .ZN(n1) );
  NAND2_X1 U5 ( .A1(cta_id_in[1]), .A2(cta_id_ld), .ZN(n2) );
  NAND2_X1 U7 ( .A1(cta_id_in[2]), .A2(cta_id_ld), .ZN(n3) );
  NAND2_X1 U9 ( .A1(cta_id_in[3]), .A2(cta_id_ld), .ZN(n4) );
  NAND2_X1 U12 ( .A1(fence_en_ld), .A2(fence_en_in), .ZN(n5) );
  OAI21_X1 U2 ( .B1(n6), .B2(cta_id_ld), .A(n1), .ZN(n11) );
  OAI21_X1 U4 ( .B1(n7), .B2(cta_id_ld), .A(n2), .ZN(n12) );
  OAI21_X1 U6 ( .B1(n8), .B2(cta_id_ld), .A(n3), .ZN(n13) );
  OAI21_X1 U8 ( .B1(n9), .B2(cta_id_ld), .A(n4), .ZN(n14) );
  OAI21_X1 U10 ( .B1(n10), .B2(fence_en_ld), .A(n5), .ZN(n16) );
  INV_X1 U11 ( .A(host_reset), .ZN(n15) );
endmodule


module fence_registers_1_31 ( clk_in, host_reset, cta_id_in, cta_id_ld, 
        fence_en_in, fence_en_ld, cta_id_out, fence_en_out );
  input [3:0] cta_id_in;
  output [3:0] cta_id_out;
  input clk_in, host_reset, cta_id_ld, fence_en_in, fence_en_ld;
  output fence_en_out;
  wire   n15, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31;

  DFFR_X1 fence_en_out_reg ( .D(n17), .CK(clk_in), .RN(n15), .Q(fence_en_out), 
        .QN(n22) );
  DFFR_X1 \cta_id_out_reg[3]  ( .D(n18), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[3]), .QN(n23) );
  DFFR_X1 \cta_id_out_reg[2]  ( .D(n19), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[2]), .QN(n24) );
  DFFR_X1 \cta_id_out_reg[1]  ( .D(n20), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[1]), .QN(n25) );
  DFFR_X1 \cta_id_out_reg[0]  ( .D(n21), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[0]), .QN(n26) );
  NAND2_X1 U3 ( .A1(cta_id_ld), .A2(cta_id_in[0]), .ZN(n31) );
  NAND2_X1 U5 ( .A1(cta_id_in[1]), .A2(cta_id_ld), .ZN(n30) );
  NAND2_X1 U7 ( .A1(cta_id_in[2]), .A2(cta_id_ld), .ZN(n29) );
  NAND2_X1 U9 ( .A1(cta_id_in[3]), .A2(cta_id_ld), .ZN(n28) );
  NAND2_X1 U12 ( .A1(fence_en_ld), .A2(fence_en_in), .ZN(n27) );
  OAI21_X1 U2 ( .B1(n26), .B2(cta_id_ld), .A(n31), .ZN(n21) );
  OAI21_X1 U4 ( .B1(n25), .B2(cta_id_ld), .A(n30), .ZN(n20) );
  OAI21_X1 U6 ( .B1(n24), .B2(cta_id_ld), .A(n29), .ZN(n19) );
  OAI21_X1 U8 ( .B1(n23), .B2(cta_id_ld), .A(n28), .ZN(n18) );
  OAI21_X1 U10 ( .B1(n22), .B2(fence_en_ld), .A(n27), .ZN(n17) );
  INV_X1 U11 ( .A(host_reset), .ZN(n15) );
endmodule


module fence_registers_1_30 ( clk_in, host_reset, cta_id_in, cta_id_ld, 
        fence_en_in, fence_en_ld, cta_id_out, fence_en_out );
  input [3:0] cta_id_in;
  output [3:0] cta_id_out;
  input clk_in, host_reset, cta_id_ld, fence_en_in, fence_en_ld;
  output fence_en_out;
  wire   n15, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31;

  DFFR_X1 fence_en_out_reg ( .D(n17), .CK(clk_in), .RN(n15), .Q(fence_en_out), 
        .QN(n22) );
  DFFR_X1 \cta_id_out_reg[3]  ( .D(n18), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[3]), .QN(n23) );
  DFFR_X1 \cta_id_out_reg[2]  ( .D(n19), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[2]), .QN(n24) );
  DFFR_X1 \cta_id_out_reg[1]  ( .D(n20), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[1]), .QN(n25) );
  DFFR_X1 \cta_id_out_reg[0]  ( .D(n21), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[0]), .QN(n26) );
  NAND2_X1 U3 ( .A1(cta_id_ld), .A2(cta_id_in[0]), .ZN(n31) );
  NAND2_X1 U5 ( .A1(cta_id_in[1]), .A2(cta_id_ld), .ZN(n30) );
  NAND2_X1 U7 ( .A1(cta_id_in[2]), .A2(cta_id_ld), .ZN(n29) );
  NAND2_X1 U9 ( .A1(cta_id_in[3]), .A2(cta_id_ld), .ZN(n28) );
  NAND2_X1 U12 ( .A1(fence_en_ld), .A2(fence_en_in), .ZN(n27) );
  OAI21_X1 U2 ( .B1(n26), .B2(cta_id_ld), .A(n31), .ZN(n21) );
  OAI21_X1 U4 ( .B1(n25), .B2(cta_id_ld), .A(n30), .ZN(n20) );
  OAI21_X1 U6 ( .B1(n24), .B2(cta_id_ld), .A(n29), .ZN(n19) );
  OAI21_X1 U8 ( .B1(n23), .B2(cta_id_ld), .A(n28), .ZN(n18) );
  OAI21_X1 U10 ( .B1(n22), .B2(fence_en_ld), .A(n27), .ZN(n17) );
  INV_X1 U11 ( .A(host_reset), .ZN(n15) );
endmodule


module fence_registers_1_29 ( clk_in, host_reset, cta_id_in, cta_id_ld, 
        fence_en_in, fence_en_ld, cta_id_out, fence_en_out );
  input [3:0] cta_id_in;
  output [3:0] cta_id_out;
  input clk_in, host_reset, cta_id_ld, fence_en_in, fence_en_ld;
  output fence_en_out;
  wire   n15, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31;

  DFFR_X1 fence_en_out_reg ( .D(n17), .CK(clk_in), .RN(n15), .Q(fence_en_out), 
        .QN(n22) );
  DFFR_X1 \cta_id_out_reg[3]  ( .D(n18), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[3]), .QN(n23) );
  DFFR_X1 \cta_id_out_reg[2]  ( .D(n19), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[2]), .QN(n24) );
  DFFR_X1 \cta_id_out_reg[1]  ( .D(n20), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[1]), .QN(n25) );
  DFFR_X1 \cta_id_out_reg[0]  ( .D(n21), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[0]), .QN(n26) );
  NAND2_X1 U3 ( .A1(cta_id_ld), .A2(cta_id_in[0]), .ZN(n31) );
  NAND2_X1 U5 ( .A1(cta_id_in[1]), .A2(cta_id_ld), .ZN(n30) );
  NAND2_X1 U7 ( .A1(cta_id_in[2]), .A2(cta_id_ld), .ZN(n29) );
  NAND2_X1 U9 ( .A1(cta_id_in[3]), .A2(cta_id_ld), .ZN(n28) );
  NAND2_X1 U12 ( .A1(fence_en_ld), .A2(fence_en_in), .ZN(n27) );
  OAI21_X1 U2 ( .B1(n26), .B2(cta_id_ld), .A(n31), .ZN(n21) );
  OAI21_X1 U4 ( .B1(n25), .B2(cta_id_ld), .A(n30), .ZN(n20) );
  OAI21_X1 U6 ( .B1(n24), .B2(cta_id_ld), .A(n29), .ZN(n19) );
  OAI21_X1 U8 ( .B1(n23), .B2(cta_id_ld), .A(n28), .ZN(n18) );
  OAI21_X1 U10 ( .B1(n22), .B2(fence_en_ld), .A(n27), .ZN(n17) );
  INV_X1 U11 ( .A(host_reset), .ZN(n15) );
endmodule


module fence_registers_1_28 ( clk_in, host_reset, cta_id_in, cta_id_ld, 
        fence_en_in, fence_en_ld, cta_id_out, fence_en_out );
  input [3:0] cta_id_in;
  output [3:0] cta_id_out;
  input clk_in, host_reset, cta_id_ld, fence_en_in, fence_en_ld;
  output fence_en_out;
  wire   n15, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31;

  DFFR_X1 fence_en_out_reg ( .D(n17), .CK(clk_in), .RN(n15), .Q(fence_en_out), 
        .QN(n22) );
  DFFR_X1 \cta_id_out_reg[3]  ( .D(n18), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[3]), .QN(n23) );
  DFFR_X1 \cta_id_out_reg[2]  ( .D(n19), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[2]), .QN(n24) );
  DFFR_X1 \cta_id_out_reg[1]  ( .D(n20), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[1]), .QN(n25) );
  DFFR_X1 \cta_id_out_reg[0]  ( .D(n21), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[0]), .QN(n26) );
  NAND2_X1 U3 ( .A1(cta_id_ld), .A2(cta_id_in[0]), .ZN(n31) );
  NAND2_X1 U5 ( .A1(cta_id_in[1]), .A2(cta_id_ld), .ZN(n30) );
  NAND2_X1 U7 ( .A1(cta_id_in[2]), .A2(cta_id_ld), .ZN(n29) );
  NAND2_X1 U9 ( .A1(cta_id_in[3]), .A2(cta_id_ld), .ZN(n28) );
  NAND2_X1 U12 ( .A1(fence_en_ld), .A2(fence_en_in), .ZN(n27) );
  OAI21_X1 U2 ( .B1(n22), .B2(fence_en_ld), .A(n27), .ZN(n17) );
  OAI21_X1 U4 ( .B1(n26), .B2(cta_id_ld), .A(n31), .ZN(n21) );
  OAI21_X1 U6 ( .B1(n25), .B2(cta_id_ld), .A(n30), .ZN(n20) );
  OAI21_X1 U8 ( .B1(n24), .B2(cta_id_ld), .A(n29), .ZN(n19) );
  OAI21_X1 U10 ( .B1(n23), .B2(cta_id_ld), .A(n28), .ZN(n18) );
  INV_X1 U11 ( .A(host_reset), .ZN(n15) );
endmodule


module fence_registers_1_27 ( clk_in, host_reset, cta_id_in, cta_id_ld, 
        fence_en_in, fence_en_ld, cta_id_out, fence_en_out );
  input [3:0] cta_id_in;
  output [3:0] cta_id_out;
  input clk_in, host_reset, cta_id_ld, fence_en_in, fence_en_ld;
  output fence_en_out;
  wire   n15, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31;

  DFFR_X1 fence_en_out_reg ( .D(n17), .CK(clk_in), .RN(n15), .Q(fence_en_out), 
        .QN(n22) );
  DFFR_X1 \cta_id_out_reg[3]  ( .D(n18), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[3]), .QN(n23) );
  DFFR_X1 \cta_id_out_reg[2]  ( .D(n19), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[2]), .QN(n24) );
  DFFR_X1 \cta_id_out_reg[1]  ( .D(n20), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[1]), .QN(n25) );
  DFFR_X1 \cta_id_out_reg[0]  ( .D(n21), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[0]), .QN(n26) );
  NAND2_X1 U3 ( .A1(cta_id_ld), .A2(cta_id_in[0]), .ZN(n31) );
  NAND2_X1 U5 ( .A1(cta_id_in[1]), .A2(cta_id_ld), .ZN(n30) );
  NAND2_X1 U7 ( .A1(cta_id_in[2]), .A2(cta_id_ld), .ZN(n29) );
  NAND2_X1 U9 ( .A1(cta_id_in[3]), .A2(cta_id_ld), .ZN(n28) );
  NAND2_X1 U12 ( .A1(fence_en_ld), .A2(fence_en_in), .ZN(n27) );
  OAI21_X1 U2 ( .B1(n26), .B2(cta_id_ld), .A(n31), .ZN(n21) );
  OAI21_X1 U4 ( .B1(n25), .B2(cta_id_ld), .A(n30), .ZN(n20) );
  OAI21_X1 U6 ( .B1(n24), .B2(cta_id_ld), .A(n29), .ZN(n19) );
  OAI21_X1 U8 ( .B1(n23), .B2(cta_id_ld), .A(n28), .ZN(n18) );
  OAI21_X1 U10 ( .B1(n22), .B2(fence_en_ld), .A(n27), .ZN(n17) );
  INV_X1 U11 ( .A(host_reset), .ZN(n15) );
endmodule


module fence_registers_1_26 ( clk_in, host_reset, cta_id_in, cta_id_ld, 
        fence_en_in, fence_en_ld, cta_id_out, fence_en_out );
  input [3:0] cta_id_in;
  output [3:0] cta_id_out;
  input clk_in, host_reset, cta_id_ld, fence_en_in, fence_en_ld;
  output fence_en_out;
  wire   n15, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31;

  DFFR_X1 fence_en_out_reg ( .D(n17), .CK(clk_in), .RN(n15), .Q(fence_en_out), 
        .QN(n22) );
  DFFR_X1 \cta_id_out_reg[3]  ( .D(n18), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[3]), .QN(n23) );
  DFFR_X1 \cta_id_out_reg[2]  ( .D(n19), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[2]), .QN(n24) );
  DFFR_X1 \cta_id_out_reg[1]  ( .D(n20), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[1]), .QN(n25) );
  DFFR_X1 \cta_id_out_reg[0]  ( .D(n21), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[0]), .QN(n26) );
  NAND2_X1 U3 ( .A1(cta_id_ld), .A2(cta_id_in[0]), .ZN(n31) );
  NAND2_X1 U5 ( .A1(cta_id_in[1]), .A2(cta_id_ld), .ZN(n30) );
  NAND2_X1 U7 ( .A1(cta_id_in[2]), .A2(cta_id_ld), .ZN(n29) );
  NAND2_X1 U9 ( .A1(cta_id_in[3]), .A2(cta_id_ld), .ZN(n28) );
  NAND2_X1 U12 ( .A1(fence_en_ld), .A2(fence_en_in), .ZN(n27) );
  OAI21_X1 U2 ( .B1(n26), .B2(cta_id_ld), .A(n31), .ZN(n21) );
  OAI21_X1 U4 ( .B1(n25), .B2(cta_id_ld), .A(n30), .ZN(n20) );
  OAI21_X1 U6 ( .B1(n24), .B2(cta_id_ld), .A(n29), .ZN(n19) );
  OAI21_X1 U8 ( .B1(n23), .B2(cta_id_ld), .A(n28), .ZN(n18) );
  OAI21_X1 U10 ( .B1(n22), .B2(fence_en_ld), .A(n27), .ZN(n17) );
  INV_X1 U11 ( .A(host_reset), .ZN(n15) );
endmodule


module fence_registers_1_25 ( clk_in, host_reset, cta_id_in, cta_id_ld, 
        fence_en_in, fence_en_ld, cta_id_out, fence_en_out );
  input [3:0] cta_id_in;
  output [3:0] cta_id_out;
  input clk_in, host_reset, cta_id_ld, fence_en_in, fence_en_ld;
  output fence_en_out;
  wire   n15, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31;

  DFFR_X1 fence_en_out_reg ( .D(n17), .CK(clk_in), .RN(n15), .Q(fence_en_out), 
        .QN(n22) );
  DFFR_X1 \cta_id_out_reg[3]  ( .D(n18), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[3]), .QN(n23) );
  DFFR_X1 \cta_id_out_reg[2]  ( .D(n19), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[2]), .QN(n24) );
  DFFR_X1 \cta_id_out_reg[1]  ( .D(n20), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[1]), .QN(n25) );
  DFFR_X1 \cta_id_out_reg[0]  ( .D(n21), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[0]), .QN(n26) );
  NAND2_X1 U3 ( .A1(cta_id_ld), .A2(cta_id_in[0]), .ZN(n31) );
  NAND2_X1 U5 ( .A1(cta_id_in[1]), .A2(cta_id_ld), .ZN(n30) );
  NAND2_X1 U7 ( .A1(cta_id_in[2]), .A2(cta_id_ld), .ZN(n29) );
  NAND2_X1 U9 ( .A1(cta_id_in[3]), .A2(cta_id_ld), .ZN(n28) );
  NAND2_X1 U12 ( .A1(fence_en_ld), .A2(fence_en_in), .ZN(n27) );
  OAI21_X1 U2 ( .B1(n22), .B2(fence_en_ld), .A(n27), .ZN(n17) );
  OAI21_X1 U4 ( .B1(n26), .B2(cta_id_ld), .A(n31), .ZN(n21) );
  OAI21_X1 U6 ( .B1(n25), .B2(cta_id_ld), .A(n30), .ZN(n20) );
  OAI21_X1 U8 ( .B1(n24), .B2(cta_id_ld), .A(n29), .ZN(n19) );
  OAI21_X1 U10 ( .B1(n23), .B2(cta_id_ld), .A(n28), .ZN(n18) );
  INV_X1 U11 ( .A(host_reset), .ZN(n15) );
endmodule


module fence_registers_1_24 ( clk_in, host_reset, cta_id_in, cta_id_ld, 
        fence_en_in, fence_en_ld, cta_id_out, fence_en_out );
  input [3:0] cta_id_in;
  output [3:0] cta_id_out;
  input clk_in, host_reset, cta_id_ld, fence_en_in, fence_en_ld;
  output fence_en_out;
  wire   n15, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31;

  DFFR_X1 fence_en_out_reg ( .D(n17), .CK(clk_in), .RN(n15), .Q(fence_en_out), 
        .QN(n22) );
  DFFR_X1 \cta_id_out_reg[3]  ( .D(n18), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[3]), .QN(n23) );
  DFFR_X1 \cta_id_out_reg[2]  ( .D(n19), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[2]), .QN(n24) );
  DFFR_X1 \cta_id_out_reg[1]  ( .D(n20), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[1]), .QN(n25) );
  DFFR_X1 \cta_id_out_reg[0]  ( .D(n21), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[0]), .QN(n26) );
  NAND2_X1 U3 ( .A1(cta_id_ld), .A2(cta_id_in[0]), .ZN(n31) );
  NAND2_X1 U5 ( .A1(cta_id_in[1]), .A2(cta_id_ld), .ZN(n30) );
  NAND2_X1 U7 ( .A1(cta_id_in[2]), .A2(cta_id_ld), .ZN(n29) );
  NAND2_X1 U9 ( .A1(cta_id_in[3]), .A2(cta_id_ld), .ZN(n28) );
  NAND2_X1 U12 ( .A1(fence_en_ld), .A2(fence_en_in), .ZN(n27) );
  OAI21_X1 U2 ( .B1(n26), .B2(cta_id_ld), .A(n31), .ZN(n21) );
  OAI21_X1 U4 ( .B1(n25), .B2(cta_id_ld), .A(n30), .ZN(n20) );
  OAI21_X1 U6 ( .B1(n24), .B2(cta_id_ld), .A(n29), .ZN(n19) );
  OAI21_X1 U8 ( .B1(n23), .B2(cta_id_ld), .A(n28), .ZN(n18) );
  OAI21_X1 U10 ( .B1(n22), .B2(fence_en_ld), .A(n27), .ZN(n17) );
  INV_X1 U11 ( .A(host_reset), .ZN(n15) );
endmodule


module fence_registers_1_23 ( clk_in, host_reset, cta_id_in, cta_id_ld, 
        fence_en_in, fence_en_ld, cta_id_out, fence_en_out );
  input [3:0] cta_id_in;
  output [3:0] cta_id_out;
  input clk_in, host_reset, cta_id_ld, fence_en_in, fence_en_ld;
  output fence_en_out;
  wire   n15, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31;

  DFFR_X1 fence_en_out_reg ( .D(n17), .CK(clk_in), .RN(n15), .Q(fence_en_out), 
        .QN(n22) );
  DFFR_X1 \cta_id_out_reg[3]  ( .D(n18), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[3]), .QN(n23) );
  DFFR_X1 \cta_id_out_reg[2]  ( .D(n19), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[2]), .QN(n24) );
  DFFR_X1 \cta_id_out_reg[1]  ( .D(n20), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[1]), .QN(n25) );
  DFFR_X1 \cta_id_out_reg[0]  ( .D(n21), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[0]), .QN(n26) );
  NAND2_X1 U3 ( .A1(cta_id_ld), .A2(cta_id_in[0]), .ZN(n31) );
  NAND2_X1 U5 ( .A1(cta_id_in[1]), .A2(cta_id_ld), .ZN(n30) );
  NAND2_X1 U7 ( .A1(cta_id_in[2]), .A2(cta_id_ld), .ZN(n29) );
  NAND2_X1 U9 ( .A1(cta_id_in[3]), .A2(cta_id_ld), .ZN(n28) );
  NAND2_X1 U12 ( .A1(fence_en_ld), .A2(fence_en_in), .ZN(n27) );
  OAI21_X1 U2 ( .B1(n22), .B2(fence_en_ld), .A(n27), .ZN(n17) );
  OAI21_X1 U4 ( .B1(n26), .B2(cta_id_ld), .A(n31), .ZN(n21) );
  OAI21_X1 U6 ( .B1(n25), .B2(cta_id_ld), .A(n30), .ZN(n20) );
  OAI21_X1 U8 ( .B1(n24), .B2(cta_id_ld), .A(n29), .ZN(n19) );
  OAI21_X1 U10 ( .B1(n23), .B2(cta_id_ld), .A(n28), .ZN(n18) );
  INV_X1 U11 ( .A(host_reset), .ZN(n15) );
endmodule


module fence_registers_1_22 ( clk_in, host_reset, cta_id_in, cta_id_ld, 
        fence_en_in, fence_en_ld, cta_id_out, fence_en_out );
  input [3:0] cta_id_in;
  output [3:0] cta_id_out;
  input clk_in, host_reset, cta_id_ld, fence_en_in, fence_en_ld;
  output fence_en_out;
  wire   n15, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31;

  DFFR_X1 fence_en_out_reg ( .D(n17), .CK(clk_in), .RN(n15), .Q(fence_en_out), 
        .QN(n22) );
  DFFR_X1 \cta_id_out_reg[3]  ( .D(n18), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[3]), .QN(n23) );
  DFFR_X1 \cta_id_out_reg[2]  ( .D(n19), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[2]), .QN(n24) );
  DFFR_X1 \cta_id_out_reg[1]  ( .D(n20), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[1]), .QN(n25) );
  DFFR_X1 \cta_id_out_reg[0]  ( .D(n21), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[0]), .QN(n26) );
  NAND2_X1 U3 ( .A1(cta_id_ld), .A2(cta_id_in[0]), .ZN(n31) );
  NAND2_X1 U5 ( .A1(cta_id_in[1]), .A2(cta_id_ld), .ZN(n30) );
  NAND2_X1 U7 ( .A1(cta_id_in[2]), .A2(cta_id_ld), .ZN(n29) );
  NAND2_X1 U9 ( .A1(cta_id_in[3]), .A2(cta_id_ld), .ZN(n28) );
  NAND2_X1 U12 ( .A1(fence_en_ld), .A2(fence_en_in), .ZN(n27) );
  OAI21_X1 U2 ( .B1(n26), .B2(cta_id_ld), .A(n31), .ZN(n21) );
  OAI21_X1 U4 ( .B1(n25), .B2(cta_id_ld), .A(n30), .ZN(n20) );
  OAI21_X1 U6 ( .B1(n24), .B2(cta_id_ld), .A(n29), .ZN(n19) );
  OAI21_X1 U8 ( .B1(n23), .B2(cta_id_ld), .A(n28), .ZN(n18) );
  OAI21_X1 U10 ( .B1(n22), .B2(fence_en_ld), .A(n27), .ZN(n17) );
  INV_X1 U11 ( .A(host_reset), .ZN(n15) );
endmodule


module fence_registers_1_21 ( clk_in, host_reset, cta_id_in, cta_id_ld, 
        fence_en_in, fence_en_ld, cta_id_out, fence_en_out );
  input [3:0] cta_id_in;
  output [3:0] cta_id_out;
  input clk_in, host_reset, cta_id_ld, fence_en_in, fence_en_ld;
  output fence_en_out;
  wire   n15, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31;

  DFFR_X1 fence_en_out_reg ( .D(n17), .CK(clk_in), .RN(n15), .Q(fence_en_out), 
        .QN(n22) );
  DFFR_X1 \cta_id_out_reg[3]  ( .D(n18), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[3]), .QN(n23) );
  DFFR_X1 \cta_id_out_reg[2]  ( .D(n19), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[2]), .QN(n24) );
  DFFR_X1 \cta_id_out_reg[1]  ( .D(n20), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[1]), .QN(n25) );
  DFFR_X1 \cta_id_out_reg[0]  ( .D(n21), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[0]), .QN(n26) );
  NAND2_X1 U3 ( .A1(cta_id_ld), .A2(cta_id_in[0]), .ZN(n31) );
  NAND2_X1 U5 ( .A1(cta_id_in[1]), .A2(cta_id_ld), .ZN(n30) );
  NAND2_X1 U7 ( .A1(cta_id_in[2]), .A2(cta_id_ld), .ZN(n29) );
  NAND2_X1 U9 ( .A1(cta_id_in[3]), .A2(cta_id_ld), .ZN(n28) );
  NAND2_X1 U12 ( .A1(fence_en_ld), .A2(fence_en_in), .ZN(n27) );
  OAI21_X1 U2 ( .B1(n26), .B2(cta_id_ld), .A(n31), .ZN(n21) );
  OAI21_X1 U4 ( .B1(n25), .B2(cta_id_ld), .A(n30), .ZN(n20) );
  OAI21_X1 U6 ( .B1(n24), .B2(cta_id_ld), .A(n29), .ZN(n19) );
  OAI21_X1 U8 ( .B1(n23), .B2(cta_id_ld), .A(n28), .ZN(n18) );
  OAI21_X1 U10 ( .B1(n22), .B2(fence_en_ld), .A(n27), .ZN(n17) );
  INV_X1 U11 ( .A(host_reset), .ZN(n15) );
endmodule


module fence_registers_1_20 ( clk_in, host_reset, cta_id_in, cta_id_ld, 
        fence_en_in, fence_en_ld, cta_id_out, fence_en_out );
  input [3:0] cta_id_in;
  output [3:0] cta_id_out;
  input clk_in, host_reset, cta_id_ld, fence_en_in, fence_en_ld;
  output fence_en_out;
  wire   n15, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31;

  DFFR_X1 fence_en_out_reg ( .D(n17), .CK(clk_in), .RN(n15), .Q(fence_en_out), 
        .QN(n22) );
  DFFR_X1 \cta_id_out_reg[3]  ( .D(n18), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[3]), .QN(n23) );
  DFFR_X1 \cta_id_out_reg[2]  ( .D(n19), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[2]), .QN(n24) );
  DFFR_X1 \cta_id_out_reg[1]  ( .D(n20), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[1]), .QN(n25) );
  DFFR_X1 \cta_id_out_reg[0]  ( .D(n21), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[0]), .QN(n26) );
  NAND2_X1 U3 ( .A1(cta_id_ld), .A2(cta_id_in[0]), .ZN(n31) );
  NAND2_X1 U5 ( .A1(cta_id_in[1]), .A2(cta_id_ld), .ZN(n30) );
  NAND2_X1 U7 ( .A1(cta_id_in[2]), .A2(cta_id_ld), .ZN(n29) );
  NAND2_X1 U9 ( .A1(cta_id_in[3]), .A2(cta_id_ld), .ZN(n28) );
  NAND2_X1 U12 ( .A1(fence_en_ld), .A2(fence_en_in), .ZN(n27) );
  OAI21_X1 U2 ( .B1(n26), .B2(cta_id_ld), .A(n31), .ZN(n21) );
  OAI21_X1 U4 ( .B1(n25), .B2(cta_id_ld), .A(n30), .ZN(n20) );
  OAI21_X1 U6 ( .B1(n24), .B2(cta_id_ld), .A(n29), .ZN(n19) );
  OAI21_X1 U8 ( .B1(n23), .B2(cta_id_ld), .A(n28), .ZN(n18) );
  OAI21_X1 U10 ( .B1(n22), .B2(fence_en_ld), .A(n27), .ZN(n17) );
  INV_X1 U11 ( .A(host_reset), .ZN(n15) );
endmodule


module fence_registers_1_19 ( clk_in, host_reset, cta_id_in, cta_id_ld, 
        fence_en_in, fence_en_ld, cta_id_out, fence_en_out );
  input [3:0] cta_id_in;
  output [3:0] cta_id_out;
  input clk_in, host_reset, cta_id_ld, fence_en_in, fence_en_ld;
  output fence_en_out;
  wire   n15, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31;

  DFFR_X1 fence_en_out_reg ( .D(n17), .CK(clk_in), .RN(n15), .Q(fence_en_out), 
        .QN(n22) );
  DFFR_X1 \cta_id_out_reg[3]  ( .D(n18), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[3]), .QN(n23) );
  DFFR_X1 \cta_id_out_reg[2]  ( .D(n19), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[2]), .QN(n24) );
  DFFR_X1 \cta_id_out_reg[1]  ( .D(n20), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[1]), .QN(n25) );
  DFFR_X1 \cta_id_out_reg[0]  ( .D(n21), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[0]), .QN(n26) );
  NAND2_X1 U3 ( .A1(cta_id_ld), .A2(cta_id_in[0]), .ZN(n31) );
  NAND2_X1 U5 ( .A1(cta_id_in[1]), .A2(cta_id_ld), .ZN(n30) );
  NAND2_X1 U7 ( .A1(cta_id_in[2]), .A2(cta_id_ld), .ZN(n29) );
  NAND2_X1 U9 ( .A1(cta_id_in[3]), .A2(cta_id_ld), .ZN(n28) );
  NAND2_X1 U12 ( .A1(fence_en_ld), .A2(fence_en_in), .ZN(n27) );
  OAI21_X1 U2 ( .B1(n26), .B2(cta_id_ld), .A(n31), .ZN(n21) );
  OAI21_X1 U4 ( .B1(n25), .B2(cta_id_ld), .A(n30), .ZN(n20) );
  OAI21_X1 U6 ( .B1(n24), .B2(cta_id_ld), .A(n29), .ZN(n19) );
  OAI21_X1 U8 ( .B1(n23), .B2(cta_id_ld), .A(n28), .ZN(n18) );
  OAI21_X1 U10 ( .B1(n22), .B2(fence_en_ld), .A(n27), .ZN(n17) );
  INV_X1 U11 ( .A(host_reset), .ZN(n15) );
endmodule


module fence_registers_1_18 ( clk_in, host_reset, cta_id_in, cta_id_ld, 
        fence_en_in, fence_en_ld, cta_id_out, fence_en_out );
  input [3:0] cta_id_in;
  output [3:0] cta_id_out;
  input clk_in, host_reset, cta_id_ld, fence_en_in, fence_en_ld;
  output fence_en_out;
  wire   n15, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31;

  DFFR_X1 fence_en_out_reg ( .D(n17), .CK(clk_in), .RN(n15), .Q(fence_en_out), 
        .QN(n22) );
  DFFR_X1 \cta_id_out_reg[3]  ( .D(n18), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[3]), .QN(n23) );
  DFFR_X1 \cta_id_out_reg[2]  ( .D(n19), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[2]), .QN(n24) );
  DFFR_X1 \cta_id_out_reg[1]  ( .D(n20), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[1]), .QN(n25) );
  DFFR_X1 \cta_id_out_reg[0]  ( .D(n21), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[0]), .QN(n26) );
  NAND2_X1 U3 ( .A1(cta_id_ld), .A2(cta_id_in[0]), .ZN(n31) );
  NAND2_X1 U5 ( .A1(cta_id_in[1]), .A2(cta_id_ld), .ZN(n30) );
  NAND2_X1 U7 ( .A1(cta_id_in[2]), .A2(cta_id_ld), .ZN(n29) );
  NAND2_X1 U9 ( .A1(cta_id_in[3]), .A2(cta_id_ld), .ZN(n28) );
  NAND2_X1 U12 ( .A1(fence_en_ld), .A2(fence_en_in), .ZN(n27) );
  OAI21_X1 U2 ( .B1(n26), .B2(cta_id_ld), .A(n31), .ZN(n21) );
  OAI21_X1 U4 ( .B1(n25), .B2(cta_id_ld), .A(n30), .ZN(n20) );
  OAI21_X1 U6 ( .B1(n24), .B2(cta_id_ld), .A(n29), .ZN(n19) );
  OAI21_X1 U8 ( .B1(n23), .B2(cta_id_ld), .A(n28), .ZN(n18) );
  OAI21_X1 U10 ( .B1(n22), .B2(fence_en_ld), .A(n27), .ZN(n17) );
  INV_X1 U11 ( .A(host_reset), .ZN(n15) );
endmodule


module fence_registers_1_17 ( clk_in, host_reset, cta_id_in, cta_id_ld, 
        fence_en_in, fence_en_ld, cta_id_out, fence_en_out );
  input [3:0] cta_id_in;
  output [3:0] cta_id_out;
  input clk_in, host_reset, cta_id_ld, fence_en_in, fence_en_ld;
  output fence_en_out;
  wire   n15, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31;

  DFFR_X1 fence_en_out_reg ( .D(n17), .CK(clk_in), .RN(n15), .Q(fence_en_out), 
        .QN(n22) );
  DFFR_X1 \cta_id_out_reg[3]  ( .D(n18), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[3]), .QN(n23) );
  DFFR_X1 \cta_id_out_reg[2]  ( .D(n19), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[2]), .QN(n24) );
  DFFR_X1 \cta_id_out_reg[1]  ( .D(n20), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[1]), .QN(n25) );
  DFFR_X1 \cta_id_out_reg[0]  ( .D(n21), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[0]), .QN(n26) );
  NAND2_X1 U3 ( .A1(cta_id_ld), .A2(cta_id_in[0]), .ZN(n31) );
  NAND2_X1 U5 ( .A1(cta_id_in[1]), .A2(cta_id_ld), .ZN(n30) );
  NAND2_X1 U7 ( .A1(cta_id_in[2]), .A2(cta_id_ld), .ZN(n29) );
  NAND2_X1 U9 ( .A1(cta_id_in[3]), .A2(cta_id_ld), .ZN(n28) );
  NAND2_X1 U12 ( .A1(fence_en_ld), .A2(fence_en_in), .ZN(n27) );
  OAI21_X1 U2 ( .B1(n26), .B2(cta_id_ld), .A(n31), .ZN(n21) );
  OAI21_X1 U4 ( .B1(n25), .B2(cta_id_ld), .A(n30), .ZN(n20) );
  OAI21_X1 U6 ( .B1(n24), .B2(cta_id_ld), .A(n29), .ZN(n19) );
  OAI21_X1 U8 ( .B1(n23), .B2(cta_id_ld), .A(n28), .ZN(n18) );
  OAI21_X1 U10 ( .B1(n22), .B2(fence_en_ld), .A(n27), .ZN(n17) );
  INV_X1 U11 ( .A(host_reset), .ZN(n15) );
endmodule


module fence_registers_1_16 ( clk_in, host_reset, cta_id_in, cta_id_ld, 
        fence_en_in, fence_en_ld, cta_id_out, fence_en_out );
  input [3:0] cta_id_in;
  output [3:0] cta_id_out;
  input clk_in, host_reset, cta_id_ld, fence_en_in, fence_en_ld;
  output fence_en_out;
  wire   n15, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31;

  DFFR_X1 fence_en_out_reg ( .D(n17), .CK(clk_in), .RN(n15), .Q(fence_en_out), 
        .QN(n22) );
  DFFR_X1 \cta_id_out_reg[3]  ( .D(n18), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[3]), .QN(n23) );
  DFFR_X1 \cta_id_out_reg[2]  ( .D(n19), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[2]), .QN(n24) );
  DFFR_X1 \cta_id_out_reg[1]  ( .D(n20), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[1]), .QN(n25) );
  DFFR_X1 \cta_id_out_reg[0]  ( .D(n21), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[0]), .QN(n26) );
  NAND2_X1 U3 ( .A1(cta_id_ld), .A2(cta_id_in[0]), .ZN(n31) );
  NAND2_X1 U5 ( .A1(cta_id_in[1]), .A2(cta_id_ld), .ZN(n30) );
  NAND2_X1 U7 ( .A1(cta_id_in[2]), .A2(cta_id_ld), .ZN(n29) );
  NAND2_X1 U9 ( .A1(cta_id_in[3]), .A2(cta_id_ld), .ZN(n28) );
  NAND2_X1 U12 ( .A1(fence_en_ld), .A2(fence_en_in), .ZN(n27) );
  OAI21_X1 U2 ( .B1(n26), .B2(cta_id_ld), .A(n31), .ZN(n21) );
  OAI21_X1 U4 ( .B1(n25), .B2(cta_id_ld), .A(n30), .ZN(n20) );
  OAI21_X1 U6 ( .B1(n24), .B2(cta_id_ld), .A(n29), .ZN(n19) );
  OAI21_X1 U8 ( .B1(n23), .B2(cta_id_ld), .A(n28), .ZN(n18) );
  OAI21_X1 U10 ( .B1(n22), .B2(fence_en_ld), .A(n27), .ZN(n17) );
  INV_X1 U11 ( .A(host_reset), .ZN(n15) );
endmodule


module fence_registers_1_15 ( clk_in, host_reset, cta_id_in, cta_id_ld, 
        fence_en_in, fence_en_ld, cta_id_out, fence_en_out );
  input [3:0] cta_id_in;
  output [3:0] cta_id_out;
  input clk_in, host_reset, cta_id_ld, fence_en_in, fence_en_ld;
  output fence_en_out;
  wire   n15, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31;

  DFFR_X1 fence_en_out_reg ( .D(n17), .CK(clk_in), .RN(n15), .Q(fence_en_out), 
        .QN(n22) );
  DFFR_X1 \cta_id_out_reg[3]  ( .D(n18), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[3]), .QN(n23) );
  DFFR_X1 \cta_id_out_reg[2]  ( .D(n19), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[2]), .QN(n24) );
  DFFR_X1 \cta_id_out_reg[1]  ( .D(n20), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[1]), .QN(n25) );
  DFFR_X1 \cta_id_out_reg[0]  ( .D(n21), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[0]), .QN(n26) );
  NAND2_X1 U3 ( .A1(cta_id_ld), .A2(cta_id_in[0]), .ZN(n31) );
  NAND2_X1 U5 ( .A1(cta_id_in[1]), .A2(cta_id_ld), .ZN(n30) );
  NAND2_X1 U7 ( .A1(cta_id_in[2]), .A2(cta_id_ld), .ZN(n29) );
  NAND2_X1 U9 ( .A1(cta_id_in[3]), .A2(cta_id_ld), .ZN(n28) );
  NAND2_X1 U12 ( .A1(fence_en_ld), .A2(fence_en_in), .ZN(n27) );
  OAI21_X1 U2 ( .B1(n26), .B2(cta_id_ld), .A(n31), .ZN(n21) );
  OAI21_X1 U4 ( .B1(n25), .B2(cta_id_ld), .A(n30), .ZN(n20) );
  OAI21_X1 U6 ( .B1(n24), .B2(cta_id_ld), .A(n29), .ZN(n19) );
  OAI21_X1 U8 ( .B1(n23), .B2(cta_id_ld), .A(n28), .ZN(n18) );
  OAI21_X1 U10 ( .B1(n22), .B2(fence_en_ld), .A(n27), .ZN(n17) );
  INV_X1 U11 ( .A(host_reset), .ZN(n15) );
endmodule


module fence_registers_1_14 ( clk_in, host_reset, cta_id_in, cta_id_ld, 
        fence_en_in, fence_en_ld, cta_id_out, fence_en_out );
  input [3:0] cta_id_in;
  output [3:0] cta_id_out;
  input clk_in, host_reset, cta_id_ld, fence_en_in, fence_en_ld;
  output fence_en_out;
  wire   n15, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31;

  DFFR_X1 fence_en_out_reg ( .D(n17), .CK(clk_in), .RN(n15), .Q(fence_en_out), 
        .QN(n22) );
  DFFR_X1 \cta_id_out_reg[3]  ( .D(n18), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[3]), .QN(n23) );
  DFFR_X1 \cta_id_out_reg[2]  ( .D(n19), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[2]), .QN(n24) );
  DFFR_X1 \cta_id_out_reg[1]  ( .D(n20), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[1]), .QN(n25) );
  DFFR_X1 \cta_id_out_reg[0]  ( .D(n21), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[0]), .QN(n26) );
  NAND2_X1 U3 ( .A1(cta_id_ld), .A2(cta_id_in[0]), .ZN(n31) );
  NAND2_X1 U5 ( .A1(cta_id_in[1]), .A2(cta_id_ld), .ZN(n30) );
  NAND2_X1 U7 ( .A1(cta_id_in[2]), .A2(cta_id_ld), .ZN(n29) );
  NAND2_X1 U9 ( .A1(cta_id_in[3]), .A2(cta_id_ld), .ZN(n28) );
  NAND2_X1 U12 ( .A1(fence_en_ld), .A2(fence_en_in), .ZN(n27) );
  OAI21_X1 U2 ( .B1(n26), .B2(cta_id_ld), .A(n31), .ZN(n21) );
  OAI21_X1 U4 ( .B1(n25), .B2(cta_id_ld), .A(n30), .ZN(n20) );
  OAI21_X1 U6 ( .B1(n24), .B2(cta_id_ld), .A(n29), .ZN(n19) );
  OAI21_X1 U8 ( .B1(n23), .B2(cta_id_ld), .A(n28), .ZN(n18) );
  OAI21_X1 U10 ( .B1(n22), .B2(fence_en_ld), .A(n27), .ZN(n17) );
  INV_X1 U11 ( .A(host_reset), .ZN(n15) );
endmodule


module fence_registers_1_13 ( clk_in, host_reset, cta_id_in, cta_id_ld, 
        fence_en_in, fence_en_ld, cta_id_out, fence_en_out );
  input [3:0] cta_id_in;
  output [3:0] cta_id_out;
  input clk_in, host_reset, cta_id_ld, fence_en_in, fence_en_ld;
  output fence_en_out;
  wire   n15, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31;

  DFFR_X1 fence_en_out_reg ( .D(n17), .CK(clk_in), .RN(n15), .Q(fence_en_out), 
        .QN(n22) );
  DFFR_X1 \cta_id_out_reg[3]  ( .D(n18), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[3]), .QN(n23) );
  DFFR_X1 \cta_id_out_reg[2]  ( .D(n19), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[2]), .QN(n24) );
  DFFR_X1 \cta_id_out_reg[1]  ( .D(n20), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[1]), .QN(n25) );
  DFFR_X1 \cta_id_out_reg[0]  ( .D(n21), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[0]), .QN(n26) );
  NAND2_X1 U3 ( .A1(cta_id_ld), .A2(cta_id_in[0]), .ZN(n31) );
  NAND2_X1 U5 ( .A1(cta_id_in[1]), .A2(cta_id_ld), .ZN(n30) );
  NAND2_X1 U7 ( .A1(cta_id_in[2]), .A2(cta_id_ld), .ZN(n29) );
  NAND2_X1 U9 ( .A1(cta_id_in[3]), .A2(cta_id_ld), .ZN(n28) );
  NAND2_X1 U12 ( .A1(fence_en_ld), .A2(fence_en_in), .ZN(n27) );
  OAI21_X1 U2 ( .B1(n26), .B2(cta_id_ld), .A(n31), .ZN(n21) );
  OAI21_X1 U4 ( .B1(n25), .B2(cta_id_ld), .A(n30), .ZN(n20) );
  OAI21_X1 U6 ( .B1(n24), .B2(cta_id_ld), .A(n29), .ZN(n19) );
  OAI21_X1 U8 ( .B1(n23), .B2(cta_id_ld), .A(n28), .ZN(n18) );
  OAI21_X1 U10 ( .B1(n22), .B2(fence_en_ld), .A(n27), .ZN(n17) );
  INV_X1 U11 ( .A(host_reset), .ZN(n15) );
endmodule


module fence_registers_1_12 ( clk_in, host_reset, cta_id_in, cta_id_ld, 
        fence_en_in, fence_en_ld, cta_id_out, fence_en_out );
  input [3:0] cta_id_in;
  output [3:0] cta_id_out;
  input clk_in, host_reset, cta_id_ld, fence_en_in, fence_en_ld;
  output fence_en_out;
  wire   n15, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31;

  DFFR_X1 fence_en_out_reg ( .D(n17), .CK(clk_in), .RN(n15), .Q(fence_en_out), 
        .QN(n22) );
  DFFR_X1 \cta_id_out_reg[3]  ( .D(n18), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[3]), .QN(n23) );
  DFFR_X1 \cta_id_out_reg[2]  ( .D(n19), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[2]), .QN(n24) );
  DFFR_X1 \cta_id_out_reg[1]  ( .D(n20), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[1]), .QN(n25) );
  DFFR_X1 \cta_id_out_reg[0]  ( .D(n21), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[0]), .QN(n26) );
  NAND2_X1 U3 ( .A1(cta_id_ld), .A2(cta_id_in[0]), .ZN(n31) );
  NAND2_X1 U5 ( .A1(cta_id_in[1]), .A2(cta_id_ld), .ZN(n30) );
  NAND2_X1 U7 ( .A1(cta_id_in[2]), .A2(cta_id_ld), .ZN(n29) );
  NAND2_X1 U9 ( .A1(cta_id_in[3]), .A2(cta_id_ld), .ZN(n28) );
  NAND2_X1 U12 ( .A1(fence_en_ld), .A2(fence_en_in), .ZN(n27) );
  OAI21_X1 U2 ( .B1(n26), .B2(cta_id_ld), .A(n31), .ZN(n21) );
  OAI21_X1 U4 ( .B1(n25), .B2(cta_id_ld), .A(n30), .ZN(n20) );
  OAI21_X1 U6 ( .B1(n24), .B2(cta_id_ld), .A(n29), .ZN(n19) );
  OAI21_X1 U8 ( .B1(n23), .B2(cta_id_ld), .A(n28), .ZN(n18) );
  OAI21_X1 U10 ( .B1(n22), .B2(fence_en_ld), .A(n27), .ZN(n17) );
  INV_X1 U11 ( .A(host_reset), .ZN(n15) );
endmodule


module fence_registers_1_11 ( clk_in, host_reset, cta_id_in, cta_id_ld, 
        fence_en_in, fence_en_ld, cta_id_out, fence_en_out );
  input [3:0] cta_id_in;
  output [3:0] cta_id_out;
  input clk_in, host_reset, cta_id_ld, fence_en_in, fence_en_ld;
  output fence_en_out;
  wire   n15, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31;

  DFFR_X1 fence_en_out_reg ( .D(n17), .CK(clk_in), .RN(n15), .Q(fence_en_out), 
        .QN(n22) );
  DFFR_X1 \cta_id_out_reg[3]  ( .D(n18), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[3]), .QN(n23) );
  DFFR_X1 \cta_id_out_reg[2]  ( .D(n19), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[2]), .QN(n24) );
  DFFR_X1 \cta_id_out_reg[1]  ( .D(n20), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[1]), .QN(n25) );
  DFFR_X1 \cta_id_out_reg[0]  ( .D(n21), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[0]), .QN(n26) );
  NAND2_X1 U3 ( .A1(cta_id_ld), .A2(cta_id_in[0]), .ZN(n31) );
  NAND2_X1 U5 ( .A1(cta_id_in[1]), .A2(cta_id_ld), .ZN(n30) );
  NAND2_X1 U7 ( .A1(cta_id_in[2]), .A2(cta_id_ld), .ZN(n29) );
  NAND2_X1 U9 ( .A1(cta_id_in[3]), .A2(cta_id_ld), .ZN(n28) );
  NAND2_X1 U12 ( .A1(fence_en_ld), .A2(fence_en_in), .ZN(n27) );
  OAI21_X1 U2 ( .B1(n26), .B2(cta_id_ld), .A(n31), .ZN(n21) );
  OAI21_X1 U4 ( .B1(n25), .B2(cta_id_ld), .A(n30), .ZN(n20) );
  OAI21_X1 U6 ( .B1(n24), .B2(cta_id_ld), .A(n29), .ZN(n19) );
  OAI21_X1 U8 ( .B1(n23), .B2(cta_id_ld), .A(n28), .ZN(n18) );
  OAI21_X1 U10 ( .B1(n22), .B2(fence_en_ld), .A(n27), .ZN(n17) );
  INV_X1 U11 ( .A(host_reset), .ZN(n15) );
endmodule


module fence_registers_1_10 ( clk_in, host_reset, cta_id_in, cta_id_ld, 
        fence_en_in, fence_en_ld, cta_id_out, fence_en_out );
  input [3:0] cta_id_in;
  output [3:0] cta_id_out;
  input clk_in, host_reset, cta_id_ld, fence_en_in, fence_en_ld;
  output fence_en_out;
  wire   n15, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31;

  DFFR_X1 fence_en_out_reg ( .D(n17), .CK(clk_in), .RN(n15), .Q(fence_en_out), 
        .QN(n22) );
  DFFR_X1 \cta_id_out_reg[3]  ( .D(n18), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[3]), .QN(n23) );
  DFFR_X1 \cta_id_out_reg[2]  ( .D(n19), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[2]), .QN(n24) );
  DFFR_X1 \cta_id_out_reg[1]  ( .D(n20), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[1]), .QN(n25) );
  DFFR_X1 \cta_id_out_reg[0]  ( .D(n21), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[0]), .QN(n26) );
  NAND2_X1 U3 ( .A1(cta_id_ld), .A2(cta_id_in[0]), .ZN(n31) );
  NAND2_X1 U5 ( .A1(cta_id_in[1]), .A2(cta_id_ld), .ZN(n30) );
  NAND2_X1 U7 ( .A1(cta_id_in[2]), .A2(cta_id_ld), .ZN(n29) );
  NAND2_X1 U9 ( .A1(cta_id_in[3]), .A2(cta_id_ld), .ZN(n28) );
  NAND2_X1 U12 ( .A1(fence_en_ld), .A2(fence_en_in), .ZN(n27) );
  OAI21_X1 U2 ( .B1(n26), .B2(cta_id_ld), .A(n31), .ZN(n21) );
  OAI21_X1 U4 ( .B1(n25), .B2(cta_id_ld), .A(n30), .ZN(n20) );
  OAI21_X1 U6 ( .B1(n24), .B2(cta_id_ld), .A(n29), .ZN(n19) );
  OAI21_X1 U8 ( .B1(n23), .B2(cta_id_ld), .A(n28), .ZN(n18) );
  OAI21_X1 U10 ( .B1(n22), .B2(fence_en_ld), .A(n27), .ZN(n17) );
  INV_X1 U11 ( .A(host_reset), .ZN(n15) );
endmodule


module fence_registers_1_9 ( clk_in, host_reset, cta_id_in, cta_id_ld, 
        fence_en_in, fence_en_ld, cta_id_out, fence_en_out );
  input [3:0] cta_id_in;
  output [3:0] cta_id_out;
  input clk_in, host_reset, cta_id_ld, fence_en_in, fence_en_ld;
  output fence_en_out;
  wire   n15, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31;

  DFFR_X1 fence_en_out_reg ( .D(n17), .CK(clk_in), .RN(n15), .Q(fence_en_out), 
        .QN(n22) );
  DFFR_X1 \cta_id_out_reg[3]  ( .D(n18), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[3]), .QN(n23) );
  DFFR_X1 \cta_id_out_reg[2]  ( .D(n19), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[2]), .QN(n24) );
  DFFR_X1 \cta_id_out_reg[1]  ( .D(n20), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[1]), .QN(n25) );
  DFFR_X1 \cta_id_out_reg[0]  ( .D(n21), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[0]), .QN(n26) );
  NAND2_X1 U3 ( .A1(cta_id_ld), .A2(cta_id_in[0]), .ZN(n31) );
  NAND2_X1 U5 ( .A1(cta_id_in[1]), .A2(cta_id_ld), .ZN(n30) );
  NAND2_X1 U7 ( .A1(cta_id_in[2]), .A2(cta_id_ld), .ZN(n29) );
  NAND2_X1 U9 ( .A1(cta_id_in[3]), .A2(cta_id_ld), .ZN(n28) );
  NAND2_X1 U12 ( .A1(fence_en_ld), .A2(fence_en_in), .ZN(n27) );
  OAI21_X1 U2 ( .B1(n26), .B2(cta_id_ld), .A(n31), .ZN(n21) );
  OAI21_X1 U4 ( .B1(n25), .B2(cta_id_ld), .A(n30), .ZN(n20) );
  OAI21_X1 U6 ( .B1(n24), .B2(cta_id_ld), .A(n29), .ZN(n19) );
  OAI21_X1 U8 ( .B1(n23), .B2(cta_id_ld), .A(n28), .ZN(n18) );
  OAI21_X1 U10 ( .B1(n22), .B2(fence_en_ld), .A(n27), .ZN(n17) );
  INV_X1 U11 ( .A(host_reset), .ZN(n15) );
endmodule


module fence_registers_1_8 ( clk_in, host_reset, cta_id_in, cta_id_ld, 
        fence_en_in, fence_en_ld, cta_id_out, fence_en_out );
  input [3:0] cta_id_in;
  output [3:0] cta_id_out;
  input clk_in, host_reset, cta_id_ld, fence_en_in, fence_en_ld;
  output fence_en_out;
  wire   n15, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31;

  DFFR_X1 fence_en_out_reg ( .D(n17), .CK(clk_in), .RN(n15), .Q(fence_en_out), 
        .QN(n22) );
  DFFR_X1 \cta_id_out_reg[3]  ( .D(n18), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[3]), .QN(n23) );
  DFFR_X1 \cta_id_out_reg[2]  ( .D(n19), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[2]), .QN(n24) );
  DFFR_X1 \cta_id_out_reg[1]  ( .D(n20), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[1]), .QN(n25) );
  DFFR_X1 \cta_id_out_reg[0]  ( .D(n21), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[0]), .QN(n26) );
  NAND2_X1 U3 ( .A1(cta_id_ld), .A2(cta_id_in[0]), .ZN(n31) );
  NAND2_X1 U5 ( .A1(cta_id_in[1]), .A2(cta_id_ld), .ZN(n30) );
  NAND2_X1 U7 ( .A1(cta_id_in[2]), .A2(cta_id_ld), .ZN(n29) );
  NAND2_X1 U9 ( .A1(cta_id_in[3]), .A2(cta_id_ld), .ZN(n28) );
  NAND2_X1 U12 ( .A1(fence_en_ld), .A2(fence_en_in), .ZN(n27) );
  OAI21_X1 U2 ( .B1(n26), .B2(cta_id_ld), .A(n31), .ZN(n21) );
  OAI21_X1 U4 ( .B1(n25), .B2(cta_id_ld), .A(n30), .ZN(n20) );
  OAI21_X1 U6 ( .B1(n24), .B2(cta_id_ld), .A(n29), .ZN(n19) );
  OAI21_X1 U8 ( .B1(n23), .B2(cta_id_ld), .A(n28), .ZN(n18) );
  OAI21_X1 U10 ( .B1(n22), .B2(fence_en_ld), .A(n27), .ZN(n17) );
  INV_X1 U11 ( .A(host_reset), .ZN(n15) );
endmodule


module fence_registers_1_7 ( clk_in, host_reset, cta_id_in, cta_id_ld, 
        fence_en_in, fence_en_ld, cta_id_out, fence_en_out );
  input [3:0] cta_id_in;
  output [3:0] cta_id_out;
  input clk_in, host_reset, cta_id_ld, fence_en_in, fence_en_ld;
  output fence_en_out;
  wire   n15, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31;

  DFFR_X1 fence_en_out_reg ( .D(n17), .CK(clk_in), .RN(n15), .Q(fence_en_out), 
        .QN(n22) );
  DFFR_X1 \cta_id_out_reg[3]  ( .D(n18), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[3]), .QN(n23) );
  DFFR_X1 \cta_id_out_reg[2]  ( .D(n19), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[2]), .QN(n24) );
  DFFR_X1 \cta_id_out_reg[1]  ( .D(n20), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[1]), .QN(n25) );
  DFFR_X1 \cta_id_out_reg[0]  ( .D(n21), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[0]), .QN(n26) );
  NAND2_X1 U3 ( .A1(cta_id_ld), .A2(cta_id_in[0]), .ZN(n31) );
  NAND2_X1 U5 ( .A1(cta_id_in[1]), .A2(cta_id_ld), .ZN(n30) );
  NAND2_X1 U7 ( .A1(cta_id_in[2]), .A2(cta_id_ld), .ZN(n29) );
  NAND2_X1 U9 ( .A1(cta_id_in[3]), .A2(cta_id_ld), .ZN(n28) );
  NAND2_X1 U12 ( .A1(fence_en_ld), .A2(fence_en_in), .ZN(n27) );
  OAI21_X1 U2 ( .B1(n26), .B2(cta_id_ld), .A(n31), .ZN(n21) );
  OAI21_X1 U4 ( .B1(n25), .B2(cta_id_ld), .A(n30), .ZN(n20) );
  OAI21_X1 U6 ( .B1(n24), .B2(cta_id_ld), .A(n29), .ZN(n19) );
  OAI21_X1 U8 ( .B1(n23), .B2(cta_id_ld), .A(n28), .ZN(n18) );
  OAI21_X1 U10 ( .B1(n22), .B2(fence_en_ld), .A(n27), .ZN(n17) );
  INV_X1 U11 ( .A(host_reset), .ZN(n15) );
endmodule


module fence_registers_1_6 ( clk_in, host_reset, cta_id_in, cta_id_ld, 
        fence_en_in, fence_en_ld, cta_id_out, fence_en_out );
  input [3:0] cta_id_in;
  output [3:0] cta_id_out;
  input clk_in, host_reset, cta_id_ld, fence_en_in, fence_en_ld;
  output fence_en_out;
  wire   n15, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31;

  DFFR_X1 fence_en_out_reg ( .D(n17), .CK(clk_in), .RN(n15), .Q(fence_en_out), 
        .QN(n22) );
  DFFR_X1 \cta_id_out_reg[3]  ( .D(n18), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[3]), .QN(n23) );
  DFFR_X1 \cta_id_out_reg[2]  ( .D(n19), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[2]), .QN(n24) );
  DFFR_X1 \cta_id_out_reg[1]  ( .D(n20), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[1]), .QN(n25) );
  DFFR_X1 \cta_id_out_reg[0]  ( .D(n21), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[0]), .QN(n26) );
  NAND2_X1 U3 ( .A1(cta_id_ld), .A2(cta_id_in[0]), .ZN(n31) );
  NAND2_X1 U5 ( .A1(cta_id_in[1]), .A2(cta_id_ld), .ZN(n30) );
  NAND2_X1 U7 ( .A1(cta_id_in[2]), .A2(cta_id_ld), .ZN(n29) );
  NAND2_X1 U9 ( .A1(cta_id_in[3]), .A2(cta_id_ld), .ZN(n28) );
  NAND2_X1 U12 ( .A1(fence_en_ld), .A2(fence_en_in), .ZN(n27) );
  OAI21_X1 U2 ( .B1(n26), .B2(cta_id_ld), .A(n31), .ZN(n21) );
  OAI21_X1 U4 ( .B1(n25), .B2(cta_id_ld), .A(n30), .ZN(n20) );
  OAI21_X1 U6 ( .B1(n24), .B2(cta_id_ld), .A(n29), .ZN(n19) );
  OAI21_X1 U8 ( .B1(n23), .B2(cta_id_ld), .A(n28), .ZN(n18) );
  OAI21_X1 U10 ( .B1(n22), .B2(fence_en_ld), .A(n27), .ZN(n17) );
  INV_X1 U11 ( .A(host_reset), .ZN(n15) );
endmodule


module fence_registers_1_5 ( clk_in, host_reset, cta_id_in, cta_id_ld, 
        fence_en_in, fence_en_ld, cta_id_out, fence_en_out );
  input [3:0] cta_id_in;
  output [3:0] cta_id_out;
  input clk_in, host_reset, cta_id_ld, fence_en_in, fence_en_ld;
  output fence_en_out;
  wire   n15, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31;

  DFFR_X1 fence_en_out_reg ( .D(n17), .CK(clk_in), .RN(n15), .Q(fence_en_out), 
        .QN(n22) );
  DFFR_X1 \cta_id_out_reg[3]  ( .D(n18), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[3]), .QN(n23) );
  DFFR_X1 \cta_id_out_reg[2]  ( .D(n19), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[2]), .QN(n24) );
  DFFR_X1 \cta_id_out_reg[1]  ( .D(n20), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[1]), .QN(n25) );
  DFFR_X1 \cta_id_out_reg[0]  ( .D(n21), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[0]), .QN(n26) );
  NAND2_X1 U3 ( .A1(cta_id_ld), .A2(cta_id_in[0]), .ZN(n31) );
  NAND2_X1 U5 ( .A1(cta_id_in[1]), .A2(cta_id_ld), .ZN(n30) );
  NAND2_X1 U7 ( .A1(cta_id_in[2]), .A2(cta_id_ld), .ZN(n29) );
  NAND2_X1 U9 ( .A1(cta_id_in[3]), .A2(cta_id_ld), .ZN(n28) );
  NAND2_X1 U12 ( .A1(fence_en_ld), .A2(fence_en_in), .ZN(n27) );
  OAI21_X1 U2 ( .B1(n26), .B2(cta_id_ld), .A(n31), .ZN(n21) );
  OAI21_X1 U4 ( .B1(n25), .B2(cta_id_ld), .A(n30), .ZN(n20) );
  OAI21_X1 U6 ( .B1(n24), .B2(cta_id_ld), .A(n29), .ZN(n19) );
  OAI21_X1 U8 ( .B1(n23), .B2(cta_id_ld), .A(n28), .ZN(n18) );
  OAI21_X1 U10 ( .B1(n22), .B2(fence_en_ld), .A(n27), .ZN(n17) );
  INV_X1 U11 ( .A(host_reset), .ZN(n15) );
endmodule


module fence_registers_1_4 ( clk_in, host_reset, cta_id_in, cta_id_ld, 
        fence_en_in, fence_en_ld, cta_id_out, fence_en_out );
  input [3:0] cta_id_in;
  output [3:0] cta_id_out;
  input clk_in, host_reset, cta_id_ld, fence_en_in, fence_en_ld;
  output fence_en_out;
  wire   n15, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31;

  DFFR_X1 fence_en_out_reg ( .D(n17), .CK(clk_in), .RN(n15), .Q(fence_en_out), 
        .QN(n22) );
  DFFR_X1 \cta_id_out_reg[3]  ( .D(n18), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[3]), .QN(n23) );
  DFFR_X1 \cta_id_out_reg[2]  ( .D(n19), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[2]), .QN(n24) );
  DFFR_X1 \cta_id_out_reg[1]  ( .D(n20), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[1]), .QN(n25) );
  DFFR_X1 \cta_id_out_reg[0]  ( .D(n21), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[0]), .QN(n26) );
  NAND2_X1 U3 ( .A1(cta_id_ld), .A2(cta_id_in[0]), .ZN(n31) );
  NAND2_X1 U5 ( .A1(cta_id_in[1]), .A2(cta_id_ld), .ZN(n30) );
  NAND2_X1 U7 ( .A1(cta_id_in[2]), .A2(cta_id_ld), .ZN(n29) );
  NAND2_X1 U9 ( .A1(cta_id_in[3]), .A2(cta_id_ld), .ZN(n28) );
  NAND2_X1 U12 ( .A1(fence_en_ld), .A2(fence_en_in), .ZN(n27) );
  OAI21_X1 U2 ( .B1(n26), .B2(cta_id_ld), .A(n31), .ZN(n21) );
  OAI21_X1 U4 ( .B1(n25), .B2(cta_id_ld), .A(n30), .ZN(n20) );
  OAI21_X1 U6 ( .B1(n24), .B2(cta_id_ld), .A(n29), .ZN(n19) );
  OAI21_X1 U8 ( .B1(n23), .B2(cta_id_ld), .A(n28), .ZN(n18) );
  OAI21_X1 U10 ( .B1(n22), .B2(fence_en_ld), .A(n27), .ZN(n17) );
  INV_X1 U11 ( .A(host_reset), .ZN(n15) );
endmodule


module fence_registers_1_3 ( clk_in, host_reset, cta_id_in, cta_id_ld, 
        fence_en_in, fence_en_ld, cta_id_out, fence_en_out );
  input [3:0] cta_id_in;
  output [3:0] cta_id_out;
  input clk_in, host_reset, cta_id_ld, fence_en_in, fence_en_ld;
  output fence_en_out;
  wire   n15, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31;

  DFFR_X1 fence_en_out_reg ( .D(n17), .CK(clk_in), .RN(n15), .Q(fence_en_out), 
        .QN(n22) );
  DFFR_X1 \cta_id_out_reg[3]  ( .D(n18), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[3]), .QN(n23) );
  DFFR_X1 \cta_id_out_reg[2]  ( .D(n19), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[2]), .QN(n24) );
  DFFR_X1 \cta_id_out_reg[1]  ( .D(n20), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[1]), .QN(n25) );
  DFFR_X1 \cta_id_out_reg[0]  ( .D(n21), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[0]), .QN(n26) );
  NAND2_X1 U3 ( .A1(cta_id_ld), .A2(cta_id_in[0]), .ZN(n31) );
  NAND2_X1 U5 ( .A1(cta_id_in[1]), .A2(cta_id_ld), .ZN(n30) );
  NAND2_X1 U7 ( .A1(cta_id_in[2]), .A2(cta_id_ld), .ZN(n29) );
  NAND2_X1 U9 ( .A1(cta_id_in[3]), .A2(cta_id_ld), .ZN(n28) );
  NAND2_X1 U12 ( .A1(fence_en_ld), .A2(fence_en_in), .ZN(n27) );
  OAI21_X1 U2 ( .B1(n26), .B2(cta_id_ld), .A(n31), .ZN(n21) );
  OAI21_X1 U4 ( .B1(n25), .B2(cta_id_ld), .A(n30), .ZN(n20) );
  OAI21_X1 U6 ( .B1(n24), .B2(cta_id_ld), .A(n29), .ZN(n19) );
  OAI21_X1 U8 ( .B1(n23), .B2(cta_id_ld), .A(n28), .ZN(n18) );
  OAI21_X1 U10 ( .B1(n22), .B2(fence_en_ld), .A(n27), .ZN(n17) );
  INV_X1 U11 ( .A(host_reset), .ZN(n15) );
endmodule


module fence_registers_1_2 ( clk_in, host_reset, cta_id_in, cta_id_ld, 
        fence_en_in, fence_en_ld, cta_id_out, fence_en_out );
  input [3:0] cta_id_in;
  output [3:0] cta_id_out;
  input clk_in, host_reset, cta_id_ld, fence_en_in, fence_en_ld;
  output fence_en_out;
  wire   n15, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31;

  DFFR_X1 fence_en_out_reg ( .D(n17), .CK(clk_in), .RN(n15), .Q(fence_en_out), 
        .QN(n22) );
  DFFR_X1 \cta_id_out_reg[3]  ( .D(n18), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[3]), .QN(n23) );
  DFFR_X1 \cta_id_out_reg[2]  ( .D(n19), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[2]), .QN(n24) );
  DFFR_X1 \cta_id_out_reg[1]  ( .D(n20), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[1]), .QN(n25) );
  DFFR_X1 \cta_id_out_reg[0]  ( .D(n21), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[0]), .QN(n26) );
  NAND2_X1 U3 ( .A1(cta_id_ld), .A2(cta_id_in[0]), .ZN(n31) );
  NAND2_X1 U5 ( .A1(cta_id_in[1]), .A2(cta_id_ld), .ZN(n30) );
  NAND2_X1 U7 ( .A1(cta_id_in[2]), .A2(cta_id_ld), .ZN(n29) );
  NAND2_X1 U9 ( .A1(cta_id_in[3]), .A2(cta_id_ld), .ZN(n28) );
  NAND2_X1 U12 ( .A1(fence_en_ld), .A2(fence_en_in), .ZN(n27) );
  OAI21_X1 U2 ( .B1(n22), .B2(fence_en_ld), .A(n27), .ZN(n17) );
  OAI21_X1 U4 ( .B1(n26), .B2(cta_id_ld), .A(n31), .ZN(n21) );
  OAI21_X1 U6 ( .B1(n25), .B2(cta_id_ld), .A(n30), .ZN(n20) );
  OAI21_X1 U8 ( .B1(n24), .B2(cta_id_ld), .A(n29), .ZN(n19) );
  OAI21_X1 U10 ( .B1(n23), .B2(cta_id_ld), .A(n28), .ZN(n18) );
  INV_X1 U11 ( .A(host_reset), .ZN(n15) );
endmodule


module fence_registers_1_1 ( clk_in, host_reset, cta_id_in, cta_id_ld, 
        fence_en_in, fence_en_ld, cta_id_out, fence_en_out );
  input [3:0] cta_id_in;
  output [3:0] cta_id_out;
  input clk_in, host_reset, cta_id_ld, fence_en_in, fence_en_ld;
  output fence_en_out;
  wire   n15, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31;

  DFFR_X1 fence_en_out_reg ( .D(n17), .CK(clk_in), .RN(n15), .Q(fence_en_out), 
        .QN(n22) );
  DFFR_X1 \cta_id_out_reg[3]  ( .D(n18), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[3]), .QN(n23) );
  DFFR_X1 \cta_id_out_reg[2]  ( .D(n19), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[2]), .QN(n24) );
  DFFR_X1 \cta_id_out_reg[1]  ( .D(n20), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[1]), .QN(n25) );
  DFFR_X1 \cta_id_out_reg[0]  ( .D(n21), .CK(clk_in), .RN(n15), .Q(
        cta_id_out[0]), .QN(n26) );
  NAND2_X1 U3 ( .A1(cta_id_ld), .A2(cta_id_in[0]), .ZN(n31) );
  NAND2_X1 U5 ( .A1(cta_id_in[1]), .A2(cta_id_ld), .ZN(n30) );
  NAND2_X1 U7 ( .A1(cta_id_in[2]), .A2(cta_id_ld), .ZN(n29) );
  NAND2_X1 U9 ( .A1(cta_id_in[3]), .A2(cta_id_ld), .ZN(n28) );
  NAND2_X1 U12 ( .A1(fence_en_ld), .A2(fence_en_in), .ZN(n27) );
  OAI21_X1 U2 ( .B1(n26), .B2(cta_id_ld), .A(n31), .ZN(n21) );
  OAI21_X1 U4 ( .B1(n25), .B2(cta_id_ld), .A(n30), .ZN(n20) );
  OAI21_X1 U6 ( .B1(n24), .B2(cta_id_ld), .A(n29), .ZN(n19) );
  OAI21_X1 U8 ( .B1(n23), .B2(cta_id_ld), .A(n28), .ZN(n18) );
  OAI21_X1 U10 ( .B1(n22), .B2(fence_en_ld), .A(n27), .ZN(n17) );
  INV_X1 U11 ( .A(host_reset), .ZN(n15) );
endmodule




