----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/20/2020 09:46:00 AM
-- Design Name: 
-- Module Name: CPSR - Behavioral
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

entity CPSR is
    Port ( V : in STD_LOGIC;
           C : in STD_LOGIC;
           N : in STD_LOGIC;
           Z : in STD_LOGIC;
           Flag_out : out STD_LOGIC;
           MS : in STD_LOGIC_VECTOR (2 downto 0));
end CPSR;

architecture Behavioral of CPSR is

begin
    Flag_out <= '0' after 1ns when MS = "000" else
                '1' after 1ns when MS = "001" else
                C after 1ns when MS = "010" else
                V after 1ns when MS = "011" else
                Z after 1ns when MS = "100" else
                N after 1ns when MS = "101" else
                (not C) after 1ns when MS = "110" else
                (not Z) after 1ns when MS = "111" else
                '0' after 1ns;

end Behavioral;
