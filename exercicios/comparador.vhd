-- Simple Lock design
library IEEE;
use IEEE.std_logic_1164.all;
entity locker is
port(
s1: in std_logic_vector(3 downto 0);
s2: in std_logic_vector(3 downto 0);
s3: in std_logic_vector(3 downto 0);
q: out std_logic);
end locker;
--Senha: 149
architecture locker_arch of locker is
signal locks : std_logic_vector(1 to 3);
begin
locks(1) <= '1' when (s1 = "0001") else '0';
locks(2) <= '1' when (s2 = "0100") else '0';
locks(3) <= '1' when (s3 = "1001") else '0';
q <= locks(1) and locks(2) and locks(3);
end locker_arch;