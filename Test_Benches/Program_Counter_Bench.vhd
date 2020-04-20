----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/20/2020 02:40:36 PM
-- Design Name: 
-- Module Name: Program_Counter_Bench - Behavioral
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

entity Program_Counter_Bench is
--  Port ( );
end Program_Counter_Bench;

architecture Behavioral of Program_Counter_Bench is

component program_counter
    Port ( PL : in STD_LOGIC;
           PI : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Displacement : in STD_LOGIC_VECTOR (15 downto 0);
           Instr_out : out STD_LOGIC_VECTOR (15 downto 0);
           Reset: in STD_LOGIC
           );
  end component;

  signal PL: STD_LOGIC := '0';
  signal PI: STD_LOGIC := '0';
  signal Clk: STD_LOGIC := '0';
  signal Displacement: STD_LOGIC_VECTOR (15 downto 0) := x"0A3F";
  signal Instr_out: STD_LOGIC_VECTOR (15 downto 0) ;
  signal Reset: STD_LOGIC := '1' ;

  signal TIME_CYCLE : time := 400ns;
begin
  
  uut: program_counter port map ( PL           => PL,
                                  PI           => PI,
                                  Clk          => Clk,
                                  Displacement => Displacement,
                                  Instr_out    => Instr_out,
                                  Reset        => Reset );
  clock : process
  begin
    wait for TIME_CYCLE/2;
    Clk <= not Clk;
  end process;
  
  stim: process
  begin
    wait for TIME_CYCLE;
    Reset <= '0';
    wait for TIME_CYCLE;
    PI <= '1';
    wait for TIME_CYCLE;
    wait for TIME_CYCLE;
    PI <= '0';
    PL <= '1';
    wait for TIME_CYCLE;
    wait for TIME_CYCLE;
    PL <= '0';
    PI <= '1';
    wait for TIME_CYCLE;
    wait;
  end process;




end Behavioral;
