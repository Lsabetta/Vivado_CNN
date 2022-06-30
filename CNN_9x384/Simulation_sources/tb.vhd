----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/06/2022 06:11:19 PM
-- Design Name: 
-- Module Name: tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.my_types.ALL;
use work.fixed_generic_pkg.all;
--use work.fixed_float_types.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb is
--  Port ( );
end tb;

architecture Behavioral of tb is

signal tb_clock :  std_logic;
signal tb_rst : std_logic;
signal tb_Input_image :  STD_LOGIC_VECTOR(4234 downto 0);
signal tb_output1 : sfixed(0 downto -31);
signal tb_output2 :  sfixed(0 downto -31);

begin

tb_inst : entity work.CNN
port map(
clock => tb_clock,
rst =>tb_rst,
Input_image => tb_Input_image,

output1 => tb_output1,
output2 => tb_output2
);

clock400_gen: process
begin
    tb_clock <= '1';
    wait for 2.5 ns;
    tb_clock <= '0';
    wait for 2.5 ns;
end process;



Input_loading: process
begin
tb_Input_image <= (others => '0');

tb_Input_image(385*1+9)  <= '1';
tb_Input_image(385*2+9)  <= '1';
tb_Input_image(385*3+9)  <= '1';
tb_Input_image(385*4+9)  <= '1';
tb_Input_image(385*5+9)  <= '1';
tb_Input_image(385*6+9)  <= '1';
tb_Input_image(385*7+9)  <= '1';
tb_Input_image(385*8+9)  <= '1';
tb_Input_image(385*9+9)  <= '1';
wait;
end process;

end Behavioral;

