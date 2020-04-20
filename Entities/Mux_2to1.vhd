----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2020 12:50:18 PM
-- Design Name: 
-- Module Name: Mux_2to1 - Behavioral
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

entity Mux_2to1 is
      Port ( D0 : in STD_LOGIC;
           D1 : in STD_LOGIC;
           Z : out STD_LOGIC;
           Sel : in STD_LOGIC);
end Mux_2to1;

architecture Behavioral of Mux_2to1 is
begin
    Z <= D0 after 1ns when Sel ='0' else
         D1 after 1ns when Sel ='1' else
         '0' after 1ns;
end Behavioral;
