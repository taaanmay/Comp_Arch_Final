----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/20/2020 09:36:04 AM
-- Design Name: 
-- Module Name: Mux_8to1_1_bit - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Mux_8to1_1_bit is
    Port ( Sel : in STD_LOGIC_VECTOR ( 2 downto 0);
           nC : in STD_LOGIC;
           nZ : in STD_LOGIC;
           N : in STD_LOGIC;
           Z : in STD_LOGIC;
           V : in STD_LOGIC;
           C : in STD_LOGIC;
           One : in STD_LOGIC;
           Zero : in STD_LOGIC;
           FlagOut : out STD_LOGIC);
end Mux_8to1_1_bit;

architecture Behavioral of Mux_8to1_1_bit is

begin

   FlagOut <= Zero after 1ns when Sel = "000" else
              One after 1ns when Sel = "001" else
              C after 1ns when Sel = "010" else
              V after 1ns when Sel = "011" else
              Z after 1ns when Sel = "100" else
              N after 1ns when Sel = "101" else
              nC after 1ns when Sel = "110" else
              nZ after 1ns when Sel = "111" else
              '0' after 1ns;

end Behavioral;
