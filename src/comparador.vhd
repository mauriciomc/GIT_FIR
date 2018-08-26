LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY comparador IS
	PORT (input1,input2: IN std_logic_vector(15 DOWNTO 0);
		output: OUT std_logic);
END comparador;

ARCHITECTURE implementacao OF comparador IS
BEGIN
	output <= not ((input1(0) xor input2(0)) or (input1(1) xor input2(1)) or (input1(2) xor input2(2))or (input1(3) xor input2(3))or (input1(4) xor input2(4)) or (input1(4) xor input2(4)) or (input1(5) xor input2(5)) or (input1(6) xor input2(6)) or (input1(7) xor input2(7)) or (input1(8) xor input2(8)) or (input1(9) xor input2(9)) or (input1(10) xor input2(10)) or (input1(11) xor input2(11)) or (input1(12) xor input2(12)) or (input1(13) xor input2(13)) or (input1(14) xor input2(14))or (input1(15) xor input2(15)));
	END implementacao;


-- output será 1 se todos os numeros forem iguais

















