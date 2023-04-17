



module warp_id_calc_1_DW02_mult_1 ( A, B, TC, PRODUCT );
  input [8:0] A;
  input [8:0] B;
  output [17:0] PRODUCT;
  input TC;
  wire   \ab[8><0] , \ab[7><1] , \ab[7><0] , \ab[6><2] , \ab[6><1] ,
         \ab[6><0] , \ab[5><3] , \ab[5><2] , \ab[5><1] , \ab[5><0] ,
         \ab[4><4] , \ab[4><3] , \ab[4><2] , \ab[4><1] , \ab[4><0] ,
         \ab[3><5] , \ab[3><4] , \ab[3><3] , \ab[3><2] , \ab[3><1] ,
         \ab[3><0] , \ab[2><6] , \ab[2><5] , \ab[2><4] , \ab[2><3] ,
         \ab[2><2] , \ab[2><1] , \ab[2><0] , \ab[1><7] , \ab[1><6] ,
         \ab[1><5] , \ab[1><4] , \ab[1><3] , \ab[1><2] , \ab[1><1] ,
         \ab[1><0] , \ab[0><8] , \ab[0><7] , \ab[0><6] , \ab[0><5] ,
         \ab[0><4] , \ab[0><3] , \ab[0><2] , \ab[0><1] , \CARRYB[7><0] ,
         \CARRYB[6><1] , \CARRYB[6><0] , \CARRYB[5><2] , \CARRYB[5><1] ,
         \CARRYB[5><0] , \CARRYB[4><3] , \CARRYB[4><2] , \CARRYB[4><1] ,
         \CARRYB[4><0] , \CARRYB[3><4] , \CARRYB[3><3] , \CARRYB[3><2] ,
         \CARRYB[3><1] , \CARRYB[3><0] , \CARRYB[2><5] , \CARRYB[2><4] ,
         \CARRYB[2><3] , \CARRYB[2><2] , \CARRYB[2><1] , \CARRYB[2><0] ,
         \SUMB[7><1] , \SUMB[6><2] , \SUMB[6><1] , \SUMB[5><3] , \SUMB[5><2] ,
         \SUMB[5><1] , \SUMB[4><4] , \SUMB[4><3] , \SUMB[4><2] , \SUMB[4><1] ,
         \SUMB[3><5] , \SUMB[3><4] , \SUMB[3><3] , \SUMB[3><2] , \SUMB[3><1] ,
         \SUMB[2><6] , \SUMB[2><5] , \SUMB[2><4] , \SUMB[2><3] , \SUMB[2><2] ,
         \SUMB[2><1] , n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34;

  FA_X1 S4_0 ( .A(\ab[8><0] ), .B(\CARRYB[7><0] ), .CI(\SUMB[7><1] ), .S(
        PRODUCT[8]) );
  FA_X1 S1_7_0 ( .A(\ab[7><0] ), .B(\CARRYB[6><0] ), .CI(\SUMB[6><1] ), .CO(
        \CARRYB[7><0] ), .S(PRODUCT[7]) );
  FA_X1 S2_7_1 ( .A(\ab[7><1] ), .B(\CARRYB[6><1] ), .CI(\SUMB[6><2] ), .S(
        \SUMB[7><1] ) );
  FA_X1 S1_6_0 ( .A(\ab[6><0] ), .B(\CARRYB[5><0] ), .CI(\SUMB[5><1] ), .CO(
        \CARRYB[6><0] ), .S(PRODUCT[6]) );
  FA_X1 S2_6_1 ( .A(\ab[6><1] ), .B(\CARRYB[5><1] ), .CI(\SUMB[5><2] ), .CO(
        \CARRYB[6><1] ), .S(\SUMB[6><1] ) );
  FA_X1 S2_6_2 ( .A(\ab[6><2] ), .B(\CARRYB[5><2] ), .CI(\SUMB[5><3] ), .S(
        \SUMB[6><2] ) );
  FA_X1 S1_5_0 ( .A(\ab[5><0] ), .B(\CARRYB[4><0] ), .CI(\SUMB[4><1] ), .CO(
        \CARRYB[5><0] ), .S(PRODUCT[5]) );
  FA_X1 S2_5_1 ( .A(\ab[5><1] ), .B(\CARRYB[4><1] ), .CI(\SUMB[4><2] ), .CO(
        \CARRYB[5><1] ), .S(\SUMB[5><1] ) );
  FA_X1 S2_5_2 ( .A(\ab[5><2] ), .B(\CARRYB[4><2] ), .CI(\SUMB[4><3] ), .CO(
        \CARRYB[5><2] ), .S(\SUMB[5><2] ) );
  FA_X1 S2_5_3 ( .A(\ab[5><3] ), .B(\CARRYB[4><3] ), .CI(\SUMB[4><4] ), .S(
        \SUMB[5><3] ) );
  FA_X1 S1_4_0 ( .A(\ab[4><0] ), .B(\CARRYB[3><0] ), .CI(\SUMB[3><1] ), .CO(
        \CARRYB[4><0] ), .S(PRODUCT[4]) );
  FA_X1 S2_4_1 ( .A(\ab[4><1] ), .B(\CARRYB[3><1] ), .CI(\SUMB[3><2] ), .CO(
        \CARRYB[4><1] ), .S(\SUMB[4><1] ) );
  FA_X1 S2_4_2 ( .A(\ab[4><2] ), .B(\CARRYB[3><2] ), .CI(\SUMB[3><3] ), .CO(
        \CARRYB[4><2] ), .S(\SUMB[4><2] ) );
  FA_X1 S2_4_3 ( .A(\ab[4><3] ), .B(\CARRYB[3><3] ), .CI(\SUMB[3><4] ), .CO(
        \CARRYB[4><3] ), .S(\SUMB[4><3] ) );
  FA_X1 S2_4_4 ( .A(\ab[4><4] ), .B(\CARRYB[3><4] ), .CI(\SUMB[3><5] ), .S(
        \SUMB[4><4] ) );
  FA_X1 S1_3_0 ( .A(\ab[3><0] ), .B(\CARRYB[2><0] ), .CI(\SUMB[2><1] ), .CO(
        \CARRYB[3><0] ), .S(PRODUCT[3]) );
  FA_X1 S2_3_1 ( .A(\ab[3><1] ), .B(\CARRYB[2><1] ), .CI(\SUMB[2><2] ), .CO(
        \CARRYB[3><1] ), .S(\SUMB[3><1] ) );
  FA_X1 S2_3_2 ( .A(\ab[3><2] ), .B(\CARRYB[2><2] ), .CI(\SUMB[2><3] ), .CO(
        \CARRYB[3><2] ), .S(\SUMB[3><2] ) );
  FA_X1 S2_3_3 ( .A(\ab[3><3] ), .B(\CARRYB[2><3] ), .CI(\SUMB[2><4] ), .CO(
        \CARRYB[3><3] ), .S(\SUMB[3><3] ) );
  FA_X1 S2_3_4 ( .A(\ab[3><4] ), .B(\CARRYB[2><4] ), .CI(\SUMB[2><5] ), .CO(
        \CARRYB[3><4] ), .S(\SUMB[3><4] ) );
  FA_X1 S2_3_5 ( .A(\ab[3><5] ), .B(\CARRYB[2><5] ), .CI(\SUMB[2><6] ), .S(
        \SUMB[3><5] ) );
  FA_X1 S1_2_0 ( .A(\ab[2><0] ), .B(n8), .CI(n14), .CO(\CARRYB[2><0] ), .S(
        PRODUCT[2]) );
  FA_X1 S2_2_1 ( .A(\ab[2><1] ), .B(n7), .CI(n13), .CO(\CARRYB[2><1] ), .S(
        \SUMB[2><1] ) );
  FA_X1 S2_2_2 ( .A(\ab[2><2] ), .B(n6), .CI(n12), .CO(\CARRYB[2><2] ), .S(
        \SUMB[2><2] ) );
  FA_X1 S2_2_3 ( .A(\ab[2><3] ), .B(n5), .CI(n11), .CO(\CARRYB[2><3] ), .S(
        \SUMB[2><3] ) );
  FA_X1 S2_2_4 ( .A(\ab[2><4] ), .B(n4), .CI(n10), .CO(\CARRYB[2><4] ), .S(
        \SUMB[2><4] ) );
  FA_X1 S2_2_5 ( .A(\ab[2><5] ), .B(n3), .CI(n9), .CO(\CARRYB[2><5] ), .S(
        \SUMB[2><5] ) );
  FA_X1 S2_2_6 ( .A(\ab[2><6] ), .B(n2), .CI(n15), .S(\SUMB[2><6] ) );
  AND2_X1 U2 ( .A1(\ab[0><7] ), .A2(\ab[1><6] ), .ZN(n2) );
  AND2_X1 U3 ( .A1(\ab[0><6] ), .A2(\ab[1><5] ), .ZN(n3) );
  AND2_X1 U4 ( .A1(\ab[0><5] ), .A2(\ab[1><4] ), .ZN(n4) );
  AND2_X1 U5 ( .A1(\ab[0><4] ), .A2(\ab[1><3] ), .ZN(n5) );
  AND2_X1 U6 ( .A1(\ab[0><3] ), .A2(\ab[1><2] ), .ZN(n6) );
  AND2_X1 U7 ( .A1(\ab[0><2] ), .A2(\ab[1><1] ), .ZN(n7) );
  AND2_X1 U8 ( .A1(\ab[0><1] ), .A2(\ab[1><0] ), .ZN(n8) );
  XOR2_X1 U9 ( .A(\ab[1><6] ), .B(\ab[0><7] ), .Z(n9) );
  XOR2_X1 U10 ( .A(\ab[1><5] ), .B(\ab[0><6] ), .Z(n10) );
  XOR2_X1 U11 ( .A(\ab[1><4] ), .B(\ab[0><5] ), .Z(n11) );
  XOR2_X1 U12 ( .A(\ab[1><3] ), .B(\ab[0><4] ), .Z(n12) );
  XOR2_X1 U13 ( .A(\ab[1><2] ), .B(\ab[0><3] ), .Z(n13) );
  XOR2_X1 U14 ( .A(\ab[1><1] ), .B(\ab[0><2] ), .Z(n14) );
  XOR2_X1 U15 ( .A(\ab[1><7] ), .B(\ab[0><8] ), .Z(n15) );
  XOR2_X1 U16 ( .A(\ab[1><0] ), .B(\ab[0><1] ), .Z(PRODUCT[1]) );
  INV_X1 U17 ( .A(A[8]), .ZN(n17) );
  INV_X1 U18 ( .A(A[7]), .ZN(n18) );
  INV_X1 U19 ( .A(A[6]), .ZN(n19) );
  INV_X1 U20 ( .A(A[5]), .ZN(n20) );
  INV_X1 U21 ( .A(A[0]), .ZN(n25) );
  INV_X1 U22 ( .A(A[1]), .ZN(n24) );
  INV_X1 U23 ( .A(A[2]), .ZN(n23) );
  INV_X1 U24 ( .A(A[3]), .ZN(n22) );
  INV_X1 U25 ( .A(A[4]), .ZN(n21) );
  INV_X1 U26 ( .A(B[8]), .ZN(n26) );
  INV_X1 U27 ( .A(B[0]), .ZN(n34) );
  INV_X1 U28 ( .A(B[1]), .ZN(n33) );
  INV_X1 U29 ( .A(B[2]), .ZN(n32) );
  INV_X1 U30 ( .A(B[3]), .ZN(n31) );
  INV_X1 U31 ( .A(B[4]), .ZN(n30) );
  INV_X1 U32 ( .A(B[5]), .ZN(n29) );
  INV_X1 U33 ( .A(B[6]), .ZN(n28) );
  INV_X1 U34 ( .A(B[7]), .ZN(n27) );
  NOR2_X1 U35 ( .A1(n17), .A2(n34), .ZN(\ab[8><0] ) );
  NOR2_X1 U36 ( .A1(n33), .A2(n18), .ZN(\ab[7><1] ) );
  NOR2_X1 U37 ( .A1(n34), .A2(n18), .ZN(\ab[7><0] ) );
  NOR2_X1 U38 ( .A1(n32), .A2(n19), .ZN(\ab[6><2] ) );
  NOR2_X1 U39 ( .A1(n33), .A2(n19), .ZN(\ab[6><1] ) );
  NOR2_X1 U40 ( .A1(n34), .A2(n19), .ZN(\ab[6><0] ) );
  NOR2_X1 U41 ( .A1(n31), .A2(n20), .ZN(\ab[5><3] ) );
  NOR2_X1 U42 ( .A1(n32), .A2(n20), .ZN(\ab[5><2] ) );
  NOR2_X1 U43 ( .A1(n33), .A2(n20), .ZN(\ab[5><1] ) );
  NOR2_X1 U44 ( .A1(n34), .A2(n20), .ZN(\ab[5><0] ) );
  NOR2_X1 U45 ( .A1(n30), .A2(n21), .ZN(\ab[4><4] ) );
  NOR2_X1 U46 ( .A1(n31), .A2(n21), .ZN(\ab[4><3] ) );
  NOR2_X1 U47 ( .A1(n32), .A2(n21), .ZN(\ab[4><2] ) );
  NOR2_X1 U48 ( .A1(n33), .A2(n21), .ZN(\ab[4><1] ) );
  NOR2_X1 U49 ( .A1(n34), .A2(n21), .ZN(\ab[4><0] ) );
  NOR2_X1 U50 ( .A1(n29), .A2(n22), .ZN(\ab[3><5] ) );
  NOR2_X1 U51 ( .A1(n30), .A2(n22), .ZN(\ab[3><4] ) );
  NOR2_X1 U52 ( .A1(n31), .A2(n22), .ZN(\ab[3><3] ) );
  NOR2_X1 U53 ( .A1(n32), .A2(n22), .ZN(\ab[3><2] ) );
  NOR2_X1 U54 ( .A1(n33), .A2(n22), .ZN(\ab[3><1] ) );
  NOR2_X1 U55 ( .A1(n34), .A2(n22), .ZN(\ab[3><0] ) );
  NOR2_X1 U56 ( .A1(n28), .A2(n23), .ZN(\ab[2><6] ) );
  NOR2_X1 U57 ( .A1(n29), .A2(n23), .ZN(\ab[2><5] ) );
  NOR2_X1 U58 ( .A1(n30), .A2(n23), .ZN(\ab[2><4] ) );
  NOR2_X1 U59 ( .A1(n31), .A2(n23), .ZN(\ab[2><3] ) );
  NOR2_X1 U60 ( .A1(n32), .A2(n23), .ZN(\ab[2><2] ) );
  NOR2_X1 U61 ( .A1(n33), .A2(n23), .ZN(\ab[2><1] ) );
  NOR2_X1 U62 ( .A1(n34), .A2(n23), .ZN(\ab[2><0] ) );
  NOR2_X1 U63 ( .A1(n27), .A2(n24), .ZN(\ab[1><7] ) );
  NOR2_X1 U64 ( .A1(n28), .A2(n24), .ZN(\ab[1><6] ) );
  NOR2_X1 U65 ( .A1(n29), .A2(n24), .ZN(\ab[1><5] ) );
  NOR2_X1 U66 ( .A1(n30), .A2(n24), .ZN(\ab[1><4] ) );
  NOR2_X1 U67 ( .A1(n31), .A2(n24), .ZN(\ab[1><3] ) );
  NOR2_X1 U68 ( .A1(n32), .A2(n24), .ZN(\ab[1><2] ) );
  NOR2_X1 U69 ( .A1(n33), .A2(n24), .ZN(\ab[1><1] ) );
  NOR2_X1 U70 ( .A1(n34), .A2(n24), .ZN(\ab[1><0] ) );
  NOR2_X1 U71 ( .A1(n26), .A2(n25), .ZN(\ab[0><8] ) );
  NOR2_X1 U72 ( .A1(n27), .A2(n25), .ZN(\ab[0><7] ) );
  NOR2_X1 U73 ( .A1(n28), .A2(n25), .ZN(\ab[0><6] ) );
  NOR2_X1 U74 ( .A1(n29), .A2(n25), .ZN(\ab[0><5] ) );
  NOR2_X1 U75 ( .A1(n30), .A2(n25), .ZN(\ab[0><4] ) );
  NOR2_X1 U76 ( .A1(n31), .A2(n25), .ZN(\ab[0><3] ) );
  NOR2_X1 U77 ( .A1(n32), .A2(n25), .ZN(\ab[0><2] ) );
  NOR2_X1 U78 ( .A1(n33), .A2(n25), .ZN(\ab[0><1] ) );
  NOR2_X1 U79 ( .A1(n34), .A2(n25), .ZN(PRODUCT[0]) );
