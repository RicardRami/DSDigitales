library ieee;
use ieee.std_logic_1164.all;
entity estados is port(
reset: in std_logic;
x1: in bit_vector(1 downto 0);
clk: in std_logic;
z: out std_logic);
end entity;
architecture maquina of estados is
type estado is(A, B, C, D);
signal actual, prox: estado;
begin
next_state: process(reset,clk)
begin
if rising_edge(clk) then
if reset='1' then actual<=A;
else actual <= prox;
end if;
end if;
end process next_state;

output_state:process(actual,x1)
begin
case actual is
when A => z <= '0';
if x1 = "01" then prox <= B;
else prox <= A;
end if;
when B => z <='0';
if x1 = "11"then prox <= C;
else prox <= B;
end if;
when C => z <='0';
if x1 = "10"then prox <= D;
else prox <= C;
end if;
when D => z <='0';
if x1 = "00"then prox <= A;
else prox <= D;
end if;
end case;
end process output_state;
end architecture maquina;