
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
	constant TP_INSTRUCTIONS : integer := 336;

begin
	num_instructions_out <= TP_INSTRUCTIONS;

	process(instruction_pointer_in)
	begin
		case instruction_pointer_in is
			when 0 => instruction_out <= x"3001cc05";	-- 0000 SHR.S32 R1, g [0x6], 0x1;
when 1 => instruction_out <= x"ec300780";
when 2 => instruction_out <= x"307ccdfd";	-- 0008 ISET.S32.C0 o [0x7f], g [0x6], R124, LE;
when 3 => instruction_out <= x"6c20c7c8";
when 4 => instruction_out <= x"1000cc09";	-- 0010 MOV R2, g [0x6];
when 5 => instruction_out <= x"0423c780";
when 6 => instruction_out <= x"1000a003";	-- 0018 BRA C0.NE, 0x50;
when 7 => instruction_out <= x"00000280"; 
when 8 => instruction_out <= x"1000f829";	-- 0020 MOV R10, R124;
when 9 => instruction_out <= x"0403c780"; 
when 10 => instruction_out <= x"30010409";	-- 0028 SHR.S32 R2, R2, 0x1;
when 11 => instruction_out <= x"ec100780"; 
when 12 => instruction_out <= x"307c05fd";	-- 0030 ISET.S32.C0 o [0x7f], R2, R124, GT;
when 13 => instruction_out <= x"6c0107c8"; 
when 14 => instruction_out <= x"20019429";	-- 0038 IADD32I R10, R10, 0x1;
when 15 => instruction_out <= x"00000003"; 
when 16 => instruction_out <= x"10005003";	-- 0040 BRA C0.NE, 0x28;
when 17 => instruction_out <= x"00000280"; 
when 18 => instruction_out <= x"1000b003";	-- 0048 BRA 0x58;
when 19 => instruction_out <= x"00000780"; 
when 20 => instruction_out <= x"1000f829";	-- 0050 MOV R10, R124;
when 21 => instruction_out <= x"0403c780"; 
when 22 => instruction_out <= x"a0004411";	-- 0058 I2I.U32.U16 R4, g [0x2].U16;
when 23 => instruction_out <= x"04200780"; 
when 24 => instruction_out <= x"a0004215";	-- 0060 I2I.U32.U16 R5, g [0x1].U16;
when 25 => instruction_out <= x"04200780"; 
when 26 => instruction_out <= x"400b1009";	-- 0068 IMUL.U16.U16 R2, R4L, R5H;
when 27 => instruction_out <= x"00000780"; 
when 28 => instruction_out <= x"600a1209";	-- 0070 IMAD.U16 R2, R4H, R5L, R2;
when 29 => instruction_out <= x"00008780"; 
when 30 => instruction_out <= x"3010040d";	-- 0078 SHL R3, R2, 0x10;
when 31 => instruction_out <= x"c4100780"; 
when 32 => instruction_out <= x"a0004609";	-- 0080 I2I.U32.U16 R2, g [0x3].U16;
when 33 => instruction_out <= x"04200780"; 
when 34 => instruction_out <= x"600a100d";	-- 0088 IMAD.U16 R3, R4L, R5L, R3;
when 35 => instruction_out <= x"0000c780"; 
when 36 => instruction_out <= x"40050c19";	-- 0090 IMUL.U16.U16 R6, R3L, R2H;
when 37 => instruction_out <= x"00000780"; 
when 38 => instruction_out <= x"60040e19";	-- 0098 IMAD.U16 R6, R3H, R2L, R6;
when 39 => instruction_out <= x"00018780"; 
when 40 => instruction_out <= x"30100c19";	-- 00a0 SHL R6, R6, 0x10;
when 41 => instruction_out <= x"c4100780"; 
when 42 => instruction_out <= x"60040c19";	-- 00a8 IMAD.U16 R6, R3L, R2L, R6;
when 43 => instruction_out <= x"00018780"; 
when 44 => instruction_out <= x"a000480d";	-- 00b0 I2I.U32.U16 R3, g [0x4].U16;
when 45 => instruction_out <= x"04200780"; 
when 46 => instruction_out <= x"4007181d";	-- 00b8 IMUL.U16.U16 R7, R6L, R3H;
when 47 => instruction_out <= x"00000780"; 
when 48 => instruction_out <= x"60061a1d";	-- 00c0 IMAD.U16 R7, R6H, R3L, R7;
when 49 => instruction_out <= x"0001c780"; 
when 50 => instruction_out <= x"30100e1d";	-- 00c8 SHL R7, R7, 0x10;
when 51 => instruction_out <= x"c4100780"; 
when 52 => instruction_out <= x"6006181d";	-- 00d0 IMAD.U16 R7, R6L, R3L, R7;
when 53 => instruction_out <= x"0001c780";   
when 54 => instruction_out <= x"a0004a19";	-- 00d8 I2I.U32.U16 R6, g [0x5].U16;
when 55 => instruction_out <= x"04200780";   
when 56 => instruction_out <= x"400f1821";	-- 00e0 IMUL.U16.U16 R8, R6L, R7H;
when 57 => instruction_out <= x"00000780";   
when 58 => instruction_out <= x"600e1a21";	-- 00e8 IMAD.U16 R8, R6H, R7L, R8;
when 59 => instruction_out <= x"00020780";   
when 60 => instruction_out <= x"30101021";	-- 00f0 SHL R8, R8, 0x10;
when 61 => instruction_out <= x"c4100780";   
when 62 => instruction_out <= x"600e1819";	-- 00f8 IMAD.U16 R6, R6L, R7L, R8;
when 63 => instruction_out <= x"00020780";   
when 64 => instruction_out <= x"307c0dfd";	-- 0100 ISET.S32.C0 o [0x7f], R6, R124, LE;
when 65 => instruction_out <= x"6c00c7c8";   
when 66 => instruction_out <= x"10028003";	-- 0108 BRA C0.NE, 0x140;
when 67 => instruction_out <= x"00000280";   
when 68 => instruction_out <= x"1000f82d";	-- 0110 MOV R11, R124;
when 69 => instruction_out <= x"0403c780";   
when 70 => instruction_out <= x"30010c19";	-- 0118 SHR.S32 R6, R6, 0x1;
when 71 => instruction_out <= x"ec100780";   
when 72 => instruction_out <= x"307c0dfd";	-- 0120 ISET.S32.C0 o [0x7f], R6, R124, GT;
when 73 => instruction_out <= x"6c0107c8";   
when 74 => instruction_out <= x"2001962d";	-- 0128 IADD32I R11, R11, 0x1;
when 75 => instruction_out <= x"00000003";   
when 76 => instruction_out <= x"10023003";	-- 0130 BRA C0.NE, 0x118;
when 77 => instruction_out <= x"00000280";   
when 78 => instruction_out <= x"10029003";	-- 0138 BRA 0x148;
when 79 => instruction_out <= x"00000780";   
when 80 => instruction_out <= x"1000f82d";	-- 0140 MOV R11, R124;
when 81 => instruction_out <= x"0403c780";   
when 82 => instruction_out <= x"203f9425";	-- 0148 IADD32I R9, R10, 0xffffffff;
when 83 => instruction_out <= x"0fffffff";   
when 84 => instruction_out <= x"307c13fd";	-- 0150 ISET.S32.C0 o [0x7f], R9, R124, LE;
when 85 => instruction_out <= x"6c00c7c8";   
when 86 => instruction_out <= x"30000003";	-- 0158 RET C0.NE;
when 87 => instruction_out <= x"00000280";   
when 88 => instruction_out <= x"300a0231";	-- 0160 SHR.U16 R6L, R0H, 0xa;
when 89 => instruction_out <= x"e0100780";   
when 90 => instruction_out <= x"a000181d";	-- 0168 I2I.U32.U16 R7, R6L;
when 91 => instruction_out <= x"04000780";   
when 92 => instruction_out <= x"400e1619";	-- 0170 IMUL.U16.U16 R6, R5H, R7L;
when 93 => instruction_out <= x"00000780";   
when 94 => instruction_out <= x"d0800205";	-- 0178 LOP.AND.U16 R0H, R0H, c [0x1] [0x0];
when 95 => instruction_out <= x"00400780";   
when 96 => instruction_out <= x"600f1421";	-- 0180 IMAD.U16 R8, R5L, R7H, R6;
when 97 => instruction_out <= x"00018780";   
when 98 => instruction_out <= x"a0000219";	-- 0188 I2I.U32.U16 R6, R0H;
when 99 => instruction_out <= x"04000780";   
when 100 => instruction_out <= x"30101031";	-- 0190 SHL R12, R8, 0x10;
when 101 => instruction_out <= x"c4100780";   
when 102 => instruction_out <= x"400b1821";	-- 0198 IMUL.U16.U16 R8, R6L, R5H;
when 103 => instruction_out <= x"00000780"; 
when 104 => instruction_out <= x"600e141d";	-- 01a0 IMAD.U16 R7, R5L, R7L, R12;
when 105 => instruction_out <= x"00030780";   
when 106 => instruction_out <= x"600a1a31";	-- 01a8 IMAD.U16 R12, R6H, R5L, R8;
when 107 => instruction_out <= x"00020780";   
when 108 => instruction_out <= x"a0004e21";	-- 01b0 I2I.U32.U16 R8, g [0x7].U16;
when 109 => instruction_out <= x"04200780";   
when 110 => instruction_out <= x"40091c35";	-- 01b8 IMUL.U16.U16 R13, R7L, R4H;
when 111 => instruction_out <= x"00000780";   
when 112 => instruction_out <= x"30101831";	-- 01c0 SHL R12, R12, 0x10;
when 113 => instruction_out <= x"c4100780";   
when 114 => instruction_out <= x"60081e35";	-- 01c8 IMAD.U16 R13, R7H, R4L, R13;
when 115 => instruction_out <= x"00034780";   
when 116 => instruction_out <= x"600a1831";	-- 01d0 IMAD.U16 R12, R6L, R5L, R12;
when 117 => instruction_out <= x"00030780";   
when 118 => instruction_out <= x"40101639";	-- 01d8 IMUL.U16.U16 R14, R5H, R8L;
when 119 => instruction_out <= x"00000780";   
when 120 => instruction_out <= x"30101a19";	-- 01e0 SHL R6, R13, 0x10;
when 121 => instruction_out <= x"c4100780";   
when 122 => instruction_out <= x"60111439";	-- 01e8 IMAD.U16 R14, R5L, R8H, R14;
when 123 => instruction_out <= x"00038780";   
when 124 => instruction_out <= x"60081c35";	-- 01f0 IMAD.U16 R13, R7L, R4L, R6;
when 125 => instruction_out <= x"00018780";   
when 126 => instruction_out <= x"a0004c19";	-- 01f8 I2I.U32.U16 R6, g [0x6].U16;
when 127 => instruction_out <= x"04200780";   
when 128 => instruction_out <= x"30101c1d";	-- 0200 SHL R7, R14, 0x10;
when 129 => instruction_out <= x"c4100780";   
when 130 => instruction_out <= x"6010141d";	-- 0208 IMAD.U16 R7, R5L, R8L, R7;
when 131 => instruction_out <= x"0001c780";   
when 132 => instruction_out <= x"400c1621";	-- 0210 IMUL.U16.U16 R8, R5H, R6L;
when 133 => instruction_out <= x"00000780";   
when 134 => instruction_out <= x"600d1421";	-- 0218 IMAD.U16 R8, R5L, R6H, R8;
when 135 => instruction_out <= x"00020780";   
when 136 => instruction_out <= x"30101021";	-- 0220 SHL R8, R8, 0x10;
when 137 => instruction_out <= x"c4100780";   
when 138 => instruction_out <= x"600c1415";	-- 0228 IMAD.U16 R5, R5L, R6L, R8;
when 139 => instruction_out <= x"00020780";   
when 140 => instruction_out <= x"400e1219";	-- 0230 IMUL.U16.U16 R6, R4H, R7L;
when 141 => instruction_out <= x"00000780";   
when 142 => instruction_out <= x"600f1019";	-- 0238 IMAD.U16 R6, R4L, R7H, R6;
when 143 => instruction_out <= x"00018780";   
when 144 => instruction_out <= x"30100c19";	-- 0240 SHL R6, R6, 0x10;
when 145 => instruction_out <= x"c4100780";   
when 146 => instruction_out <= x"600e1019";	-- 0248 IMAD.U16 R6, R4L, R7L, R6;
when 147 => instruction_out <= x"00018780";   
when 148 => instruction_out <= x"400a121c";	-- 0250 IMUL32.U16.U16 R7, R4H, R5L;
when 149 => instruction_out <= x"400c0a20";	-- 0254 IMUL32.U16.U16 R8, R2H, R6L;
when 150 => instruction_out <= x"600b101d";	-- 0258 IMAD.U16 R7, R4L, R5H, R7;
when 151 => instruction_out <= x"0001c780";   
when 152 => instruction_out <= x"600d0821";	-- 0260 IMAD.U16 R8, R2L, R6H, R8;
when 153 => instruction_out <= x"00020780";   
when 154 => instruction_out <= x"30100e1d";	-- 0268 SHL R7, R7, 0x10;
when 155 => instruction_out <= x"c4100780";   
when 156 => instruction_out <= x"30101021";	-- 0270 SHL R8, R8, 0x10;
when 157 => instruction_out <= x"c4100780";   
when 158 => instruction_out <= x"600a1011";	-- 0278 IMAD.U16 R4, R4L, R5L, R7;
when 159 => instruction_out <= x"0001c780";   
when 160 => instruction_out <= x"600c0815";	-- 0280 IMAD.U16 R5, R2L, R6L, R8;
when 161 => instruction_out <= x"00020780";   
when 162 => instruction_out <= x"40051018";	-- 0288 IMUL32.U16.U16 R6, R4L, R2H;
when 163 => instruction_out <= x"4007141c";	-- 028c IMUL32.U16.U16 R7, R5L, R3H;
when 164 => instruction_out <= x"60041219";	-- 0290 IMAD.U16 R6, R4H, R2L, R6;
when 165 => instruction_out <= x"00018780";   
when 166 => instruction_out <= x"60061621";	-- 0298 IMAD.U16 R8, R5H, R3L, R7;
when 167 => instruction_out <= x"0001c780";   
when 168 => instruction_out <= x"30100c1d";	-- 02a0 SHL R7, R6, 0x10;
when 169 => instruction_out <= x"c4100780";   
when 170 => instruction_out <= x"30101021";	-- 02a8 SHL R8, R8, 0x10;
when 171 => instruction_out <= x"c4100780";   
when 172 => instruction_out <= x"20001819";	-- 02b0 IADD R6, R12, R13;
when 173 => instruction_out <= x"04034780";   
when 174 => instruction_out <= x"60041009";	-- 02b8 IMAD.U16 R2, R4L, R2L, R7;
when 175 => instruction_out <= x"0001c780";   
when 176 => instruction_out <= x"a0000001";	-- 02c0 I2I.U32.U16 R0, R0L;
when 177 => instruction_out <= x"04000780";   
when 178 => instruction_out <= x"6006140d";	-- 02c8 IMAD.U16 R3, R5L, R3L, R8;
when 179 => instruction_out <= x"00020780";   
when 180 => instruction_out <= x"20068000";	-- 02d0 IADD32 R0, R0, R6;
when 181 => instruction_out <= x"20038410";	-- 02d4 IADD32 R4, R2, R3;
when 182 => instruction_out <= x"2040140d";	-- 02d8 IADD R3, R10, -R11;
when 183 => instruction_out <= x"0402c780";   
when 184 => instruction_out <= x"10018009";	-- 02e0 MVI R2, 0x1;
when 185 => instruction_out <= x"00000003";   
when 186 => instruction_out <= x"20000001";	-- 02e8 IADD R0, R0, R4;
when 187 => instruction_out <= x"04010780";   
when 188 => instruction_out <= x"30030409";	-- 02f0 SHL R2, R2, R3;
when 189 => instruction_out <= x"c4000780";   
when 190 => instruction_out <= x"2001800d";	-- 02f8 IADD32I R3, R0, 0x1;
when 191 => instruction_out <= x"00000003";   
when 192 => instruction_out <= x"40070810";	-- 0300 IMUL32.U16.U16 R4, R2L, R3H;
when 193 => instruction_out <= x"40010814";	-- 0304 IMUL32.U16.U16 R5, R2L, R0H;
when 194 => instruction_out <= x"60060a11";	-- 0308 IMAD.U16 R4, R2H, R3L, R4;
when 195 => instruction_out <= x"00010780";   
when 196 => instruction_out <= x"60000a15";	-- 0310 IMAD.U16 R5, R2H, R0L, R5;
when 197 => instruction_out <= x"00014780";   
when 198 => instruction_out <= x"30100811";	-- 0318 SHL R4, R4, 0x10;
when 199 => instruction_out <= x"c4100780";   
when 200 => instruction_out <= x"30100a15";	-- 0320 SHL R5, R5, 0x10;
when 201 => instruction_out <= x"c4100780";   
when 202 => instruction_out <= x"6006081d";	-- 0328 IMAD.U16 R7, R2L, R3L, R4;
when 203 => instruction_out <= x"00010780";   
when 204 => instruction_out <= x"60000809";	-- 0330 IMAD.U16 R2, R2L, R0L, R5;
when 205 => instruction_out <= x"00014780";   
when 206 => instruction_out <= x"203f8221";	-- 0338 IADD32I R8, R1, 0xffffffff;
when 207 => instruction_out <= x"0fffffff";   
when 208 => instruction_out <= x"1000f829";	-- 0340 MOV R10, R124;
when 209 => instruction_out <= x"0403c780";   
when 210 => instruction_out <= x"1001802d";	-- 0348 MVI R11, 0x1;
when 211 => instruction_out <= x"00000003";   
when 212 => instruction_out <= x"300705fd";	-- 0350 ISET.S32.C0 o [0x7f], R2, R7, LT;
when 213 => instruction_out <= x"6c0047c8";   
when 214 => instruction_out <= x"a00a1003";	-- 0358 SSY 0x508;
when 215 => instruction_out <= x"00000000";   
when 216 => instruction_out <= x"10000401";	-- 0360 MOV R0, R2;
when 217 => instruction_out <= x"0403c780";   
when 218 => instruction_out <= x"100a1003";	-- 0368 BRA C0.EQ, 0x508;
when 219 => instruction_out <= x"00000100";   
when 220 => instruction_out <= x"d00b01fd";	-- 0370 LOP.AND.C1 o [0x7f], R0, R11;
when 221 => instruction_out <= x"040007d8";   
when 222 => instruction_out <= x"a009d003";	-- 0378 SSY 0x4e8;
when 223 => instruction_out <= x"00000000";   
when 224 => instruction_out <= x"1009d003";	-- 0380 BRA C1.NE, 0x4e8;
when 225 => instruction_out <= x"00001280";   
when 226 => instruction_out <= x"4001040d";	-- 0388 IMUL.U16.U16 R3, R1L, R0H;
when 227 => instruction_out <= x"00000780";   
when 228 => instruction_out <= x"6000060d";	-- 0390 IMAD.U16 R3, R1H, R0L, R3;
when 229 => instruction_out <= x"0000c780";   
when 230 => instruction_out <= x"3010060d";	-- 0398 SHL R3, R3, 0x10;
when 231 => instruction_out <= x"c4100780";   
when 232 => instruction_out <= x"60000411";	-- 03a0 IMAD.U16 R4, R1L, R0L, R3;
when 233 => instruction_out <= x"0000c780";   
when 234 => instruction_out <= x"2000000d";	-- 03a8 IADD R3, R0, R11;
when 235 => instruction_out <= x"0402c780";   
when 236 => instruction_out <= x"d0080811";	-- 03b0 LOP.AND R4, R4, R8;
when 237 => instruction_out <= x"04000780";   
when 238 => instruction_out <= x"3003060d";	-- 03b8 SHL R3, R3, 0x3;
when 239 => instruction_out <= x"c4100780";   
when 240 => instruction_out <= x"30030811";	-- 03c0 SHL R4, R4, 0x3;
when 241 => instruction_out <= x"c4100780";   
when 242 => instruction_out <= x"2000c831";	-- 03c8 IADD R12, g [0x4], R3;
when 243 => instruction_out <= x"0420c780";   
when 244 => instruction_out <= x"d00e180d";	-- 03d0 GLD.U32 R3, global14 [R12];
when 245 => instruction_out <= x"80c00780";   
when 246 => instruction_out <= x"2000ca19";	-- 03d8 IADD R6, g [0x5], R4;
when 247 => instruction_out <= x"04210780";   
when 248 => instruction_out <= x"20049835";	-- 03e0 IADD32I R13, R12, 0x4;
when 249 => instruction_out <= x"00000003";   
when 250 => instruction_out <= x"d00e1a15";	-- 03e8 GLD.U32 R5, global14 [R13];
when 251 => instruction_out <= x"80c00780";   
when 252 => instruction_out <= x"d00e0c11";	-- 03f0 GLD.U32 R4, global14 [R6];
when 253 => instruction_out <= x"80c00780";   
when 254 => instruction_out <= x"20048c19";	-- 03f8 IADD32I R6, R6, 0x4;
when 255 => instruction_out <= x"00000003";   
when 256 => instruction_out <= x"d00e0c19";	-- 0400 GLD.U32 R6, global14 [R6];
when 257 => instruction_out <= x"80c00780";   
when 258 => instruction_out <= x"40090c38";	-- 0408 IMUL32.U16.U16 R14, R3L, R4H;
when 259 => instruction_out <= x"400d143c";	-- 040c IMUL32.U16.U16 R15, R5L, R6H;
when 260 => instruction_out <= x"60080e39";	-- 0410 IMAD.U16 R14, R3H, R4L, R14;
when 261 => instruction_out <= x"00038780";   
when 262 => instruction_out <= x"600c163d";	-- 0418 IMAD.U16 R15, R5H, R6L, R15;
when 263 => instruction_out <= x"0003c780";   
when 264 => instruction_out <= x"30101c39";	-- 0420 SHL R14, R14, 0x10;
when 265 => instruction_out <= x"c4100780";   
when 266 => instruction_out <= x"30101e3d";	-- 0428 SHL R15, R15, 0x10;
when 267 => instruction_out <= x"c4100780";  
when 268 => instruction_out <= x"60080c39";	-- 0430 IMAD.U16 R14, R3L, R4L, R14;
when 269 => instruction_out <= x"00038780";   
when 270 => instruction_out <= x"600c143d";	-- 0438 IMAD.U16 R15, R5L, R6L, R15;
when 271 => instruction_out <= x"0003c780";   
when 272 => instruction_out <= x"204f9c38";	-- 0440 IADD32 R14, R14, -R15;
when 273 => instruction_out <= x"400d0c3c";	-- 0444 IMUL32.U16.U16 R15, R3L, R6H;
when 274 => instruction_out <= x"600c0e3d";	-- 0448 IMAD.U16 R15, R3H, R6L, R15;
when 275 => instruction_out <= x"0003c780";   
when 276 => instruction_out <= x"30101e3d";	-- 0450 SHL R15, R15, 0x10;
when 277 => instruction_out <= x"c4100780";   
when 278 => instruction_out <= x"600c0c0d";	-- 0458 IMAD.U16 R3, R3L, R6L, R15;
when 279 => instruction_out <= x"0003c780";   
when 280 => instruction_out <= x"400a1219";	-- 0460 IMUL.U16.U16 R6, R4H, R5L;
when 281 => instruction_out <= x"00000780";   
when 282 => instruction_out <= x"600b1019";	-- 0468 IMAD.U16 R6, R4L, R5H, R6;
when 283 => instruction_out <= x"00018780";   
when 284 => instruction_out <= x"30100c19";	-- 0470 SHL R6, R6, 0x10;
when 285 => instruction_out <= x"c4100780";   
when 286 => instruction_out <= x"600a1019";	-- 0478 IMAD.U16 R6, R4L, R5L, R6;
when 287 => instruction_out <= x"00018780";   
when 288 => instruction_out <= x"30030011";	-- 0480 SHL R4, R0, 0x3;
when 289 => instruction_out <= x"c4100780";   
when 290 => instruction_out <= x"2000c815";	-- 0488 IADD R5, g [0x4], R4;
when 291 => instruction_out <= x"04210780";   
when 292 => instruction_out <= x"d00e0a11";	-- 0490 GLD.U32 R4, global14 [R5];
when 293 => instruction_out <= x"80c00780";   
when 294 => instruction_out <= x"20000619";	-- 0498 IADD R6, R3, R6;
when 295 => instruction_out <= x"04018780";   
when 296 => instruction_out <= x"20048a3d";	-- 04a0 IADD32I R15, R5, 0x4;
when 297 => instruction_out <= x"00000003";   
when 298 => instruction_out <= x"d00e1e0d";	-- 04a8 GLD.U32 R3, global14 [R15];
when 299 => instruction_out <= x"80c00780";   
when 300 => instruction_out <= x"20000841";	-- 04b0 IADD R16, R4, R14;
when 301 => instruction_out <= x"04038780";   
when 302 => instruction_out <= x"d00e0a41";	-- 04b8 GST.U32 global14 [R5], R16;
when 303 => instruction_out <= x"a0c00780";   
when 304 => instruction_out <= x"204e8814";	-- 04c0 IADD32 R5, R4, -R14;
when 305 => instruction_out <= x"20068610";	-- 04c4 IADD32 R4, R3, R6;
when 306 => instruction_out <= x"d00e1e11";	-- 04c8 GST.U32 global14 [R15], R4;
when 307 => instruction_out <= x"a0c00780";   
when 308 => instruction_out <= x"d00e1815";	-- 04d0 GST.U32 global14 [R12], R5;
when 309 => instruction_out <= x"a0c00780";   
when 310 => instruction_out <= x"2040060d";	-- 04d8 IADD R3, R3, -R6;
when 311 => instruction_out <= x"04018780";   
when 312 => instruction_out <= x"d00e1a0d";	-- 04e0 GST.U32 global14 [R13], R3;
when 313 => instruction_out <= x"a0c00780";   
when 314 => instruction_out <= x"f0000001";	-- 04e8 NOP.S;
when 315 => instruction_out <= x"e0000002";   
when 316 => instruction_out <= x"20018001";	-- 04f0 IADD32I R0, R0, 0x1;
when 317 => instruction_out <= x"00000003";   
when 318 => instruction_out <= x"30000ffd";	-- 04f8 ISET.S32.C1 o [0x7f], R7, R0, NE;
when 319 => instruction_out <= x"6c0147d8";   
when 320 => instruction_out <= x"1006e003";	-- 0500 BRA C1.NE, 0x370;
when 321 => instruction_out <= x"00001280";   
when 322 => instruction_out <= x"3001162d";	-- 0508 SHL.S R11, R11, 0x1;
when 323 => instruction_out <= x"c4100782";   
when 324 => instruction_out <= x"20019429";	-- 0510 IADD32I R10, R10, 0x1;
when 325 => instruction_out <= x"00000003";   
when 326 => instruction_out <= x"300a13fd";	-- 0518 ISET.S32.C1 o [0x7f], R9, R10, NE;
when 327 => instruction_out <= x"6c0147d8";   
when 328 => instruction_out <= x"30010205";	-- 0520 SHR.S32 R1, R1, 0x1;
when 329 => instruction_out <= x"ec100780";   
when 330 => instruction_out <= x"1006b003";	-- 0528 BRA C1.NE, 0x358;
when 331 => instruction_out <= x"00001280";   
when 332 => instruction_out <= x"f0000001";	-- 0530 NOP ;
when 333 => instruction_out <= x"e0000001";
when 334 => instruction_out <= x"30000003"; -- RET ;
when 335 => instruction_out <= x"00000780";

			when others => null;
		end case;
	end process;

end arch;