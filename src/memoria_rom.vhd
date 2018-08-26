LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_signed.all;

ENTITY memoria_rom IS
	PORT( read : IN std_logic;
		   endereco : IN std_logic_vector(15 downto 0);
		   dado_out : OUT std_logic_vector(15 downto 0) --precisamos representar numeros de 0 a 65535, 2**16=65536
	);
END memoria_rom;

ARCHITECTURE implementacao OF memoria_rom IS
SIGNAL dado_lido_int : INTEGER RANGE 0 TO 65535;
BEGIN
PROCESS(read,endereco)
VARIABLE ende : INTEGER RANGE 0 TO (2**15):=0;
BEGIN
	ende := CONV_INTEGER(endereco);
	IF(read = '1')THEN
	   CASE ende IS	
	   WHEN	7	=>	dado_lido_int	<=	800	;
	   WHEN	8	=>	dado_lido_int	<=	800	;
	   WHEN	9	=>	dado_lido_int	<=	800	;
	   WHEN	10	=>	dado_lido_int	<=	800	;
	   WHEN	11	=>	dado_lido_int	<=	800	;
	   WHEN	12	=>	dado_lido_int	<=	800	;
	   WHEN	13	=>	dado_lido_int	<=	800	;
	   WHEN	14	=>	dado_lido_int	<=	800	;
	   WHEN	15	=>	dado_lido_int	<=	800	;
	   WHEN	16	=>	dado_lido_int	<=	800	;
	   WHEN	17	=>	dado_lido_int	<=	800	;
	   WHEN	18	=>	dado_lido_int	<=	800	; 
      WHEN 	OTHERS	=>	dado_lido_int <= 1024;
      END CASE;
	   END IF;
   END PROCESS;
	dado_out <= CONV_STD_LOGIC_VECTOR(dado_lido_int, 16);
END implementacao;