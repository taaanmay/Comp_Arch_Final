----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/20/2020 09:22:33 AM
-- Design Name: 
-- Module Name: Mux_9to1 - Behavioral
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

entity Mux_9to1 is
Port ( Sel : in STD_LOGIC_VECTOR(3 downto 0);
           Reg1 : in STD_LOGIC_VECTOR(15 downto 0);
           Reg2 : in STD_LOGIC_VECTOR(15 downto 0);
           Reg3 : in STD_LOGIC_VECTOR(15 downto 0);
           Reg4 : in STD_LOGIC_VECTOR(15 downto 0);
           Reg5 : in STD_LOGIC_VECTOR(15 downto 0);
           Reg6 : in STD_LOGIC_VECTOR(15 downto 0);
           Reg7 : in STD_LOGIC_VECTOR(15 downto 0);
           Reg8 : in STD_LOGIC_VECTOR(15 downto 0);
           Reg9 : in STD_LOGIC_VECTOR(15 downto 0);
           Z : out STD_LOGIC_VECTOR(15 downto 0));

end Mux_9to1;

architecture Behavioral of Mux_9to1 is

begin

    Z <= Reg1 after 1ns when Sel = "0000" else
         Reg2 after 1ns when Sel = "0001" else
         Reg3 after 1ns when Sel = "0010" else
         Reg4 after 1ns when Sel = "0011" else
         Reg5 after 1ns when Sel = "0100" else
         Reg6 after 1ns when Sel = "0101" else
         Reg7 after 1ns when Sel = "0110" else
         Reg8 after 1ns when Sel = "0111" else
         Reg9 after 1ns when Sel = "1XXX" else
         x"0000" after 5ns;


end Behavioral;
