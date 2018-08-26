LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;

ENTITY fir IS
	PORT (A, N_inicio,N_fim: IN std_logic_vector (15 downto 0);
		iniciar, clk : IN std_logic;
		read_ROM, write_RAM, pronto : OUT std_logic;  
		dado_escrita: OUT std_logic_vector(15 downto 0);
		dado_leitura: IN std_logic_vector(15 downto 0)); 
		
		-- dado_escrita e dado_leitura serve para efeito de colocar 
		-- as memorias externamente ao circuito de filtragem.
		
END fir;

ARCHITECTURE implementacao OF fir IS


COMPONENT registrador PORT(input : IN std_logic_vector(15 downto 0); load, zera, clock : IN std_logic;
	output : OUT std_logic_vector (15 downto 0));
END COMPONENT;

COMPONENT mux2_1 PORT(input0, input1: IN std_logic_vector(15 downto 0); seletor: IN std_logic;
	output : OUT std_logic_vector(15 downto 0));
END COMPONENT;

COMPONENT comparador PORT(input1,input2 : IN std_logic_vector(15 downto 0);
	output : OUT std_logic);
END COMPONENT;

COMPONENT somador PORT(input1, input2 : IN std_logic_vector(15 downto 0); clock : IN std_logic;
	out_alu : OUT std_logic_vector(15 downto 0) ; c_out : OUT std_logic);
END COMPONENT;

COMPONENT memoria_rom PORT(read : IN std_logic; endereco : IN std_logic_vector(15 downto 0); 
   dado_out : OUT std_logic_vector(15 downto 0)); 
END COMPONENT;

COMPONENT memoria_read_write PORT(data : IN std_logic_vector(15 downto 0); read_write, enable,clock : IN std_logic; adress : IN std_logic_vector(15 downto 0); 
   output : OUT std_logic_vector(15 downto 0));
END COMPONENT;
   
COMPONENT subtrator PORT(input1,input2:IN std_logic_vector(15 downto 0); 
   out_alu : OUT std_logic_vector(15 downto 0);cout : OUT std_logic); 
END COMPONENT;

COMPONENT multiplicador PORT(input1,input2:IN std_logic_vector(15 downto 0); 
   out_mult : OUT std_logic_vector(15 downto 0);cout : OUT std_logic); 
END COMPONENT;

      
SIGNAL out_sub,dados_ROM,out_m2,out_ar,out_acc,out_mult,out_br,dados_RAM,out_soma,out_m1,out_end, out_pr : std_logic_vector(15 downto 0);
SIGNAL soma_1 : std_logic_vector(15 downto 0) := "0000000000000001";
SIGNAL sinais_de_controle : std_logic_vector(10 downto 0) := "0001-001000";
SIGNAL prox_st: std_logic_vector(2 downto 0) :="000";
SIGNAL st: std_logic_vector(2 downto 0);
SIGNAL cout : std_logic;

SIGNAL Ni : std_logic_vector(15 downto 0) := "0000000000001010";
SIGNAL Nf : std_logic_vector(15 downto 0) := "0000000000001100";
SIGNAL A_CONST : std_logic_vector(15 downto 0) := "0000000110010000"; 
SIGNAL clear : std_logic:='0'; 
SIGNAL enable : std_logic:='1';
SIGNAL comparacao,csoma : std_logic ;

--sinais Ni,Nf e A sao pre-definidos para efeito de testes , A inicial = 0,4 = 400x10**(-2)

BEGIN
PROCESS (clk)
BEGIN

	IF(clk='1' AND clk'EVENT) THEN
		st <= prox_st;
	END IF;	
END PROCESS;

PROCESS(st,iniciar)
BEGIN
    CASE st IS
        
        WHEN "000" => sinais_de_controle <= "1001-001000";
           IF(iniciar='0') THEN
              prox_st<= "000";
           ELSE
              prox_st<="001";
           END IF;
           
        WHEN "001" => sinais_de_controle <= "10010-10000";
            prox_st <= "010";
            
        WHEN "010" => sinais_de_controle <= "00010101000";
            prox_st <= "011";

        WHEN "011" => sinais_de_controle <= "1001--00001";
            prox_st <= "100";
            
        WHEN "100" => sinais_de_controle <= "1000--00010";
            prox_st <= "101";
            
        WHEN "101" => sinais_de_controle <= "10001-10100";
            IF(comparacao = '1')THEN
                prox_st <= "110";
            ELSE
               prox_st <= "111";
            END IF;  
        WHEN "110" => sinais_de_controle <= "1100--00000";
            prox_st <= "000";
                     
        WHEN "111" => sinais_de_controle <= "1010--00000";
            prox_st <= "010";
        WHEN OTHERS => prox_st <= "000";
            
   END CASE;
END PROCESS;

PROCESS(sinais_de_controle(9))
BEGIN
   pronto <= sinais_de_controle(9);           
END PROCESS;
--UNIDADE OPERACIONAL
AR: registrador PORT MAP(dados_ROM,sinais_de_controle(0),clear,clk,out_ar);
BR: registrador PORT MAP(out_mult,sinais_de_controle(1),clear,clk,out_br);
CR: registrador PORT MAP(out_sub,sinais_de_controle(2),clear,clk,dados_RAM);
NR: registrador PORT MAP(out_m1,sinais_de_controle(3),clear,clk,out_end);
ACC: registrador PORT MAP(out_m2,sinais_de_controle(4),clear,clk,out_acc);
PR: registrador PORT MAP(out_soma,sinais_de_controle(10),clear,clk,out_pr);
MUX1: mux2_1 PORT MAP(Ni,out_pr,sinais_de_controle(5),out_m1);
MUX2: mux2_1 PORT MAP(dados_ROM,out_ar,sinais_de_controle(6),out_m2);
ROM: memoria_rom PORT MAP(sinais_de_controle(7),out_end,dados_ROM);
RAM: memoria_read_write PORT MAP(dados_RAM,sinais_de_controle(8),enable,clk,out_end,dado_escrita);
sub: subtrator PORT MAP(out_ar,out_br,out_sub,cout);
mult: multiplicador PORT MAP(A_CONST,out_acc,out_mult);
soma: somador PORT MAP(out_end, soma_1 , clk, out_soma, csoma);
comp: comparador PORT MAP(Nf,out_end,comparacao);

END implementacao;




        
        
        
            
        
