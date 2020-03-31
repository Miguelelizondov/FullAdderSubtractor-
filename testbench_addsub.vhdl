library ieee;
use ieee.std_logic_1164.all;

entity addsub_tb is 
end addsub_tb;

architecture arch of addsub_tb is
    component Adder8 is 
       port (A,B: in bit_vector(7 downto 0); T: in bit;
       Co,OverFlow: out bit;
       S: out bit_vector(7 downto 0));
    end component;
    signal A,B: bit_vector(7 downto 0);
    signal T: bit;
    signal Co, OverFlow: bit;
    signal S: bit_vector(7 downto 0);
begin
    FS0 : Adder8 port map (A,B,T,Co,OverFlow,S);
    process
    begin
        --SUMA POSITIVO/POSITIVO
        T<='0';
        A<="00011111";
        B<="00001001";
        wait for 5 ns;
        A<="00001001";
        B<="00001001";
        wait for 5 ns;
        --SUMA POSITIVO/NEGATIVO
        A<="00011111";
        B<="10000011";
        wait for 5 ns;
        A<="00000011";
        B<="11111111";
        wait for 5 ns;
        --SUMA NEGATIVO/POSITIVO
        A<="10000011";
        B<="00011111";
        wait for 5 ns;
        A<="11111111";
        B<="00000101";
        wait for 5 ns;
        --SUMA OVERFLOW
        A<="01111111";
        B<="00000111";
        wait for 5 ns;
        A<="10100111";
        B<="10001000";
        wait for 5 ns;
        --RESTA OVERFLOW
        T<='1';
        A<="01111101";
        B<="11110011";
        wait for 5 ns;
        A<="10000000";
        B<="00000111";
        wait for 5 ns;
        --SUMA COUT
        T<='0';
        A<="11111111";
        B<="00000111";
        wait for 5 ns;
        A<="11111111";
        B<="10000111";
        wait for 5 ns;
        --RESTA COUT
        T<='1';
        A<="00111111";
        B<="00111111";
        wait for 5 ns;
        A<="11101001";
        B<="01010111";
        wait for 5 ns;
        wait; 
        
    end process; 
end arch;