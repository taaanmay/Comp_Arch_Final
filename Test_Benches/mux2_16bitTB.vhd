----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/12/2020 01:34:00 PM
-- Design Name: 
-- Module Name: Mux2_16bitTB - Behavioral
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

entity Mux2_16bitTB is
--  Port ( );
end Mux2_16bitTB;

architecture Behavioral of Mux2_16bitTB is

    -- Component Declaration for the Unit Under Test (UUT)
 
  COMPONENT Mux2_16bit
  Port ( D0 : in STD_LOGIC_VECTOR(15 downto 0);
           D1 : in STD_LOGIC_VECTOR(15 downto 0);
           Z : out STD_LOGIC_VECTOR(15 downto 0);
           Sel : in STD_LOGIC);
end component;

    -- input
    signal D0 : STD_LOGIC_VECTOR(15 downto 0) := x"ABCD";
    signal D1 : STD_LOGIC_VECTOR(15 downto 0) := x"1234";
    signal Sel : STD_LOGIC := '0';
    
    -- output
    signal Z : STD_LOGIC_VECTOR(15 downto 0);
    
    constant TIME_CYCLE: time := 10ns;
    
begin
    uut: Mux2_16bit port map(
    D0 => D0,
    D1 => D1,
    Z => Z,
    Sel => Sel
    );
    
    simul: process
    begin
        wait for TIME_CYCLE;
        Sel <= '1';
        wait for TIME_CYCLE;
        Sel <= '0';
    end process;
end Behavioral;
