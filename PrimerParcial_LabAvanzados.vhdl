-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

entity FullAdderSubtractor is 
    port(A,B,Cin: in bit;
        Cout,Sum: out bit);
end FullAdderSubtractor;

architecture Structure of FullAdderSubtractor is 

begin 

Cout <= (A and B) or (A and Cin) or (B and Cin);
Sum <= (A xor B) xor Cin;
end Structure;


entity Adder8 is 
port (A,B: in bit_vector(7 downto 0); T: in bit;
       Co,OverFlow: out bit;
       S: out bit_vector(7 downto 0));
end Adder8;


architecture Structure of Adder8 is 

component FullAdderSubtractor
    port(A,B,Cin: in bit;
        Cout,Sum: out bit);
end component;

signal C: bit_vector(7 downto 1);

begin 

OverFlow <= C(7) xor Co;

FA0: FullAdderSubtractor port map (A(0),B(0) xor T,T,C(1),S(0));
FA1: FullAdderSubtractor port map (A(1),B(1) xor T,C(1),C(2),S(1));
FA2: FullAdderSubtractor port map (A(2),B(2) xor T,C(2),C(3),S(2));
FA3: FullAdderSubtractor port map (A(3),B(3) xor T,C(3),C(4),S(3));
FA4: FullAdderSubtractor port map (A(4),B(4) xor T,C(4),C(5),S(4));
FA5: FullAdderSubtractor port map (A(5),B(5) xor T,C(5),C(6),S(5));
FA6: FullAdderSubtractor port map (A(6),B(6) xor T,C(6),C(7),S(6));
FA7: FullAdderSubtractor port map (A(7),B(7) xor T,C(7),Co,S(7));
end Structure;



