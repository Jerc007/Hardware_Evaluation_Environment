
module warps_done_lut ( clk_in, host_reset, num_warps_in, warps_done_mask );
  input [4:0] num_warps_in;
  output [31:0] warps_done_mask;
  input clk_in, host_reset;
  wire   n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n69, n70, n71;

  DFFR_X1 \warps_done_mask_reg[31]  ( .D(n68), .CK(clk_in), .RN(n10), .Q(
        warps_done_mask[31]) );
  DFFR_X1 \warps_done_mask_reg[30]  ( .D(n67), .CK(clk_in), .RN(n9), .Q(
        warps_done_mask[30]) );
  DFFR_X1 \warps_done_mask_reg[29]  ( .D(n21), .CK(clk_in), .RN(n9), .Q(
        warps_done_mask[29]) );
  DFFR_X1 \warps_done_mask_reg[28]  ( .D(n66), .CK(clk_in), .RN(n9), .Q(
        warps_done_mask[28]) );
  DFFR_X1 \warps_done_mask_reg[27]  ( .D(n22), .CK(clk_in), .RN(n9), .Q(
        warps_done_mask[27]) );
  DFFR_X1 \warps_done_mask_reg[26]  ( .D(n65), .CK(clk_in), .RN(n9), .Q(
        warps_done_mask[26]) );
  DFFR_X1 \warps_done_mask_reg[25]  ( .D(n23), .CK(clk_in), .RN(n9), .Q(
        warps_done_mask[25]) );
  DFFR_X1 \warps_done_mask_reg[24]  ( .D(n64), .CK(clk_in), .RN(n9), .Q(
        warps_done_mask[24]) );
  DFFR_X1 \warps_done_mask_reg[23]  ( .D(n24), .CK(clk_in), .RN(n9), .Q(
        warps_done_mask[23]) );
  DFFR_X1 \warps_done_mask_reg[22]  ( .D(n63), .CK(clk_in), .RN(n9), .Q(
        warps_done_mask[22]) );
  DFFR_X1 \warps_done_mask_reg[21]  ( .D(n25), .CK(clk_in), .RN(n9), .Q(
        warps_done_mask[21]) );
  DFFR_X1 \warps_done_mask_reg[20]  ( .D(n62), .CK(clk_in), .RN(n9), .Q(
        warps_done_mask[20]) );
  DFFR_X1 \warps_done_mask_reg[19]  ( .D(n26), .CK(clk_in), .RN(n10), .Q(
        warps_done_mask[19]) );
  DFFR_X1 \warps_done_mask_reg[18]  ( .D(n61), .CK(clk_in), .RN(n10), .Q(
        warps_done_mask[18]) );
  DFFR_X1 \warps_done_mask_reg[17]  ( .D(n13), .CK(clk_in), .RN(n10), .Q(
        warps_done_mask[17]) );
  DFFR_X1 \warps_done_mask_reg[16]  ( .D(n60), .CK(clk_in), .RN(n10), .Q(
        warps_done_mask[16]) );
  SDFFR_X1 \warps_done_mask_reg[15]  ( .D(n13), .SI(1'b1), .SE(num_warps_in[4]), .CK(clk_in), .RN(n11), .Q(warps_done_mask[15]) );
  DFFR_X1 \warps_done_mask_reg[14]  ( .D(n14), .CK(clk_in), .RN(n10), .Q(
        warps_done_mask[14]) );
  SDFFR_X1 \warps_done_mask_reg[13]  ( .D(n59), .SI(1'b1), .SE(n43), .CK(
        clk_in), .RN(n11), .Q(warps_done_mask[13]) );
  DFFR_X1 \warps_done_mask_reg[12]  ( .D(n15), .CK(clk_in), .RN(n10), .Q(
        warps_done_mask[12]) );
  SDFFR_X1 \warps_done_mask_reg[11]  ( .D(n58), .SI(1'b1), .SE(n70), .CK(
        clk_in), .RN(n11), .Q(warps_done_mask[11]) );
  DFFR_X1 \warps_done_mask_reg[10]  ( .D(n16), .CK(clk_in), .RN(n10), .Q(
        warps_done_mask[10]) );
  SDFFR_X1 \warps_done_mask_reg[9]  ( .D(n57), .SI(1'b1), .SE(n31), .CK(clk_in), .RN(n11), .Q(warps_done_mask[9]) );
  DFFR_X1 \warps_done_mask_reg[8]  ( .D(n17), .CK(clk_in), .RN(n10), .Q(
        warps_done_mask[8]) );
  SDFFR_X1 \warps_done_mask_reg[7]  ( .D(n56), .SI(1'b1), .SE(num_warps_in[3]), 
        .CK(clk_in), .RN(n11), .Q(warps_done_mask[7]) );
  DFFR_X1 \warps_done_mask_reg[6]  ( .D(n18), .CK(clk_in), .RN(n10), .Q(
        warps_done_mask[6]) );
  SDFFR_X1 \warps_done_mask_reg[5]  ( .D(n55), .SI(1'b1), .SE(n30), .CK(clk_in), .RN(n11), .Q(warps_done_mask[5]) );
  DFFR_X1 \warps_done_mask_reg[4]  ( .D(n19), .CK(clk_in), .RN(n10), .Q(
        warps_done_mask[4]) );
  SDFFR_X1 \warps_done_mask_reg[3]  ( .D(n54), .SI(1'b1), .SE(num_warps_in[2]), 
        .CK(clk_in), .RN(n11), .Q(warps_done_mask[3]) );
  DFFR_X1 \warps_done_mask_reg[2]  ( .D(n20), .CK(clk_in), .RN(n10), .Q(
        warps_done_mask[2]) );
  SDFFR_X1 \warps_done_mask_reg[1]  ( .D(n53), .SI(1'b1), .SE(num_warps_in[1]), 
        .CK(clk_in), .RN(n11), .Q(warps_done_mask[1]) );
  DFFR_X1 \warps_done_mask_reg[0]  ( .D(1'b1), .CK(clk_in), .RN(n9), .Q(
        warps_done_mask[0]) );
  NAND2_X1 U60 ( .A1(n34), .A2(n69), .ZN(n53) );
  NAND2_X1 U61 ( .A1(n35), .A2(n36), .ZN(n54) );
  NAND2_X1 U62 ( .A1(n37), .A2(n71), .ZN(n55) );
  NAND2_X1 U63 ( .A1(n38), .A2(n39), .ZN(n56) );
  NAND2_X1 U64 ( .A1(n40), .A2(n41), .ZN(n57) );
  NAND2_X1 U65 ( .A1(n27), .A2(n42), .ZN(n58) );
  NAND2_X1 U66 ( .A1(n44), .A2(n45), .ZN(n60) );
  NAND2_X1 U67 ( .A1(num_warps_in[2]), .A2(num_warps_in[1]), .ZN(n35) );
  NAND2_X1 U68 ( .A1(num_warps_in[3]), .A2(num_warps_in[1]), .ZN(n38) );
  NAND2_X1 U69 ( .A1(num_warps_in[3]), .A2(num_warps_in[2]), .ZN(n40) );
  NAND2_X1 U70 ( .A1(num_warps_in[4]), .A2(num_warps_in[0]), .ZN(n44) );
  INV_X1 U11 ( .A(n43), .ZN(n27) );
  BUF_X1 U12 ( .A(n12), .Z(n9) );
  BUF_X1 U13 ( .A(n12), .Z(n10) );
  BUF_X1 U14 ( .A(n12), .Z(n11) );
  NOR3_X1 U15 ( .A1(n69), .A2(n28), .A3(n71), .ZN(n43) );
  OAI21_X1 U16 ( .B1(n44), .B2(n35), .A(n48), .ZN(n63) );
  OAI21_X1 U17 ( .B1(n44), .B2(n38), .A(n50), .ZN(n65) );
  OAI21_X1 U18 ( .B1(n44), .B2(n40), .A(n51), .ZN(n66) );
  OAI21_X1 U19 ( .B1(n44), .B2(n27), .A(n29), .ZN(n67) );
  INV_X1 U20 ( .A(n68), .ZN(n29) );
  OAI21_X1 U21 ( .B1(n28), .B2(n44), .A(n46), .ZN(n61) );
  OAI21_X1 U22 ( .B1(n69), .B2(n44), .A(n47), .ZN(n62) );
  OAI21_X1 U23 ( .B1(n71), .B2(n44), .A(n49), .ZN(n64) );
  INV_X1 U24 ( .A(n40), .ZN(n70) );
  INV_X1 U25 ( .A(n36), .ZN(n18) );
  INV_X1 U26 ( .A(n34), .ZN(n19) );
  INV_X1 U27 ( .A(n35), .ZN(n30) );
  INV_X1 U28 ( .A(n38), .ZN(n31) );
  INV_X1 U29 ( .A(n45), .ZN(n13) );
  INV_X1 U30 ( .A(n47), .ZN(n25) );
  INV_X1 U31 ( .A(n39), .ZN(n16) );
  INV_X1 U32 ( .A(n41), .ZN(n15) );
  INV_X1 U33 ( .A(n42), .ZN(n14) );
  INV_X1 U34 ( .A(n46), .ZN(n26) );
  INV_X1 U35 ( .A(n48), .ZN(n24) );
  INV_X1 U36 ( .A(n37), .ZN(n17) );
  INV_X1 U37 ( .A(n49), .ZN(n23) );
  INV_X1 U38 ( .A(n50), .ZN(n22) );
  INV_X1 U39 ( .A(n51), .ZN(n21) );
  INV_X1 U40 ( .A(host_reset), .ZN(n12) );
  AOI21_X1 U41 ( .B1(num_warps_in[2]), .B2(num_warps_in[4]), .A(n62), .ZN(n46)
         );
  AOI21_X1 U42 ( .B1(num_warps_in[3]), .B2(num_warps_in[4]), .A(n64), .ZN(n48)
         );
  AOI21_X1 U43 ( .B1(num_warps_in[4]), .B2(n30), .A(n63), .ZN(n47) );
  AOI21_X1 U44 ( .B1(num_warps_in[4]), .B2(n31), .A(n65), .ZN(n49) );
  AOI21_X1 U45 ( .B1(num_warps_in[4]), .B2(n70), .A(n66), .ZN(n50) );
  AOI21_X1 U46 ( .B1(num_warps_in[4]), .B2(n43), .A(n67), .ZN(n51) );
  AOI21_X1 U47 ( .B1(num_warps_in[1]), .B2(num_warps_in[4]), .A(n61), .ZN(n45)
         );
  AOI21_X1 U48 ( .B1(num_warps_in[2]), .B2(num_warps_in[0]), .A(n54), .ZN(n34)
         );
  AOI21_X1 U49 ( .B1(num_warps_in[3]), .B2(num_warps_in[0]), .A(n56), .ZN(n37)
         );
  AOI21_X1 U50 ( .B1(num_warps_in[0]), .B2(n30), .A(n55), .ZN(n36) );
  AOI21_X1 U51 ( .B1(num_warps_in[0]), .B2(n31), .A(n57), .ZN(n39) );
  AOI21_X1 U52 ( .B1(num_warps_in[0]), .B2(n70), .A(n58), .ZN(n41) );
  AOI21_X1 U53 ( .B1(num_warps_in[0]), .B2(n43), .A(n59), .ZN(n42) );
  INV_X1 U54 ( .A(num_warps_in[3]), .ZN(n71) );
  INV_X1 U55 ( .A(num_warps_in[2]), .ZN(n69) );
  INV_X1 U56 ( .A(num_warps_in[1]), .ZN(n28) );
  OR2_X1 U57 ( .A1(n60), .A2(num_warps_in[4]), .ZN(n59) );
  NOR4_X1 U58 ( .A1(num_warps_in[0]), .A2(num_warps_in[1]), .A3(n52), .A4(
        num_warps_in[2]), .ZN(n68) );
  OR2_X1 U71 ( .A1(num_warps_in[4]), .A2(num_warps_in[3]), .ZN(n52) );
  INV_X1 U72 ( .A(n33), .ZN(n20) );
  AOI21_X1 U73 ( .B1(num_warps_in[1]), .B2(num_warps_in[0]), .A(n53), .ZN(n33)
         );
endmodule
