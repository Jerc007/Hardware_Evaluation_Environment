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
	constant TP_INSTRUCTIONS : integer := 86;

begin
	num_instructions_out <= TP_INSTRUCTIONS;

	process(instruction_pointer_in)
	begin
		case instruction_pointer_in is
			when 0 => instruction_out <= x"d080020d";   -- 0000  LOP.AND.U16 R1H, R0H, c[0x1][0x0]; 
when 1 => instruction_out <= x"00400780";
when 2 => instruction_out <= x"10004409";   -- 0008  MOV.U16 R1L, g [0x2].U16; 
when 3 => instruction_out <= x"0023c780";
when 4 => instruction_out <= x"a0000609";   -- 0010  I2I.U32.U16 R2, R1H; 
when 5 => instruction_out <= x"04000780";
when 6 => instruction_out <= x"60024e09";   -- 0018  IMAD.U16 R2, g [0x7].U16, R1L, R2; 
when 7 => instruction_out <= x"00208780";
when 8 => instruction_out <= x"3002CFFD";   -- 0020  ISET.S32.C0 o[0x7f], g [0x7], R2, LE; -7
when 9 => instruction_out <= x"6c20c7c8";
when 10 => instruction_out <= x"30000003";   -- 0028  RET C0.NE; 
when 11 => instruction_out <= x"00000280";
when 12 => instruction_out <= x"10004205";   -- 0030  MOV.U16 R0H, g [0x1].U16; 
when 13 => instruction_out <= x"0023c780";
when 14 => instruction_out <= x"a0000005";   -- 0038  I2I.U32.U16 R1, R0L; 
when 15 => instruction_out <= x"04000780";
when 16 => instruction_out <= x"60014c0d";   -- 0040  IMAD.U16 R3, g [0x6].U16, R0H, R1; 
when 17 => instruction_out <= x"00204780";
when 18 => instruction_out <= x"3003d1fd";   -- 0048  ISET.S32.C0 o[0x7f], g [0x8], R3, LE; -8
when 19 => instruction_out <= x"6c20c7c8";
when 20 => instruction_out <= x"30000003";   -- 0050  RET C0.NE; 
when 21 => instruction_out <= x"00000280";
when 22 => instruction_out <= x"307CD3FD";   -- 0058  ISET.S32.C0 o[0x7f], g [0x9], R124, LE; -9
when 23 => instruction_out <= x"6c20c7c8";
when 24 => instruction_out <= x"30000003";   -- 0060  RET C0.NE; 
when 25 => instruction_out <= x"00000280";
when 26 => instruction_out <= x"1000d005";   -- 0068  MOV R1, g [0x8]; -8
when 27 => instruction_out <= x"0423c780";
when 28 => instruction_out <= x"1000d201";   -- 0070  MOV R0, g [0x9]; -9
when 29 => instruction_out <= x"0423c780";
when 30 => instruction_out <= x"40050410";   -- 0078  IMUL32.U16.U16 R4, R1L, R2H;
when 31 => instruction_out <= x"40000a14";   -- 007c  IMUL32.U16.U16 R5, R2H, R0L;
when 32 => instruction_out <= x"60040611";   -- 0080  IMAD.U16 R4, R1H, R2L, R4; 
when 33 => instruction_out <= x"00010780";
when 34 => instruction_out <= x"60010815";   -- 0088  IMAD.U16 R5, R2L, R0H, R5; 
when 35 => instruction_out <= x"00014780";
when 36 => instruction_out <= x"30100811";   -- 0090  SHL R4, R4, 0x10;
when 37 => instruction_out <= x"c4100780";
when 38 => instruction_out <= x"30100a15";   -- 0098  SHL R5, R5, 0x10;
when 39 => instruction_out <= x"c4100780";
when 40 => instruction_out <= x"60040405";   -- 00a0  IMAD.U16 R1, R1L, R2L, R4;
when 41 => instruction_out <= x"00010780";
when 42 => instruction_out <= x"60000809";   -- 00a8  IMAD.U16 R2, R2L, R0L, R5;
when 43 => instruction_out <= x"00014780";
when 44 => instruction_out <= x"20000201";   -- 00b0  IADD R0, R1, R3; 
when 45 => instruction_out <= x"0400c780";
when 46 => instruction_out <= x"30020611";   -- 00b8  SHL R4, R3, 0x2; 
when 47 => instruction_out <= x"c4100780";
when 48 => instruction_out <= x"3002d00d";   -- 00c0  SHL R3, g [0x8], 0x2; -8
when 49 => instruction_out <= x"c4300780";
when 50 => instruction_out <= x"30020405";   -- 00c8  SHL R1, R2, 0x2;
when 51 => instruction_out <= x"c4100780";
when 52 => instruction_out <= x"30020001";   -- 00d0  SHL R0, R0, 0x2;
when 53 => instruction_out <= x"c4100780";
when 54 => instruction_out <= x"2104ea10";   -- 00d8  IADD32 R4, g [0x5], R4; -5
when 55 => instruction_out <= x"2102F214";   -- 00dc  IADD32 R5, g [0x9], R2; -9
when 56 => instruction_out <= x"2101e818";   -- 00e0  IADD32 R6, g [0x4], R1;
when 57 => instruction_out <= x"2100EC1C";   -- 00e4  IADD32 R7, g [0x6], R0; -6
when 58 => instruction_out <= x"d00e0801";   -- 00e8  GLD.U32 R0, global14[R4]; 
when 59 => instruction_out <= x"80c00780";
when 60 => instruction_out <= x"d00e0c05";   -- 00f0  GLD.U32 R1, global14[R6]; 
when 61 => instruction_out <= x"80c00780";
when 62 => instruction_out <= x"40030021";   -- 00f8  IMUL.U16.U16 R8, R0L, R1H; 
when 63 => instruction_out <= x"00000780";
when 64 => instruction_out <= x"60020221";   -- 0100  IMAD.U16 R8, R0H, R1L, R8; 
when 65 => instruction_out <= x"00020780";
when 66 => instruction_out <= x"30101021";   -- 0108  SHL R8, R8, 0x10; 
when 67 => instruction_out <= x"c4100780";
when 68 => instruction_out <= x"20018409";   -- 0110  IADD32I R2, R2, 0x1; 
when 69 => instruction_out <= x"00000003";
when 70 => instruction_out <= x"60020001";   -- 0118  IMAD.U16 R0, R0L, R1L, R8; 
when 71 => instruction_out <= x"00020780";
when 72 => instruction_out <= x"300505fd";   -- 0120  ISET.S32.C0 o[0x7f], R2, R5, NE; 
when 73 => instruction_out <= x"6c0147c8";
when 74 => instruction_out <= x"d00e0e01";   -- 0128  GST.U32 global14[R7], R0; 
when 75 => instruction_out <= x"a0c00780";
when 76 => instruction_out <= x"20048c19";   -- 0130  IADD32I R6, R6, 0x4; 
when 77 => instruction_out <= x"00000003";
when 78 => instruction_out <= x"20000611";   -- 0138  IADD R4, R3, R4; 
when 79 => instruction_out <= x"04010780";
when 80 => instruction_out <= x"1001d003";   -- 0140  BRA C0.NE, 0xe8; 
when 81 => instruction_out <= x"00000280";
when 82 => instruction_out <= x"f0000001";   -- 0148  NOP; 
when 83 => instruction_out <= x"e0000001";
when 84 => instruction_out <= x"30000003";   -- RET
when 85 => instruction_out <= x"00000780";

			when others => null;
		end case;
	end process;

end arch;
