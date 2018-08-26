LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE ieee.std_logic_signed.all;

ENTITY multiplicador IS
	PORT (input1,input2: IN std_logic_vector(15 DOWNTO 0);
		out_mult: OUT std_logic_vector(15 DOWNTO 0)
		);
		
END multiplicador;

ARCHITECTURE implementacao OF multiplicador IS
BEGIN
	PROCESS(input1,input2)
	VARIABLE ent1,ent2, out_res: std_logic_vector(15 DOWNTO 0);
	VARIABLE mult1,mult2,res : INTEGER RANGE 0 TO (2**30):=0;
	BEGIN
   mult1 := CONV_INTEGER(input1);
   mult2 := CONV_INTEGER(input2);
  
   IF(mult1<400)then
       mult1:=400;
   END IF;
   IF(mult1>1000)then
       mult1:=1000;
   END IF;
   res := mult1*mult2;
   res := res/1000;
   
   out_res := CONV_STD_LOGIC_VECTOR(res, 16);
	out_mult <= out_res;
	
	END PROCESS;
END implementacao;

