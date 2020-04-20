----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/20/2020 09:13:37 AM
-- Design Name: 
-- Module Name: Mux_2to1_8_bit - Behavioral
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

entity Mux_2to1_8_bit is
 Port ( Sel : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR(7 downto 0);
           B : in STD_LOGIC_VECTOR(7 downto 0);
           Z : out STD_LOGIC_VECTOR(7 downto 0));
end Mux_2to1_8_bit;

architecture Behavioral of Mux_2to1_8_bit is

begin
    Z <= A after 1ns when Sel ='0' else
         B after 1ns when Sel ='1' else
         x"00" after 1ns;

end Behavioral;
