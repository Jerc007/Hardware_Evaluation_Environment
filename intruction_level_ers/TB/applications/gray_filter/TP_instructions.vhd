
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
	constant TP_INSTRUCTIONS : integer := 76;

begin
	num_instructions_out <= TP_INSTRUCTIONS;

	process(instruction_pointer_in)
	begin
		case instruction_pointer_in is
			when 0 => instruction_out <= x"d0800209";   -- 0000  LOP.AND.U16 R1L, R0H, c[0x1][0x0]; 
when 1 => instruction_out <= x"00400780";
when 2 => instruction_out <= x"10004405";   -- 0008  MOV.U16 R0H, g [0x2].U16; 
when 3 => instruction_out <= x"0023c780";
when 4 => instruction_out <= x"a0000409";   -- 0010  I2I.U32.U16 R2, R1L; 
when 5 => instruction_out <= x"04000780";
when 6 => instruction_out <= x"10004209";   -- 0018  MOV.U16 R1L, g [0x1].U16; 
when 7 => instruction_out <= x"0023c780";
when 8 => instruction_out <= x"a000000d";   -- 0020  I2I.U32.U16 R3, R0L; 
when 9 => instruction_out <= x"04000780";
when 10 => instruction_out <= x"60014e01";   -- 0028  IMAD.U16 R0, g [0x7].U16, R0H, R2; 
when 11 => instruction_out <= x"00208780";
when 12 => instruction_out <= x"60024c05";   -- 0030  IMAD.U16 R1, g [0x6].U16, R1L, R3; 
when 13 => instruction_out <= x"0020c780";
when 14 => instruction_out <= x"30060001";   -- 0038  SHL R0, R0, 0x6; 
when 15 => instruction_out <= x"c4100780";
when 16 => instruction_out <= x"20000009";   -- 0040  IADD R2, R0, R1; 
when 17 => instruction_out <= x"04004780";
when 18 => instruction_out <= x"30010401";   -- 0048  SHL R0, R2, 0x1; 
when 19 => instruction_out <= x"c4100780";
when 20 => instruction_out <= x"20008400";   -- 0050  IADD32 R0, R2, R0;
when 21 => instruction_out <= x"2100e800";   -- 0054  IADD32 R0, g [0x4], R0;
when 22 => instruction_out <= x"20018005";   -- 0058  IADD32I R1, R0, 0x1; 
when 23 => instruction_out <= x"00000003";
when 24 => instruction_out <= x"20028011";   -- 0060  IADD32I R4, R0, 0x2; 
when 25 => instruction_out <= x"00000003";
when 26 => instruction_out <= x"d00e0001";   -- 0068  GLD.U8 R0, global14[R0]; 
when 27 => instruction_out <= x"80000780";
when 28 => instruction_out <= x"d00e020d";   -- 0070  GLD.U8 R3, global14[R1]; 
when 29 => instruction_out <= x"80000780";
when 30 => instruction_out <= x"d00e0805";   -- 0078  GLD.U8 R1, global14[R4]; 
when 31 => instruction_out <= x"80000780";
when 32 => instruction_out <= x"30030411";   -- 0080  SHL R4, R2, 0x3; 
when 33 => instruction_out <= x"c4100780";
when 34 => instruction_out <= x"30020409";   -- 0088  SHL R2, R2, 0x2; 
when 35 => instruction_out <= x"c4100780";
when 36 => instruction_out <= x"20000811";   -- 0090  IADD R4, R4, R2; 
when 37 => instruction_out <= x"04008780";
when 38 => instruction_out <= x"a0000c0d";   -- 0098  I2F.F32.U16.BEXT R3, R3L; 
when 39 => instruction_out <= x"44008780";
when 40 => instruction_out <= x"2000ca11";   -- 00a0  IADD R4, g [0x5], R4; 
when 41 => instruction_out <= x"04210780";
when 42 => instruction_out <= x"a0000001";   -- 00a8  I2F.F32.U16.BEXT R0, R0L; 
when 43 => instruction_out <= x"44008780";
when 44 => instruction_out <= x"a0000615";   -- 00b0  F2F.F32.F32 R5, R3; 
when 45 => instruction_out <= x"c4004780";
when 46 => instruction_out <= x"d00e0801";   -- 00b8  GST.U32 global14[R4], R0; 
when 47 => instruction_out <= x"a0c00780";
when 48 => instruction_out <= x"a0000019";   -- 00c0  F2F.F32.F32 R6, R0; 
when 49 => instruction_out <= x"c4004780";
when 50 => instruction_out <= x"c0190a01";   -- 00c8  FMUL32I R0, R5, 0x3f371759; 
when 51 => instruction_out <= x"03f37177";
when 52 => instruction_out <= x"a0000405";   -- 00d0  I2F.F32.U16.BEXT R1, R1L; 
when 53 => instruction_out <= x"44008780";
when 54 => instruction_out <= x"20048815";   -- 00d8  IADD32I R5, R4, 0x4; 
when 55 => instruction_out <= x"00000003";
when 56 => instruction_out <= x"e0100c01";   -- 00e0  FMAD32I R0, R6, 0x3e59b3d0, R0; 
when 57 => instruction_out <= x"03e59b3f";
when 58 => instruction_out <= x"a0000219";   -- 00e8  F2F.F32.F32 R6, R1; 
when 59 => instruction_out <= x"c4004780";
when 60 => instruction_out <= x"d00e0a0d";   -- 00f0  GST.U32 global14[R5], R3; 
when 61 => instruction_out <= x"a0c00780";
when 62 => instruction_out <= x"2008880d";   -- 00f8  IADD32I R3, R4, 0x8; 
when 63 => instruction_out <= x"00000003";
when 64 => instruction_out <= x"e0180c01";   -- 0100  FMAD32I R0, R6, 0x3d93dd98, R0; 
when 65 => instruction_out <= x"03d93ddb";
when 66 => instruction_out <= x"d00e0605";   -- 0108  GST.U32 global14[R3], R1; 
when 67 => instruction_out <= x"a0c00780";
when 68 => instruction_out <= x"2000cc05";   -- 0110  IADD R1, g [0x6], R2; 
when 69 => instruction_out <= x"04208780";
when 70 => instruction_out <= x"a0000001";   -- 0118  F2I.U32.F32.TRUNC R0, R0; 
when 71 => instruction_out <= x"84064780";
when 72 => instruction_out <= x"d00e0201";   -- 0120  GST.U32 global14[R1], R0; 
when 73 => instruction_out <= x"a0c00781";
when 74 => instruction_out <= x"30000003";   -- RET
when 75 => instruction_out <= x"00000780";

			when others => null;
		end case;
	end process;

end arch;
