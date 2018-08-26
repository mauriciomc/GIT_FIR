LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY mux2_1 IS
	PORT ( 	input0,input1: IN std_logic_vector(15 DOWNTO 0);
		seletor: IN std_logic;
		output: OUT std_logic_vector(15 DOWNTO 0));
END mux2_1;

ARCHITECTURE implementacao OF mux2_1 IS
BEGIN
	PROCESS(input0,input1,seletor)
	BEGIN
		CASE seletor IS
			WHEN '0' => output<=input0;
			WHEN '1' => output<=input1;
			WHEN OTHERS => output<=input0;
		END CASE;
	END PROCESS;
END implementacao;
