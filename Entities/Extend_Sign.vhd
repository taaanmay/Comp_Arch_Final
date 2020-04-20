----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/20/2020 09:16:05 AM
-- Design Name: 
-- Module Name: Extend_Sign - Behavioral
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

entity Extend_Sign is

Port ( DR : in STD_LOGIC_VECTOR (2 downto 0);
           SB : in STD_LOGIC_VECTOR( 2 downto 0);
           Z : out STD_LOGIC_VECTOR ( 15 downto 0));
end Extend_Sign;

architecture Behavioral of Extend_Sign is

begin

 Z(2 downto 0) <= SB after 1ns;
 Z(5 downto 3) <= DR after 1ns;
 Z(15 downto 6) <= "0000000000" after 1ns when DR(2) = '0' else
                   "1111111111" after 1ns when DR(2) = '1' else
                   "0000000000" after 1ns; 

end Behavioral;
