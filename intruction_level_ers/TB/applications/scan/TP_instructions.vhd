

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
	constant TP_INSTRUCTIONS : integer := 84;

begin
	num_instructions_out <= TP_INSTRUCTIONS;

	process(instruction_pointer_in)
	begin
		case instruction_pointer_in is
			when 0 => instruction_out <= x"3002cc19";   -- 0000  SHR R6, g [0x6], 0x2;   +- 6
when 1 => instruction_out <= x"e4300780";
when 2 => instruction_out <= x"a0000005";   -- 0008  I2I.U32.U16 R1, R0L; 
when 3 => instruction_out <= x"04000780";
when 4 => instruction_out <= x"203f8c0d";   -- 0010  IADD32I R3, R6, 0xffffffff; 
when 5 => instruction_out <= x"0fffffff";
when 6 => instruction_out <= x"10004201";   -- 0018  MOV.U16 R0L, g [0x1].U16; 
when 7 => instruction_out <= x"0023c780";
when 8 => instruction_out <= x"30010209";   -- 0020  SHL R2, R1, 0x1; 
when 9 => instruction_out <= x"c4100780";
when 10 => instruction_out <= x"d003020d";   -- 0028  LOP.AND R3, R1, R3; 
when 11 => instruction_out <= x"04000780";
when 12 => instruction_out <= x"60004c01";   -- 0030  IMAD.U16 R0, g [0x6].U16, R0L, R1; 
when 13 => instruction_out <= x"00204780";
when 14 => instruction_out <= x"2040041d";   -- 0038  IADD R7, R2, -R3; 
when 15 => instruction_out <= x"0400c780";
when 16 => instruction_out <= x"30040015";   -- 0040  SHL R5, R0, 0x4; 
when 17 => instruction_out <= x"c4100780";
when 18 => instruction_out <= x"00020e05";   -- 0048  R2A A1, R7, 0x2; 
when 19 => instruction_out <= x"c0000780";
when 20 => instruction_out <= x"2000ca11";   -- 0050  IADD R4, g [0x5], R5;   +- 5
when 21 => instruction_out <= x"04214780";
when 22 => instruction_out <= x"04001201";   -- 0058  R2G.U32.U32 g[A1+0x9], R124; 
when 23 => instruction_out <= x"e43f0780";
when 24 => instruction_out <= x"d00e0801";   -- 0060  GLD.S128 R0, global14[R4]; 
when 25 => instruction_out <= x"80a00780";
when 26 => instruction_out <= x"20018010";   -- 0068  IADD32 R4, R0, R1;
when 27 => instruction_out <= x"20078c20";   -- 006c  IADD32 R8, R6, R7;
when 28 => instruction_out <= x"2000041d";   -- 0070  IADD R7, R2, R4; 
when 29 => instruction_out <= x"04010780";
when 30 => instruction_out <= x"30800dfd";   -- 0078  ISET.C0 o[0x7f], R6, c[0x1][0x0], LE;   +- could be 2h ++ 0x00000010  0x00000004  0x00000008  0x0000000c  0x00000002
when 31 => instruction_out <= x"6440c7c8";
when 32 => instruction_out <= x"00021005";   -- 0080  R2A A1, R8, 0x2; 
when 33 => instruction_out <= x"c0000780";
when 34 => instruction_out <= x"20000601";   -- 0088  IADD R0, R3, R7; 
when 35 => instruction_out <= x"0401c780";
when 36 => instruction_out <= x"04001201";   -- 0090  R2G.U32.U32 g[A1+0x9], R0; 
when 37 => instruction_out <= x"e4200780";
when 38 => instruction_out <= x"10022003";   -- 0098  BRA C0.NE, 0x110; 
when 39 => instruction_out <= x"00000280";
when 40 => instruction_out <= x"10018025";   -- 00a0  MVI R9, 0x1; 
when 41 => instruction_out <= x"00000003";
when 42 => instruction_out <= x"861ffe03";   -- 00a8  BAR.ARV.WAIT b0, 0xfff; 
when 43 => instruction_out <= x"00000000";
when 44 => instruction_out <= x"20401029";   -- 00b0  IADD R10, R8, -R9; 
when 45 => instruction_out <= x"04024780";
when 46 => instruction_out <= x"00021009";   -- 00b8  R2A A2, R8, 0x2; 
when 47 => instruction_out <= x"c0000780";
when 48 => instruction_out <= x"00021405";   -- 00c0  R2A A1, R10, 0x2; 
when 49 => instruction_out <= x"c0000780";
when 50 => instruction_out <= x"1800d22d";   -- 00c8  MOV R11, g [A2+0x9]; 
when 51 => instruction_out <= x"0423c780";
when 52 => instruction_out <= x"1400d229";   -- 00d0  MOV R10, g [A1+0x9]; 
when 53 => instruction_out <= x"0423c780";
when 54 => instruction_out <= x"20001629";   -- 00d8  IADD R10, R11, R10; 
when 55 => instruction_out <= x"04028780";
when 56 => instruction_out <= x"861ffe03";   -- 00e0  BAR.ARV.WAIT b0, 0xfff; 
when 57 => instruction_out <= x"00000000";
when 58 => instruction_out <= x"30011225";   -- 00e8  SHL R9, R9, 0x1; 
when 59 => instruction_out <= x"c4100780";
when 60 => instruction_out <= x"00021005";   -- 00f0  R2A A1, R8, 0x2; 
when 61 => instruction_out <= x"c0000780";
when 62 => instruction_out <= x"30090dfd";   -- 00f8  ISET.C0 o[0x7f], R6, R9, GT; 
when 63 => instruction_out <= x"640107c8";
when 64 => instruction_out <= x"04001201";   -- 0100  R2G.U32.U32 g[A1+0x9], R10; 
when 65 => instruction_out <= x"e4228780";
when 66 => instruction_out <= x"10015003";   -- 0108  BRA C0.NE, 0xa8; 
when 67 => instruction_out <= x"00000280";
when 68 => instruction_out <= x"00021005";   -- 0110  R2A A1, R8, 0x2; 
when 69 => instruction_out <= x"c0000780";
when 70 => instruction_out <= x"1400d219";   -- 0118  MOV R6, g [A1+0x9]; 
when 71 => instruction_out <= x"0423c780";
when 72 => instruction_out <= x"20408c00";   -- 0120  IADD32 R0, R6, -R0;
when 73 => instruction_out <= x"20048010";   -- 0124  IADD32 R4, R0, R4;
when 74 => instruction_out <= x"2007801c";   -- 0128  IADD32 R7, R0, R7;
when 75 => instruction_out <= x"20438c0c";   -- 012c  IADD32 R3, R6, -R3;
when 76 => instruction_out <= x"20418804";   -- 0130  IADD32 R1, R4, -R1;
when 77 => instruction_out <= x"20428e08";   -- 0134  IADD32 R2, R7, -R2;
when 78 => instruction_out <= x"2000c811";   -- 0138  IADD R4, g [0x4], R5; 
when 79 => instruction_out <= x"04214780";
when 80 => instruction_out <= x"d00e0801";   -- 0140  GST.S128 global14[R4], R0; 
when 81 => instruction_out <= x"a0a00781";
when 82 => instruction_out <= x"30000003";   -- RET
when 83 => instruction_out <= x"00000780";

			when others => null;
		end case;
	end process;

end arch;
