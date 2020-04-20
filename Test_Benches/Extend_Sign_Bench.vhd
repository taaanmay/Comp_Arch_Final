----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/20/2020 02:47:12 PM
-- Design Name: 
-- Module Name: Extend_Sign_Bench - Behavioral
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

entity Extend_Sign_Bench is
--  Port ( );
end Extend_Sign_Bench;

architecture Behavioral of Extend_Sign_Bench is

component extend_sign
      Port ( DR : in STD_LOGIC_VECTOR (2 downto 0);
             SB : in STD_LOGIC_VECTOR( 2 downto 0);
             Z : out STD_LOGIC_VECTOR ( 15 downto 0));
  end component;

  signal DR: STD_LOGIC_VECTOR (2 downto 0);
  signal SB: STD_LOGIC_VECTOR( 2 downto 0);
  signal Z: STD_LOGIC_VECTOR ( 15 downto 0);

  signal TIME_CYCLE: time := 200ns;  
begin

  uut: extend_sign port map ( DR => DR,
                              SB => SB,
                              Z  => Z );

  stim: process
  begin
    DR <= "011";
    SB <= "010";
    wait for TIME_CYCLE;
    DR <= "100";
    SB <= "101";
    wait for TIME_CYCLE;
    DR <= "001";
    wait for TIME_CYCLE;
    SB <= "011";
    wait;
  end process;



end Behavioral;
