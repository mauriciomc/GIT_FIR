LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE ieee.std_logic_signed.all;

ENTITY somador IS
	PORT (input1,input2: IN std_logic_vector(15 DOWNTO 0);
	    clock: IN std_logic;
		out_alu: OUT std_logic_vector(15 DOWNTO 0);
		c_out: OUT std_logic);
END somador;

ARCHITECTURE implementacao OF somador IS
BEGIN
	PROCESS(clock, input1, input2)
	VARIABLE in1,in2,saida_ula: INTEGER RANGE 0 TO (2**16):=0 ;
	VARIABLE carry: std_logic_vector(14 DOWNTO 0);
	BEGIN
	 in1 := CONV_INTEGER(input1); 
	 in2 := CONV_INTEGER(input2);	
	 saida_ula:= in1+in2;
	 out_alu <= CONV_STD_LOGIC_VECTOR(saida_ula, 16);
	 c_out <= '0';
	END PROCESS;
END implementacao;
