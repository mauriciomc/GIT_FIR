LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY mem_am IS
	PORT( read : IN std_logic;
		endereco : integer RANGE 0 TO 2047;
		dado: OUT std_logic_vector(15 downto 0)
	);
END mem_am;
ARCHITECTURE implementacao OF mem_am IS
SIGNAL dado_lido_int : INTEGER RANGE 0 TO 16383;
BEGIN
PROCESS(read,endereco)
BEGIN
	IF(read = '1')THEN
	CASE endereco IS	
	WHEN	0	=>	dado_lido_int	<=	4	;
	WHEN	1	=>	dado_lido_int	<=	5	;
	WHEN	2	=>	dado_lido_int	<=	2	;
	WHEN	3	=>	dado_lido_int	<=	3	;
	WHEN 	OTHERS	=>	dado_lido_int <= 0;
	END CASE;
	END IF;
END PROCESS;
	dado <= CONV_STD_LOGIC_VECTOR(dado_lido_int, 16);
END implementacao;