endmodule


module warp_id_calc_1_DW02_mult_0 ( A, B, TC, PRODUCT );
  input [3:0] A;
  input [5:0] B;
  output [9:0] PRODUCT;
  input TC;
  wire   \ab[3><5] , \ab[3><4] , \ab[3><3] , \ab[3><2] , \ab[3><1] ,
         \ab[3><0] , \ab[2><5] , \ab[2><4] , \ab[2><3] , \ab[2><2] ,
         \ab[2><1] , \ab[2><0] , \ab[1><5] , \ab[1><4] , \ab[1><3] ,
         \ab[1><2] , \ab[1><1] , \ab[1><0] , \ab[0><5] , \ab[0><4] ,
         \ab[0><3] , \ab[0><2] , \ab[0><1] , \CARRYB[3><4] , \CARRYB[3><3] ,
         \CARRYB[3><2] , \CARRYB[3><1] , \CARRYB[3><0] , \CARRYB[2><4] ,
         \CARRYB[2><3] , \CARRYB[2><2] , \CARRYB[2><1] , \CARRYB[2><0] ,
         \SUMB[3><4] , \SUMB[3><3] , \SUMB[3><2] , \SUMB[3><1] , \SUMB[2><4] ,
         \SUMB[2><3] , \SUMB[2><2] , \SUMB[2><1] , n2, n3, n4, n5, n6, n7, n8,
         n9, n11, n12, n14, n15, n16, n17, n18, n19, n20, n21, n22, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50;

  FA_X1 S4_0 ( .A(\ab[3><0] ), .B(\CARRYB[2><0] ), .CI(\SUMB[2><1] ), .CO(
        \CARRYB[3><0] ), .S(PRODUCT[3]) );
  FA_X1 S4_1 ( .A(\ab[3><1] ), .B(\CARRYB[2><1] ), .CI(\SUMB[2><2] ), .CO(
        \CARRYB[3><1] ), .S(\SUMB[3><1] ) );
  FA_X1 S4_2 ( .A(\ab[3><2] ), .B(\CARRYB[2><2] ), .CI(\SUMB[2><3] ), .CO(
        \CARRYB[3><2] ), .S(\SUMB[3><2] ) );
  FA_X1 S4_3 ( .A(\ab[3><3] ), .B(\CARRYB[2><3] ), .CI(\SUMB[2><4] ), .CO(
        \CARRYB[3><3] ), .S(\SUMB[3><3] ) );
  FA_X1 S5_4 ( .A(\ab[3><4] ), .B(\CARRYB[2><4] ), .CI(\ab[2><5] ), .CO(
        \CARRYB[3><4] ), .S(\SUMB[3><4] ) );
  FA_X1 S1_2_0 ( .A(\ab[2><0] ), .B(n12), .CI(n5), .CO(\CARRYB[2><0] ), .S(
        PRODUCT[2]) );
  FA_X1 S2_2_1 ( .A(\ab[2><1] ), .B(n4), .CI(n9), .CO(\CARRYB[2><1] ), .S(
        \SUMB[2><1] ) );
  FA_X1 S2_2_2 ( .A(\ab[2><2] ), .B(n3), .CI(n8), .CO(\CARRYB[2><2] ), .S(
        \SUMB[2><2] ) );
  FA_X1 S2_2_3 ( .A(\ab[2><3] ), .B(n2), .CI(n7), .CO(\CARRYB[2><3] ), .S(
        \SUMB[2><3] ) );
  FA_X1 S3_2_4 ( .A(\ab[2><4] ), .B(n6), .CI(\ab[1><5] ), .CO(\CARRYB[2><4] ), 
        .S(\SUMB[2><4] ) );
  AND2_X1 U2 ( .A1(\ab[0><4] ), .A2(\ab[1><3] ), .ZN(n2) );
  AND2_X1 U3 ( .A1(\ab[0><3] ), .A2(\ab[1><2] ), .ZN(n3) );
  AND2_X1 U4 ( .A1(\ab[0><2] ), .A2(\ab[1><1] ), .ZN(n4) );
  XOR2_X1 U5 ( .A(\ab[1><1] ), .B(\ab[0><2] ), .Z(n5) );
  AND2_X1 U6 ( .A1(\ab[0><5] ), .A2(\ab[1><4] ), .ZN(n6) );
  XOR2_X1 U7 ( .A(\ab[1><4] ), .B(\ab[0><5] ), .Z(n7) );
  XOR2_X1 U8 ( .A(\ab[1><3] ), .B(\ab[0><4] ), .Z(n8) );
  XOR2_X1 U9 ( .A(\ab[1><2] ), .B(\ab[0><3] ), .Z(n9) );
  XOR2_X1 U10 ( .A(\CARRYB[3><0] ), .B(\SUMB[3><1] ), .Z(PRODUCT[4]) );
  OR2_X1 U11 ( .A1(n16), .A2(n14), .ZN(n11) );
  AND2_X1 U12 ( .A1(\ab[0><1] ), .A2(\ab[1><0] ), .ZN(n12) );
  INV_X1 U13 ( .A(n31), .ZN(n39) );
  INV_X1 U14 ( .A(n33), .ZN(n40) );
  INV_X1 U15 ( .A(n24), .ZN(n37) );
  INV_X1 U16 ( .A(n26), .ZN(n38) );
  XNOR2_X1 U17 ( .A(n22), .B(n36), .ZN(PRODUCT[9]) );
  AND2_X1 U18 ( .A1(n24), .A2(n11), .ZN(PRODUCT[5]) );
  XOR2_X1 U19 ( .A(\CARRYB[3><1] ), .B(\SUMB[3><2] ), .Z(n14) );
  XOR2_X1 U20 ( .A(\CARRYB[3><4] ), .B(\ab[3><5] ), .Z(n15) );
  AND2_X1 U21 ( .A1(\CARRYB[3><0] ), .A2(\SUMB[3><1] ), .ZN(n16) );
  AND2_X1 U22 ( .A1(\CARRYB[3><2] ), .A2(\SUMB[3><3] ), .ZN(n17) );
  XOR2_X1 U23 ( .A(\CARRYB[3><3] ), .B(\SUMB[3><4] ), .Z(n18) );
  AND2_X1 U24 ( .A1(\CARRYB[3><1] ), .A2(\SUMB[3><2] ), .ZN(n19) );
  AND2_X1 U25 ( .A1(\CARRYB[3><3] ), .A2(\SUMB[3><4] ), .ZN(n20) );
  XOR2_X1 U26 ( .A(\CARRYB[3><2] ), .B(\SUMB[3><3] ), .Z(n21) );
  AND2_X1 U27 ( .A1(\CARRYB[3><4] ), .A2(\ab[3><5] ), .ZN(n22) );
  INV_X1 U28 ( .A(B[2]), .ZN(n48) );
  INV_X1 U29 ( .A(B[4]), .ZN(n46) );
  INV_X1 U30 ( .A(B[3]), .ZN(n47) );
  INV_X1 U31 ( .A(A[0]), .ZN(n44) );
  INV_X1 U32 ( .A(A[1]), .ZN(n41) );
  INV_X1 U33 ( .A(A[2]), .ZN(n42) );
  INV_X1 U34 ( .A(B[1]), .ZN(n49) );
  INV_X1 U35 ( .A(B[0]), .ZN(n50) );
  XOR2_X1 U36 ( .A(\ab[1><0] ), .B(\ab[0><1] ), .Z(PRODUCT[1]) );
  INV_X1 U37 ( .A(B[5]), .ZN(n45) );
  INV_X1 U38 ( .A(A[3]), .ZN(n43) );
  NAND2_X1 U39 ( .A1(n16), .A2(n14), .ZN(n24) );
  NOR2_X1 U40 ( .A1(n19), .A2(n21), .ZN(n26) );
  AND2_X1 U41 ( .A1(n19), .A2(n21), .ZN(n27) );
  NOR2_X1 U42 ( .A1(n26), .A2(n27), .ZN(n25) );
  XOR2_X1 U43 ( .A(n37), .B(n25), .Z(PRODUCT[6]) );
  NAND2_X1 U44 ( .A1(n17), .A2(n18), .ZN(n29) );
  NOR2_X1 U45 ( .A1(n17), .A2(n18), .ZN(n31) );
  NAND2_X1 U46 ( .A1(n29), .A2(n39), .ZN(n28) );
  AOI21_X1 U47 ( .B1(n38), .B2(n37), .A(n27), .ZN(n30) );
  XOR2_X1 U48 ( .A(n28), .B(n30), .Z(PRODUCT[7]) );
  OAI21_X1 U49 ( .B1(n31), .B2(n30), .A(n29), .ZN(n35) );
  NOR2_X1 U50 ( .A1(n20), .A2(n15), .ZN(n33) );
  AND2_X1 U51 ( .A1(n20), .A2(n15), .ZN(n34) );
  NOR2_X1 U52 ( .A1(n33), .A2(n34), .ZN(n32) );
  XOR2_X1 U53 ( .A(n35), .B(n32), .Z(PRODUCT[8]) );
  AOI21_X1 U54 ( .B1(n35), .B2(n40), .A(n34), .ZN(n36) );
  NOR2_X1 U55 ( .A1(n43), .A2(n45), .ZN(\ab[3><5] ) );
  NOR2_X1 U56 ( .A1(n43), .A2(n46), .ZN(\ab[3><4] ) );
  NOR2_X1 U57 ( .A1(n43), .A2(n47), .ZN(\ab[3><3] ) );
  NOR2_X1 U58 ( .A1(n43), .A2(n48), .ZN(\ab[3><2] ) );
  NOR2_X1 U59 ( .A1(n43), .A2(n49), .ZN(\ab[3><1] ) );
  NOR2_X1 U60 ( .A1(n43), .A2(n50), .ZN(\ab[3><0] ) );
  NOR2_X1 U61 ( .A1(n45), .A2(n42), .ZN(\ab[2><5] ) );
  NOR2_X1 U62 ( .A1(n46), .A2(n42), .ZN(\ab[2><4] ) );
  NOR2_X1 U63 ( .A1(n47), .A2(n42), .ZN(\ab[2><3] ) );
  NOR2_X1 U64 ( .A1(n48), .A2(n42), .ZN(\ab[2><2] ) );
  NOR2_X1 U65 ( .A1(n49), .A2(n42), .ZN(\ab[2><1] ) );
  NOR2_X1 U66 ( .A1(n50), .A2(n42), .ZN(\ab[2><0] ) );
  NOR2_X1 U67 ( .A1(n45), .A2(n41), .ZN(\ab[1><5] ) );
  NOR2_X1 U68 ( .A1(n46), .A2(n41), .ZN(\ab[1><4] ) );
  NOR2_X1 U69 ( .A1(n47), .A2(n41), .ZN(\ab[1><3] ) );
  NOR2_X1 U70 ( .A1(n48), .A2(n41), .ZN(\ab[1><2] ) );
  NOR2_X1 U71 ( .A1(n49), .A2(n41), .ZN(\ab[1><1] ) );
  NOR2_X1 U72 ( .A1(n50), .A2(n41), .ZN(\ab[1><0] ) );
  NOR2_X1 U73 ( .A1(n45), .A2(n44), .ZN(\ab[0><5] ) );
  NOR2_X1 U74 ( .A1(n46), .A2(n44), .ZN(\ab[0><4] ) );
  NOR2_X1 U75 ( .A1(n47), .A2(n44), .ZN(\ab[0><3] ) );
  NOR2_X1 U76 ( .A1(n48), .A2(n44), .ZN(\ab[0><2] ) );
  NOR2_X1 U77 ( .A1(n49), .A2(n44), .ZN(\ab[0><1] ) );
  NOR2_X1 U78 ( .A1(n50), .A2(n44), .ZN(PRODUCT[0]) );
