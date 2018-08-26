LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY registrador IS
	PORT ( 	input: IN std_logic_vector(15 DOWNTO 0);
		load, zera, clock: IN std_logic;
		output: OUT std_logic_vector(15 DOWNTO 0));
END registrador;

ARCHITECTURE implementacao OF registrador IS
BEGIN
	PROCESS(clock)
	BEGIN
		IF (clock='1' and clock'EVENT) THEN
			IF (load='1') THEN
				output <= input;
			END IF;	
			IF (zera='1') THEN
				output <= "0000000000000000";
			END IF;	
		END IF;	
	END PROCESS;
END implementacao;