library IEEE;
use IEEE.std_logic_1164.all;
entity detector is
port( Y : out std_logic;
state : out std_logic_vector(2 downto 0);
X : in std_logic;
reset : in std_logic;
clk : in std_logic);
end entity detector;
architecture detector of detector is
signal internal_state: std_logic_vector(2 downto 0);
begin
state <= internal_state;
--Cálculo del próximo estado
proximo_estado: process (clk, reset)
begin
if reset = '1' then --reset asíncrono
internal_state <= "000";
elsif (rising_edge(clk)) then
case internal_state is
when "000" => -- Estado actual: S0
if X = '1' then
internal_state <= "000";
else
internal_state <= "001";
end if;
when "001" => --Estado actual: S1
if X = '1' then
internal_state <= "010";
else
internal_state <= "001";
end if;
when "010" => --Estado actual: S2
if X = '1' then
internal_state <= "000";
else
internal_state <= "011";
end if;
when "011" => -- Estado actual: S3
if X = '1' then
internal_state <= "010";
else
internal_state <= "100";
end if;
when "100" => -- Estado actual: S4
if X = '1' then
internal_state <= "010";
else
internal_state <= "001";
end if;
when others=> -- Por completitud
internal_state <= "000";
end case;
end if;
end process proximo_estado;
--Cálculo salida
salida: process (internal_state)
begin
case internal_state is
when "100" => Y <= '1';
when others => Y <= '0';
end case;
end process salida;

end architecture detector;