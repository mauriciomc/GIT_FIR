LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;

ENTITY subtrator IS
	PORT (input1,input2: IN std_logic_vector(15 DOWNTO 0);
		out_alu: OUT std_logic_vector(15 DOWNTO 0);
		Cout: OUT std_logic);
END subtrator;

ARCHITECTURE implementacao OF subtrator IS
BEGIN
	PROCESS(input1,input2)
	VARIABLE vem1: std_logic;
	VARIABLE alu1,alu2: std_logic_vector(15 DOWNTO 0);
	VARIABLE carry: std_logic_vector(14 DOWNTO 0);
	BEGIN
		vem1:= '1'; 
                alu1 := input1;
		alu2 := not input2;
		-- SUBTRATOR completo
		out_alu(0) <= (alu1(0) xor alu2(0)) xor vem1;
		carry(0)   := (alu1(0) and alu2(0)) or (vem1 and (alu1(0) xor alu2(0)));
		out_alu(1) <= (alu1(1) xor alu2(1)) xor carry(0);
		carry(1)   := (alu1(1) and alu2(1)) or (carry(0) and (alu1(1) xor alu2(1)));
		out_alu(2) <= (alu1(2) xor alu2(2)) xor carry(1);
		carry(2)   := (alu1(2) and alu2(2)) or (carry(1) and (alu1(2) xor alu2(2)));
		out_alu(3) <= (alu1(3) xor alu2(3)) xor carry(2);
		carry(3)   := (alu1(3) and alu2(3)) or (carry(2) and (alu1(3) xor alu2(3)));
		out_alu(4) <= (alu1(4) xor alu2(4)) xor carry(3);
		carry(4)   := (alu1(4) and alu2(4)) or (carry(3) and (alu1(4) xor alu2(4)));
		out_alu(5) <= (alu1(5) xor alu2(5)) xor carry(4);
		carry(5)   := (alu1(5) and alu2(5)) or (carry(4) and (alu1(5) xor alu2(5)));
		out_alu(6) <= (alu1(6) xor alu2(6)) xor carry(5);
		carry(6)   := (alu1(6) and alu2(6)) or (carry(5) and (alu1(6) xor alu2(6)));
		out_alu(7) <= (alu1(7) xor alu2(7)) xor carry(6);
		carry(7)   := (alu1(7) and alu2(7)) or (carry(6) and (alu1(7) xor alu2(7)));
		out_alu(8) <= (alu1(8) xor alu2(8)) xor carry(7);
		carry(8)   := (alu1(8) and alu2(8)) or (carry(7) and (alu1(8) xor alu2(8)));
		out_alu(9) <= (alu1(9) xor alu2(9)) xor carry(8);
		carry(9)   := (alu1(9) and alu2(9)) or (carry(8) and (alu1(9) xor alu2(9)));
		out_alu(10) <= (alu1(10) xor alu2(10)) xor carry(9);
		carry(10)   := (alu1(10) and alu2(10)) or (carry(9) and (alu1(10) xor alu2(10)));
		out_alu(11) <= (alu1(11) xor alu2(11)) xor carry(10);
		carry(11)   := (alu1(11) and alu2(11)) or (carry(10) and (alu1(11) xor alu2(11)));
		out_alu(12) <= (alu1(12) xor alu2(12)) xor carry(11);
		carry(12)   := (alu1(12) and alu2(12)) or (carry(11) and (alu1(12) xor alu2(12)));
		out_alu(13) <= (alu1(13) xor alu2(13)) xor carry(12);
		carry(13)   := (alu1(13) and alu2(13)) or (carry(12) and (alu1(13) xor alu2(13)));
		out_alu(14) <= (alu1(14) xor alu2(14)) xor carry(13);
		carry(14)   := (alu1(14) and alu2(14)) or (carry(13) and (alu1(14) xor alu2(14)));
		out_alu(15) <= (alu1(15) xor alu2(15)) xor carry(14);
		Cout   <= (alu1(14) and alu2(15)) or (carry(14) and (alu1(15) xor alu2(15)));
	END PROCESS;
END implementacao;