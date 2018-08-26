LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_signed.ALL;

ENTITY mem IS
	PORT(DATA: IN std_logic_vector(15 DOWNTO 0);
		read_write: IN std_logic;
		enable: IN std_logic;
		clock: IN std_logic;
		adress: IN std_logic_vector(15 DOWNTO 0);
		output: OUT std_logic_vector(15 DOWNTO 0));
END mem;

ARCHITECTURE implement OF  mem IS
TYPE memory_array_type IS ARRAY(0 TO (2**(10)-1)) OF std_logic_vector(15 DOWNTO 0);
SIGNAL memory_array: memory_array_type;
BEGIN
	PROCESS(clock,enable,adress)
	VARIABLE temp: INTEGER;
	BEGIN
		IF(clock='1' AND clock'EVENT)THEN
			IF(enable='0')THEN
				IF(read_write='1') THEN--WRITE
					temp := CONV_INTEGER(adress);
					memory_array(temp) <= DATA;
				ELSIF(read_write='0')THEN--READ
						temp := CONV_INTEGER(adress);
						output <= memory_array(temp);
				END IF;
			END IF;
		END IF;	
	END PROCESS;
END implement;
