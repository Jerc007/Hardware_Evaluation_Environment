
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity TP_instructions is
	port(
		instruction_pointer_in : in  integer;
		num_instructions_out   : out integer;
		instruction_out        : out std_logic_vector(31 downto 0)
	);
end TP_instructions;

architecture arch of TP_instructions is
	constant TP_INSTRUCTIONS : integer := 168;

begin
	num_instructions_out <= TP_INSTRUCTIONS;

	process(instruction_pointer_in)
	begin
		case instruction_pointer_in is
			when 0 => instruction_out <= x"10004209";   -- 0000  MOV.U16 R1L, g [0x1].U16; 
when 1 => instruction_out <= x"0023c780";
when 2 => instruction_out <= x"a0000009";   -- 0008  I2I.U32.U16 R2, R0L; 
when 3 => instruction_out <= x"04000780";
when 4 => instruction_out <= x"60024c09";   -- 0010  IMAD.U16 R2, g [0x6].U16, R1L, R2; 
when 5 => instruction_out <= x"00208780";
when 6 => instruction_out <= x"307c05fd";   -- 0018  ISET.S32.C0 o[0x7f], R2, R124, LE; 
when 7 => instruction_out <= x"6c00c7c8";
when 8 => instruction_out <= x"30000003";   -- 0020  RET C0.NE; 
when 9 => instruction_out <= x"00000280";
when 10 => instruction_out <= x"d0800205";   -- 0028  LOP.AND.U16 R0H, R0H, c[0x1][0x0]; 
when 11 => instruction_out <= x"00400780";
when 12 => instruction_out <= x"10004401";   -- 0030  MOV.U16 R0L, g [0x2].U16; 
when 13 => instruction_out <= x"0023c780";
when 14 => instruction_out <= x"a0000205";   -- 0038  I2I.U32.U16 R1, R0H; 
when 15 => instruction_out <= x"04000780";
when 16 => instruction_out <= x"60004e05";   -- 0040  IMAD.U16 R1, g [0x7].U16, R0L, R1; 
when 17 => instruction_out <= x"00204780";
when 18 => instruction_out <= x"307c03fd";   -- 0048  ISET.S32.C0 o[0x7f], R1, R124, LE; 
when 19 => instruction_out <= x"6c00c7c8";
when 20 => instruction_out <= x"30000003";   -- 0050  RET C0.NE; 
when 21 => instruction_out <= x"00000280";
when 22 => instruction_out <= x"213ff001";   -- 0058  IADD32I R0, g [0x8], 0xffffffff; --8
when 23 => instruction_out <= x"0fffffff";
when 24 => instruction_out <= x"300005fd";   -- 0060  ISET.C0 o[0x7f], R2, R0, GE; 
when 25 => instruction_out <= x"640187c8";
when 26 => instruction_out <= x"30000003";   -- 0068  RET C0.NE; 
when 27 => instruction_out <= x"00000280";
when 28 => instruction_out <= x"213ff201";   -- 0070  IADD32I R0, g [0x9], 0xffffffff; --9
when 29 => instruction_out <= x"0fffffff";
when 30 => instruction_out <= x"300003fd";   -- 0078  ISET.C0 o[0x7f], R1, R0, GE; 
when 31 => instruction_out <= x"640187c8";
when 32 => instruction_out <= x"30000003";   -- 0080  RET C0.NE; 
when 33 => instruction_out <= x"00000280";
when 34 => instruction_out <= x"1000d001";   -- 0088  MOV R0, g [0x8]; --8
when 35 => instruction_out <= x"0423c780";
when 36 => instruction_out <= x"2001820d";   -- 0090  IADD32I R3, R1, 0x1; 
when 37 => instruction_out <= x"00000003";
when 38 => instruction_out <= x"40010415";   -- 0098  IMUL.U16.U16 R5, R1L, R0H; 
when 39 => instruction_out <= x"00000780";
when 40 => instruction_out <= x"203f8211";   -- 00a0  IADD32I R4, R1, 0xffffffff; 
when 41 => instruction_out <= x"0fffffff";
when 42 => instruction_out <= x"60000615";   -- 00a8  IMAD.U16 R5, R1H, R0L, R5; 
when 43 => instruction_out <= x"00014780";
when 44 => instruction_out <= x"40060218";   -- 00b0  IMUL32.U16.U16 R6, R0H, R3L;
when 45 => instruction_out <= x"4008021c";   -- 00b4  IMUL32.U16.U16 R7, R0H, R4L;
when 46 => instruction_out <= x"30100a15";   -- 00b8  SHL R5, R5, 0x10; 
when 47 => instruction_out <= x"c4100780";
when 48 => instruction_out <= x"60070019";   -- 00c0  IMAD.U16 R6, R0L, R3H, R6; 
when 49 => instruction_out <= x"00018780";
when 50 => instruction_out <= x"6009001d";   -- 00c8  IMAD.U16 R7, R0L, R4H, R7; 
when 51 => instruction_out <= x"0001c780";
when 52 => instruction_out <= x"60000405";   -- 00d0  IMAD.U16 R1, R1L, R0L, R5; 
when 53 => instruction_out <= x"00014780";
when 54 => instruction_out <= x"30100c15";   -- 00d8  SHL R5, R6, 0x10; 
when 55 => instruction_out <= x"c4100780";
when 56 => instruction_out <= x"30100e19";   -- 00e0  SHL R6, R7, 0x10; 
when 57 => instruction_out <= x"c4100780";
when 58 => instruction_out <= x"20000205";   -- 00e8  IADD R1, R1, R2; 
when 59 => instruction_out <= x"04008780";
when 60 => instruction_out <= x"6006000d";   -- 00f0  IMAD.U16 R3, R0L, R3L, R5; 
when 61 => instruction_out <= x"00014780";
when 62 => instruction_out <= x"60080011";   -- 00f8  IMAD.U16 R4, R0L, R4L, R6; 
when 63 => instruction_out <= x"00018780";
when 64 => instruction_out <= x"2101e814";   -- 0100  IADD32 R5, g [0x4], R1;
when 65 => instruction_out <= x"20038400";   -- 0104  IADD32 R0, R2, R3;
when 66 => instruction_out <= x"20000411";   -- 0108  IADD R4, R2, R4; 
when 67 => instruction_out <= x"04010780";
when 68 => instruction_out <= x"20018a09";   -- 0110  IADD32I R2, R5, 0x1; 
when 69 => instruction_out <= x"00000003";
when 70 => instruction_out <= x"d00e040d";   -- 0118  GLD.U8 R3, global14[R2]; 
when 71 => instruction_out <= x"80000780";
when 72 => instruction_out <= x"203f8a09";   -- 0120  IADD32I R2, R5, 0xffffffff; 
when 73 => instruction_out <= x"0fffffff";
when 74 => instruction_out <= x"d00e041d";   -- 0128  GLD.U8 R7, global14[R2]; 
when 75 => instruction_out <= x"80000780";
when 76 => instruction_out <= x"2100e808";   -- 0130  IADD32 R2, g [0x4], R0;
when 77 => instruction_out <= x"2104e800";   -- 0134  IADD32 R0, g [0x4], R4;
when 78 => instruction_out <= x"d00e0021";   -- 0138  GLD.U8 R8, global14[R0]; 
when 79 => instruction_out <= x"80000780";
when 80 => instruction_out <= x"d00e0411";   -- 0140  GLD.U8 R4, global14[R2]; 
when 81 => instruction_out <= x"80000780";
when 82 => instruction_out <= x"203f8415";   -- 0148  IADD32I R5, R2, 0xffffffff; 
when 83 => instruction_out <= x"0fffffff";
when 84 => instruction_out <= x"d00e0a15";   -- 0150  GLD.U8 R5, global14[R5]; 
when 85 => instruction_out <= x"80000780";
when 86 => instruction_out <= x"20018019";   -- 0158  IADD32I R6, R0, 0x1; 
when 87 => instruction_out <= x"00000003";
when 88 => instruction_out <= x"d00e0c19";   -- 0160  GLD.U8 R6, global14[R6]; 
when 89 => instruction_out <= x"80000780";
when 90 => instruction_out <= x"203f8001";   -- 0168  IADD32I R0, R0, 0xffffffff; 
when 91 => instruction_out <= x"0fffffff";
when 92 => instruction_out <= x"d00e0001";   -- 0170  GLD.U8 R0, global14[R0]; 
when 93 => instruction_out <= x"80000780";
when 94 => instruction_out <= x"20018409";   -- 0178  IADD32I R2, R2, 0x1; 
when 95 => instruction_out <= x"00000003";
when 96 => instruction_out <= x"d00e0409";   -- 0180  GLD.U8 R2, global14[R2]; 
when 97 => instruction_out <= x"80000780";
when 98 => instruction_out <= x"a0002021";   -- 0188  I2F.F32.U16.BEXT R8, R8L; 
when 99 => instruction_out <= x"44008780";
when 100 => instruction_out <= x"a0000001";   -- 0190  I2F.F32.U16.BEXT R0, R0L; 
when 101 => instruction_out <= x"44008780";
when 102 => instruction_out <= x"b0001021";   -- 0198  FADD R8, R8, R8; 
when 103 => instruction_out <= x"00020780";
when 104 => instruction_out <= x"a0001c1d";   -- 01a0  I2F.F32.U16.BEXT R7, R7L; 
when 105 => instruction_out <= x"44008780";
when 106 => instruction_out <= x"a0001819";   -- 01a8  I2F.F32.U16.BEXT R6, R6L; 
when 107 => instruction_out <= x"44008780";
when 108 => instruction_out <= x"b0000021";   -- 01b0  FADD R8, R0, R8; 
when 109 => instruction_out <= x"00020780";
when 110 => instruction_out <= x"e0400e01";   -- 01b8  FMAD32I R0, R7, -0x40000000, -R0; 
when 111 => instruction_out <= x"0c000003";
when 112 => instruction_out <= x"a0001415";   -- 01c0  I2F.F32.U16.BEXT R5, R5L; 
when 113 => instruction_out <= x"44008780";
when 114 => instruction_out <= x"b0000c21";   -- 01c8  FADD R8, R6, R8; 
when 115 => instruction_out <= x"00020780";
when 116 => instruction_out <= x"b045001c";   -- 01d0  FADD32 R7, R0, -R5;
when 117 => instruction_out <= x"b0088a00";   -- 01d4  FADD32 R0, -R5, R8;
when 118 => instruction_out <= x"a0001015";   -- 01d8  I2F.F32.U16.BEXT R5, R4L; 
when 119 => instruction_out <= x"44008780";
when 120 => instruction_out <= x"a0000c11";   -- 01e0  I2F.F32.U16.BEXT R4, R3L; 
when 121 => instruction_out <= x"44008780";
when 122 => instruction_out <= x"b0000c0d";   -- 01e8  FADD R3, R6, R7; 
when 123 => instruction_out <= x"0001c780";
when 124 => instruction_out <= x"e0000a01";   -- 01f0  FMAD32I R0, R5, -0x40000000, R0; 
when 125 => instruction_out <= x"0c000003";
when 126 => instruction_out <= x"b0000811";   -- 01f8  FADD R4, R4, R4; 
when 127 => instruction_out <= x"00010780";
when 128 => instruction_out <= x"a0000809";   -- 0200  I2F.F32.U16.BEXT R2, R2L; 
when 129 => instruction_out <= x"44008780";
when 130 => instruction_out <= x"b004060c";   -- 0208  FADD32 R3, R3, R4;
when 131 => instruction_out <= x"b0008410";   -- 020c  FADD32 R4, -R2, R0;
when 132 => instruction_out <= x"b0030400";   -- 0210  FADD32 R0, R2, R3;
when 133 => instruction_out <= x"c0040808";   -- 0214  FMUL32 R2, R4, R4;
when 134 => instruction_out <= x"e0000001";   -- 0218  FMAD R0, R0, R0, R2; 
when 135 => instruction_out <= x"00008780";
when 136 => instruction_out <= x"90000001";   -- 0220  RSQ R0, R0; 
when 137 => instruction_out <= x"40000780";
when 138 => instruction_out <= x"90000001";   -- 0228  RCP R0, R0; 
when 139 => instruction_out <= x"00000780";
when 140 => instruction_out <= x"a0000009";   -- 0230  F2F.F32.F32 R2, R0; 
when 141 => instruction_out <= x"c4004780";
when 142 => instruction_out <= x"b08205fd";   -- 0238  FSET.C0 o[0x7f], R2, c[0x1][0x2], GT; 
when 143 => instruction_out <= x"604107c8";
when 144 => instruction_out <= x"1000f801";   -- 0240  MOV R0 (C0.NE), R124; 
when 145 => instruction_out <= x"0403c280";
when 146 => instruction_out <= x"30020209";   -- 0248  SHL R2, R1, 0x2; 
when 147 => instruction_out <= x"c4100780";
when 148 => instruction_out <= x"a0000011";   -- 0250  F2I.S32.F32.TRUNC R4, R0; 
when 149 => instruction_out <= x"8c064780";
when 150 => instruction_out <= x"2000CC0D";   -- 0258  IADD R3, g [0x6], R2;  -- 6
when 151 => instruction_out <= x"04208780";
when 152 => instruction_out <= x"3004D415";   -- 0260  ISET R5, g [0xa], R4, LT; --a
when 153 => instruction_out <= x"64204780";
when 154 => instruction_out <= x"d00e0611";   -- 0268  GST.U32 global14[R3], R4; 
when 155 => instruction_out <= x"a0c00780";
when 156 => instruction_out <= x"2000CE09";   -- 0270  IADD R2, g [0x7], R2; --7
when 157 => instruction_out <= x"04208780";
when 158 => instruction_out <= x"d0830a0d";   -- 0278  LOP.AND R3, R5, c[0x1][0x3]; 
when 159 => instruction_out <= x"04400780";
when 160 => instruction_out <= x"d00e0401";   -- 0280  GST.U32 global14[R2], R0; 
when 161 => instruction_out <= x"a0c00780";
when 162 => instruction_out <= x"2101EA04";   -- 0288  IADD32 R1, g [0x5], R1; -- 5
when 163 => instruction_out <= x"10000c00";   -- 028c  MOV32.U16 R0L, R3L;
when 164 => instruction_out <= x"d00e0201";   -- 0290  GST.U8 global14[R1], R0; 
when 165 => instruction_out <= x"a0000781";
when 166 => instruction_out <= x"30000003";   -- RET
when 167 => instruction_out <= x"00000780";

			when others => null;
		end case;
	end process;

end arch;
