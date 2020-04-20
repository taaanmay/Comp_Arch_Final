----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/14/2020 10:54:22 AM
-- Design Name: 
-- Module Name: decoder_3to8tb - Behavioral
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

entity decoder_3to8tb is

end decoder_3to8tb;
 architecture Behavioral of decoder_3to8tb is
   component decoder_3to8
         Port ( S2 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           S0 : in STD_LOGIC;
           R0 : out STD_LOGIC;
           R1 : out STD_LOGIC;
           R2 : out STD_LOGIC;
           R3 : out STD_LOGIC;
           R4 : out STD_LOGIC;
           R5 : out STD_LOGIC;
           R6 : out STD_LOGIC;
           R7 : out STD_LOGIC);
end component;

    -- inputs
    signal S0 : STD_LOGIC := '0' ;
    signal S1 : STD_LOGIC := '0' ;
    signal S2 : STD_LOGIC := '0' ;
    -- outputs
    signal R0 : STD_LOGIC;
    signal R1 : STD_LOGIC;
    signal R2 : STD_LOGIC;
    signal R3 : STD_LOGIC;
    signal R4 : STD_LOGIC;
    signal R5 : STD_LOGIC;
    signal R6 : STD_LOGIC;
    signal R7 : STD_LOGIC;
    
    constant TIME_CYCLE: time := 15ns;

begin
    uut: decoder_3to8 port map(
    S0 => S0,
    S1 => S1,
    S2 => S2,
    R0 => R0,
    R1 => R1,
    R2 => R2,
    R3 => R3,
    R4 => R4,
    R5 => R5,
    R6 => R6,
    R7 => R7
    );
    
    simul : process
    begin
        wait for TIME_CYCLE;
        S2 <= '1';
        wait for TIME_CYCLE;
        S2<='0';
        S1<='1';
        wait for TIME_CYCLE;
        S2<='1';
        wait for TIME_CYCLE;
        S2<='0';
        S1<='0';
        S0<='1';
        wait for TIME_CYCLE;
        S2<='1';
        wait for TIME_CYCLE;
        S2<='0';
        S1<='1';
        wait for TIME_CYCLE;
        S2<='1';
    end process;

end Behavioral;
