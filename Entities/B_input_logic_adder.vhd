----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2020 03:46:14 PM
-- Design Name: 
-- Module Name: B_input_logic_adder - Behavioral
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

entity B_input_logic_adder is
    Port ( B : in STD_LOGIC;
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           Z : out STD_LOGIC);
end B_input_logic_adder;

architecture Behavioral of B_input_logic_adder is

begin
    Z <= '0' after 1ns when S0 = '0' and S1 = '0' else
          B  after 1ns when S0 = '1' and S1 = '0' else
          not B after 1ns when S0 = '0' and S1 = '1' else
          '1' after 1ns when S0 = '1' and S1 = '1' else
          '0' after 1ns;

end Behavioral;
