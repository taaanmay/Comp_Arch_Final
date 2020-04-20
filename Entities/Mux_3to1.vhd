----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2020 12:53:58 PM
-- Design Name: 
-- Module Name: Mux_3to1 - Behavioral
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

entity Mux_3to1 is
Port ( S : in STD_LOGIC_VECTOR (1 downto 0);
           X0 : in STD_LOGIC;
           X1 : in STD_LOGIC;
           X2 : in STD_LOGIC;
           Z : out STD_LOGIC);
end Mux_3to1;

architecture Behavioral of Mux_3to1 is

begin
    Z <=  X0 after 1ns when S = "00" else
          X1 after 1ns when S = "01" else
          X2 after 1ns when S = "10" else
          '0' after 1ns;
end Behavioral;