endmodule


module warp_id_calc ( clk, reset, en, block_num_in, gprs_size_in, 
        warp_num_in, warps_per_block_in, data_valid_out, gprs_base_addr_out, 
        warp_id_out );
  input [3:0] block_num_in;
  input [8:0] gprs_size_in;
  input [4:0] warp_num_in;
  input [5:0] warps_per_block_in;
  output [8:0] gprs_base_addr_out;
  output [4:0] warp_id_out;
  input clk, reset, en;
  output data_valid_out;
  wire   N9, N8, N7, N6, N5, N4, N3, N2, N1, N0, \rem_36/u_div/PartRem[4><5] ,
         \rem_36/u_div/PartRem[4><4] , \rem_36/u_div/PartRem[4><3] ,
         \rem_36/u_div/PartRem[4><2] , \rem_36/u_div/PartRem[3><5] ,
         \rem_36/u_div/PartRem[3><4] , \rem_36/u_div/PartRem[3><3] ,
         \rem_36/u_div/PartRem[3><2] , \rem_36/u_div/PartRem[2><5] ,
         \rem_36/u_div/PartRem[2><4] , \rem_36/u_div/PartRem[2><3] ,
         \rem_36/u_div/PartRem[2><2] , \rem_36/u_div/PartRem[1><5] ,
         \rem_36/u_div/PartRem[1><4] , \rem_36/u_div/PartRem[1><3] ,
         \rem_36/u_div/PartRem[1><2] , \add_35/carry[9] , \add_35/carry[8] ,
         \add_35/carry[7] , \add_35/carry[6] , \add_35/carry[5] ,
         \add_35/carry[4] , \add_35/carry[3] , \add_35/carry[2] ,
         \add_35/carry[1] ;
  wire   [9:0] q_res;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8;
  assign data_valid_out = 1'b1;

  warp_id_calc_1_DW02_mult_1 mult_39 ( .A({q_res[8:1], warp_id_out[0]}), .B(
        gprs_size_in), .TC(1'b0), .PRODUCT({SYNOPSYS_UNCONNECTED__0, 
        SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2, 
        SYNOPSYS_UNCONNECTED__3, SYNOPSYS_UNCONNECTED__4, 
        SYNOPSYS_UNCONNECTED__5, SYNOPSYS_UNCONNECTED__6, 
        SYNOPSYS_UNCONNECTED__7, SYNOPSYS_UNCONNECTED__8, gprs_base_addr_out})
         );
  warp_id_calc_1_DW02_mult_0 mult_35 ( .A(block_num_in), .B(warps_per_block_in), .TC(1'b0), .PRODUCT({N9, N8, N7, N6, N5, N4, N3, N2, N1, N0}) );
  FA_X1 \add_35/U1_1  ( .A(N1), .B(warp_num_in[1]), .CI(\add_35/carry[1] ), 
        .CO(\add_35/carry[2] ), .S(q_res[1]) );
  FA_X1 \add_35/U1_2  ( .A(N2), .B(warp_num_in[2]), .CI(\add_35/carry[2] ), 
        .CO(\add_35/carry[3] ), .S(q_res[2]) );
  FA_X1 \add_35/U1_3  ( .A(N3), .B(warp_num_in[3]), .CI(\add_35/carry[3] ), 
        .CO(\add_35/carry[4] ), .S(q_res[3]) );
  FA_X1 \add_35/U1_4  ( .A(N4), .B(warp_num_in[4]), .CI(\add_35/carry[4] ), 
        .CO(\add_35/carry[5] ), .S(q_res[4]) );
  XOR2_X1 U3 ( .A(N9), .B(\add_35/carry[9] ), .Z(q_res[9]) );
  AND2_X1 U4 ( .A1(N8), .A2(\add_35/carry[8] ), .ZN(\add_35/carry[9] ) );
  XOR2_X1 U5 ( .A(N8), .B(\add_35/carry[8] ), .Z(q_res[8]) );
  AND2_X1 U6 ( .A1(N7), .A2(\add_35/carry[7] ), .ZN(\add_35/carry[8] ) );
  XOR2_X1 U7 ( .A(N7), .B(\add_35/carry[7] ), .Z(q_res[7]) );
  AND2_X1 U8 ( .A1(N6), .A2(\add_35/carry[6] ), .ZN(\add_35/carry[7] ) );
  XOR2_X1 U9 ( .A(N6), .B(\add_35/carry[6] ), .Z(q_res[6]) );
  AND2_X1 U10 ( .A1(N5), .A2(\add_35/carry[5] ), .ZN(\add_35/carry[6] ) );
  XOR2_X1 U11 ( .A(N5), .B(\add_35/carry[5] ), .Z(q_res[5]) );
  AND2_X1 U12 ( .A1(warp_num_in[0]), .A2(N0), .ZN(\add_35/carry[1] ) );
  XOR2_X1 U13 ( .A(warp_num_in[0]), .B(N0), .Z(warp_id_out[0]) );
  MUX2_X1 U14 ( .A(q_res[1]), .B(q_res[1]), .S(\rem_36/u_div/PartRem[1><5] ), 
        .Z(warp_id_out[1]) );
  MUX2_X1 U15 ( .A(q_res[2]), .B(q_res[2]), .S(\rem_36/u_div/PartRem[2><5] ), 
        .Z(\rem_36/u_div/PartRem[1><2] ) );
  MUX2_X1 U16 ( .A(\rem_36/u_div/PartRem[1><2] ), .B(
        \rem_36/u_div/PartRem[1><2] ), .S(\rem_36/u_div/PartRem[1><5] ), .Z(
        warp_id_out[2]) );
  MUX2_X1 U17 ( .A(q_res[3]), .B(q_res[3]), .S(\rem_36/u_div/PartRem[3><5] ), 
        .Z(\rem_36/u_div/PartRem[2><2] ) );
  MUX2_X1 U18 ( .A(\rem_36/u_div/PartRem[2><2] ), .B(
        \rem_36/u_div/PartRem[2><2] ), .S(\rem_36/u_div/PartRem[2><5] ), .Z(
        \rem_36/u_div/PartRem[1><3] ) );
  MUX2_X1 U19 ( .A(\rem_36/u_div/PartRem[1><3] ), .B(
        \rem_36/u_div/PartRem[1><3] ), .S(\rem_36/u_div/PartRem[1><5] ), .Z(
        warp_id_out[3]) );
  MUX2_X1 U20 ( .A(q_res[4]), .B(q_res[4]), .S(\rem_36/u_div/PartRem[4><5] ), 
        .Z(\rem_36/u_div/PartRem[3><2] ) );
  MUX2_X1 U21 ( .A(\rem_36/u_div/PartRem[3><2] ), .B(
        \rem_36/u_div/PartRem[3><2] ), .S(\rem_36/u_div/PartRem[3><5] ), .Z(
        \rem_36/u_div/PartRem[2><3] ) );
  MUX2_X1 U22 ( .A(\rem_36/u_div/PartRem[2><3] ), .B(
        \rem_36/u_div/PartRem[2><3] ), .S(\rem_36/u_div/PartRem[2><5] ), .Z(
        \rem_36/u_div/PartRem[1><4] ) );
  MUX2_X1 U23 ( .A(\rem_36/u_div/PartRem[1><4] ), .B(
        \rem_36/u_div/PartRem[1><4] ), .S(\rem_36/u_div/PartRem[1><5] ), .Z(
        warp_id_out[4]) );
  MUX2_X1 U24 ( .A(q_res[5]), .B(q_res[5]), .S(q_res[9]), .Z(
        \rem_36/u_div/PartRem[4><2] ) );
  MUX2_X1 U25 ( .A(\rem_36/u_div/PartRem[4><2] ), .B(
        \rem_36/u_div/PartRem[4><2] ), .S(\rem_36/u_div/PartRem[4><5] ), .Z(
        \rem_36/u_div/PartRem[3><3] ) );
  MUX2_X1 U26 ( .A(\rem_36/u_div/PartRem[3><3] ), .B(
        \rem_36/u_div/PartRem[3><3] ), .S(\rem_36/u_div/PartRem[3><5] ), .Z(
        \rem_36/u_div/PartRem[2><4] ) );
  MUX2_X1 U27 ( .A(\rem_36/u_div/PartRem[2><4] ), .B(
        \rem_36/u_div/PartRem[2><4] ), .S(\rem_36/u_div/PartRem[2><5] ), .Z(
        \rem_36/u_div/PartRem[1><5] ) );
  MUX2_X1 U28 ( .A(q_res[6]), .B(q_res[6]), .S(q_res[9]), .Z(
        \rem_36/u_div/PartRem[4><3] ) );
  MUX2_X1 U29 ( .A(\rem_36/u_div/PartRem[4><3] ), .B(
        \rem_36/u_div/PartRem[4><3] ), .S(\rem_36/u_div/PartRem[4><5] ), .Z(
        \rem_36/u_div/PartRem[3><4] ) );
  MUX2_X1 U30 ( .A(\rem_36/u_div/PartRem[3><4] ), .B(
        \rem_36/u_div/PartRem[3><4] ), .S(\rem_36/u_div/PartRem[3><5] ), .Z(
        \rem_36/u_div/PartRem[2><5] ) );
  MUX2_X1 U31 ( .A(q_res[7]), .B(q_res[7]), .S(q_res[9]), .Z(
        \rem_36/u_div/PartRem[4><4] ) );
  MUX2_X1 U32 ( .A(\rem_36/u_div/PartRem[4><4] ), .B(
        \rem_36/u_div/PartRem[4><4] ), .S(\rem_36/u_div/PartRem[4><5] ), .Z(
        \rem_36/u_div/PartRem[3><5] ) );
  MUX2_X1 U33 ( .A(q_res[8]), .B(q_res[8]), .S(q_res[9]), .Z(
        \rem_36/u_div/PartRem[4><5] ) );
endmodule