----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2020 01:13:22 PM
-- Design Name: 
-- Module Name: Mux_4to1 - Behavioral
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

entity Mux_4to1 is
 Port ( S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           X0 : in STD_LOGIC;
           X1 : in STD_LOGIC;
           X2 : in STD_LOGIC;
           X3 : in STD_LOGIC;
           Z1 : out STD_LOGIC);
end Mux_4to1;

architecture Behavioral of Mux_4to1 is

begin
    Z1 <= X0 after 1ns when S0 = '0' and S1 = '0' else
          X1 after 1ns when S0 = '1' and S1 = '0' else
          X2 after 1ns when S0 = '0' and S1 = '1' else
          X3 after 1ns when S0 = '1' and S1 = '1' else
          '0' after 1ns;

end Behavioral;
